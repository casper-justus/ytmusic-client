library ytmusic_client.core.domain.audio_player;

import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';
import 'package:media_kit/media_kit.dart';
import 'package:logging/logging.dart';
import '../../shared/models/track.dart';

final _logger = Logger('AudioPlayerService');

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();
  final AudioPlayer _preloadPlayer = AudioPlayer();
  final _stateController = StreamController<PlayerState>.broadcast();
  
  PlayerState _currentState = PlayerState.stopped;
  Track? _currentTrack;
  Track? _preloadedTrack;
  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;
  StreamSubscription<ProcessingState>? _processingStateSub;

  AudioPlayerService() {
    _initialize();
  }

  Future<void> _initialize() async {
    // Configure audio session
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    
    // Set up Just Audio Background for notifications
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ytmusic.playback',
      androidNotificationChannelName: 'YTMusic Playback',
      androidNotificationOngoing: true,
    );

    _setupListeners();
  }

  void _setupListeners() {
    _playerStateSub = _player.playerStateStream.listen((state) {
      _currentState = state;
      _stateController.add(state);
    });

    _positionSub = _player.positionStream.listen((position) {
      _notifyPositionUpdate(position);
    });

    _durationSub = _player.durationStream.listen((duration) {
      _notifyDurationUpdate(duration);
    });

    _processingStateSub = _player.processingStateStream.listen((state) {
      _logger.fine('Processing state: $state');
    });
  }

  Future<void> play(Track track) async {
    _logger.info('Playing: ${track.title}');
    _currentTrack = track;

    if (track.audioStreamUrl != null) {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(track.audioStreamUrl!),
          tag: MediaItem(
            id: track.id,
            title: track.title,
            artist: track.artist,
            album: track.album,
            duration: Duration(seconds: track.duration),
            artUri: Uri.parse(track.artworkUrl),
          ),
        ),
        initialPosition: Duration.zero,
        preload: true,
      );
    } else {
      throw Exception('No audio stream URL for track ${track.id}');
    }

    await _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> resume() async {
    await _player.play();
  }

  Future<void> stop() async {
    await _player.stop();
    _currentTrack = null;
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume.clamp(0.0, 1.0));
  }

  Future<void> preloadNext(Track track) async {
    _logger.fine('Preloading next track: ${track.title}');
    _preloadedTrack = track;
    
    if (track.audioStreamUrl != null) {
      try {
        await _preloadPlayer.setAudioSource(
          AudioSource.uri(Uri.parse(track.audioStreamUrl!)),
          preload: true,
        );
      } catch (e) {
        _logger.warning('Preload failed: $e');
      }
    }
  }

  Future<void> swapToPreloaded() async {
    if (_preloadedTrack != null && _preloadedTrack!.audioStreamUrl != null) {
      final currentPos = _player.position;
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(_preloadedTrack!.audioStreamUrl!),
          tag: MediaItem(
            id: _preloadedTrack!.id,
            title: _preloadedTrack!.title,
            artist: _preloadedTrack!.artist,
            album: _preloadedTrack!.album,
            duration: Duration(seconds: _preloadedTrack!.duration),
            artUri: Uri.parse(_preloadedTrack!.artworkUrl),
          ),
        ),
        initialPosition: currentPos,
      );
      _currentTrack = _preloadedTrack;
      _preloadedTrack = null;
      await _player.play();
    }
  }

  void _notifyPositionUpdate(Duration position) {
    // Notify queue controller
  }

  void _notifyDurationUpdate(Duration? duration) {
    // Notify queue controller
  }

  Stream<PlayerState> get stateStream => _stateController.stream;
  PlayerState get currentState => _currentState;
  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;
  Track? get currentTrack => _currentTrack;
  bool get isPlaying => _player.playing;
  Duration get position => _player.position;
  Duration? get duration => _player.duration;
  double get speed => _player.speed;
  double get volume => _player.volume;

  Future<void> setEqualizer(List<double> gains) async {
    // Android equalizer integration would go here
    _logger.fine('Equalizer gains: $gains');
  }

  Future<List<double>> getEqualizerCapabilities() async {
    // Return number of bands and gain ranges
    return [5, -12.0, 12.0]; // 5 bands, -12dB to +12dB
  }

  void dispose() {
    _playerStateSub?.cancel();
    _positionSub?.cancel();
    _durationSub?.cancel();
    _processingStateSub?.cancel();
    _player.dispose();
    _preloadPlayer.dispose();
    _stateController.close();
  }
}

enum PlayerState { stopped, playing, paused, buffering, completed, error }