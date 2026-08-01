library ytmusic_client.core.domain.queue_controller;

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import '../../shared/models/track.dart';
import '../data/innertube_client.dart';
import '../data/stream_extractor.dart';

final _logger = Logger('QueueController');

class QueueController {
  final InnerTubeClient _innerTube;
  final StreamExtractor _streamExtractor;
  final _stateController = StreamController<QueueState>.broadcast();
  QueueState _currentState;
  Timer? _preloadTimer;
  int _preloadThresholdPercent = 80;

  QueueController({
    required InnerTubeClient innerTube,
    required StreamExtractor streamExtractor,
    QueueState? initialState,
  })  : _innerTube = innerTube,
        _streamExtractor = streamExtractor,
        _currentState = initialState ?? QueueState(
          currentTrack: Track.empty(),
          queueList: [],
          index: 0,
        ) {
    _stateController.add(_currentState);
  }

  Stream<QueueState> get stateStream => _stateController.stream;
  QueueState get currentState => _currentState;

  Future<void> playTrack(Track track, {List<Track>? queue, bool isRadio = false}) async {
    _logger.info('Playing track: ${track.title}');
    
    final stream = await _streamExtractor.getBestAudioStream(track.id);
    if (stream == null) {
      throw Exception('No playable stream found for ${track.id}');
    }

    final updatedTrack = track.copyWith(audioStreamUrl: stream.url);
    List<Track> newQueue = queue ?? [updatedTrack];
    
    if (!newQueue.any((t) => t.id == updatedTrack.id)) {
      newQueue.insert(0, updatedTrack);
    }

    _currentState = _currentState.copyWith(
      currentTrack: updatedTrack,
      queueList: newQueue,
      index: 0,
      isRadioActive: isRadio,
      currentPosition: 0.0,
    );
    _stateController.add(_currentState);

    if (isRadio) {
      await _fetchRadioContinuation(updatedTrack.id);
    }
    
    _startPreloadMonitoring();
  }

  Future<void> playQueue(List<Track> queue, {int startIndex = 0, bool isRadio = false}) async {
    if (queue.isEmpty) return;
    
    final firstTrack = queue[startIndex];
    await playTrack(firstTrack, queue: queue, isRadio: isRadio);
  }

  Future<void> next() async {
    if (_currentState.index < _currentState.queueList.length - 1) {
      await _playAtIndex(_currentState.index + 1);
    } else if (_currentState.isRadioActive && _currentState.continuationToken != null) {
      await _loadMoreRadioTracks();
    }
  }

  Future<void> previous() async {
    if (_currentState.index > 0) {
      await _playAtIndex(_currentState.index - 1);
    }
  }

  Future<void> _playAtIndex(int index) async {
    if (index < 0 || index >= _currentState.queueList.length) return;
    
    final track = _currentState.queueList[index];
    final stream = await _streamExtractor.getBestAudioStream(track.id);
    if (stream == null) {
      _logger.warning('No stream for track at index $index, skipping');
      if (index < _currentState.queueList.length - 1) {
        await _playAtIndex(index + 1);
      }
      return;
    }

    final updatedTrack = track.copyWith(audioStreamUrl: stream.url);
    _currentState = _currentState.copyWith(
      currentTrack: updatedTrack,
      index: index,
      currentPosition: 0.0,
    );
    _stateController.add(_currentState);
    
    _startPreloadMonitoring();
  }

  Future<void> _fetchRadioContinuation(String videoId) async {
    try {
      final response = await _innerTube.next(videoId: videoId);
      _parseNextResponse(response);
    } catch (e) {
      _logger.warning('Failed to fetch radio continuation: $e');
    }
  }

  Future<void> _loadMoreRadioTracks() async {
    if (_currentState.continuationToken == null) return;
    
    try {
      final response = await _innerTube.next(
        videoId: _currentState.currentTrack.id,
        params: _currentState.continuationToken,
      );
      _parseNextResponse(response);
    } catch (e) {
      _logger.warning('Failed to load more radio tracks: $e');
    }
  }

  void _parseNextResponse(Map<String, dynamic> response) {
    final contents = response['contents']?['singleColumnMusicWatchNextRenderer']?['tabbedRenderers']?[0]?['tabRenderer']?['content']?['musicQueueRenderer']?['content']?['playlistPanelRenderer']?['contents'];
    
    if (contents != null) {
      final newTracks = <Track>[];
      for (final item in contents) {
        final track = _parseQueueItem(item);
        if (track != null) newTracks.add(track);
      }
      
      if (newTracks.isNotEmpty) {
        final currentQueue = List<Track>.from(_currentState.queueList);
        currentQueue.addAll(newTracks);
        
        final continuation = _extractContinuation(response);
        
        _currentState = _currentState.copyWith(
          queueList: currentQueue,
          continuationToken: continuation,
        );
        _stateController.add(_currentState);
      }
    }
  }

  Track? _parseQueueItem(Map<String, dynamic> item) {
    try {
      final renderer = item['playlistPanelVideoRenderer'] ?? item['musicQueueItemRenderer'];
      if (renderer == null) return null;

      final videoId = renderer['videoId'] as String?;
      final title = renderer['title']?['runs']?[0]?['text'] as String? ?? renderer['title']?['simpleText'] as String?;
      final artist = renderer['longBylineText']?['runs']?[0]?['text'] as String? ?? renderer['shortBylineText']?['runs']?[0]?['text'] as String?;
      final artistId = renderer['longBylineText']?['runs']?[0]?['navigationEndpoint']?['browseEndpoint']?['browseId'] as String?;
      final duration = _parseDuration(renderer['lengthText']?['simpleText'] as String?);
      final artwork = renderer['thumbnail']?['thumbnails']?.last?['url'] as String?;
      
      if (videoId == null || title == null || artist == null) return null;

      return Track(
        id: videoId,
        title: title,
        artist: artist,
        artistId: artistId ?? '',
        duration: duration,
        artworkUrl: artwork ?? '',
      );
    } catch (e) {
      _logger.warning('Failed to parse queue item: $e');
      return null;
    }
  }

  String? _extractContinuation(Map<String, dynamic> response) {
    try {
      return response['contents']?['singleColumnMusicWatchNextRenderer']?['tabbedRenderers']?[0]?['tabRenderer']?['content']?['musicQueueRenderer']?['content']?['playlistPanelRenderer']?['continuations']?[0]?['nextContinuationData']?['continuation'] as String?;
    } catch (_) {
      return null;
    }
  }

  int _parseDuration(String? durationText) {
    if (durationText == null) return 0;
    final parts = durationText.split(':').map(int.parse).toList();
    if (parts.length == 2) return parts[0] * 60 + parts[1];
    if (parts.length == 3) return parts[0] * 3600 + parts[1] * 60 + parts[2];
    return 0;
  }

  void _startPreloadMonitoring() {
    _preloadTimer?.cancel();
    _preloadTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _checkPreloadCondition();
    });
  }

  void _checkPreloadCondition() {
    final position = _currentState.currentPosition;
    final duration = _currentState.currentTrack.duration;
    
    if (duration > 0 && position / duration * 100 >= _preloadThresholdPercent) {
      _preloadNextTrack();
    }
  }

  Future<void> _preloadNextTrack() async {
    final nextIndex = _currentState.index + 1;
    if (nextIndex >= _currentState.queueList.length) {
      if (_currentState.isRadioActive) {
        await _loadMoreRadioTracks();
      }
      return;
    }

    final nextTrack = _currentState.queueList[nextIndex];
    if (nextTrack.audioStreamUrl != null) return; // Already preloaded

    try {
      final stream = await _streamExtractor.getBestAudioStream(nextTrack.id);
      if (stream != null) {
        final updatedQueue = List<Track>.from(_currentState.queueList);
        updatedQueue[nextIndex] = nextTrack.copyWith(audioStreamUrl: stream.url);
        _currentState = _currentState.copyWith(queueList: updatedQueue);
        _stateController.add(_currentState);
        _logger.fine('Preloaded next track: ${nextTrack.title}');
      }
    } catch (e) {
      _logger.warning('Failed to preload next track: $e');
    }
  }

  void updatePosition(double position) {
    _currentState = _currentState.copyWith(currentPosition: position);
    _stateController.add(_currentState);
  }

  void updateBufferedPosition(Duration buffered) {
    _currentState = _currentState.copyWith(bufferedPosition: buffered);
    _stateController.add(_currentState);
  }

  void setPlaybackMode(PlaybackMode mode) {
    _currentState = _currentState.copyWith(mode: mode);
    _stateController.add(_currentState);
  }

  void shuffleQueue() {
    final current = _currentState.currentTrack;
    final remaining = List<Track>.from(_currentState.queueList)..remove(current);
    remaining.shuffle();
    _currentState = _currentState.copyWith(
      queueList: [current, ...remaining],
      index: 0,
      mode: PlaybackMode.shuffle,
    );
    _stateController.add(_currentState);
  }

  void dispose() {
    _preloadTimer?.cancel();
    _stateController.close();
  }
}

extension TrackEmpty on Track {
  static Track empty() => Track(
    id: '',
    title: '',
    artist: '',
    artistId: '',
    duration: 0,
    artworkUrl: '',
  );
}