library ytmusic_client.core.services.background_audio;

import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:media_kit/media_kit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:logging/logging.dart';

final _logger = Logger('BackgroundAudioService');

class BackgroundAudioService {
  static const String _channelId = 'ytmusic_audio_channel';
  static const String _channelName = 'YTMusic Audio';

  final FlutterBackgroundService _service = FlutterBackgroundService();
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    await _service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: _onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: _channelId,
        initialNotificationTitle: 'YTMusic',
        initialNotificationContent: 'Ready to play',
        foregroundServiceTypes: [AndroidForegroundType.mediaPlayback],
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: _onIosForeground,
        onBackground: _onIosBackground,
      ),
    );

    // Create notification channel
    await _createNotificationChannel();

    _isInitialized = true;
    _logger.info('Background audio service initialized');
  }

  @pragma('vm:entry-point')
  static void _onStart(ServiceInstance service) async {
    // Initialize media kit
    MediaKit.ensureInitialized();

    // Initialize Just Audio Background
    await JustAudioBackground.init(
      androidNotificationChannelId: _channelId,
      androidNotificationChannelName: _channelName,
      androidNotificationOngoing: true,
    );

    service.on('play').listen((event) {
      final trackData = event?['track'] as Map<String, dynamic>?;
      if (trackData != null) {
        _playTrack(service, trackData);
      }
    });

    service.on('pause').listen((event) {
      _pausePlayback();
    });

    service.on('stop').listen((event) {
      _stopPlayback();
    });

    service.on('seek').listen((event) {
      final position = event?['position'] as int?;
      if (position != null) {
        _seekPlayback(Duration(milliseconds: position));
      }
    });

    service.on('setQueue').listen((event) {
      final queue = event?['queue'] as List?;
      if (queue != null) {
        _setQueue(queue.cast<Map<String, dynamic>>());
      }
    });

    // Keep service alive
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if (service is AndroidServiceInstance) {
        service.setForegroundNotificationInfo(
          title: 'YTMusic',
          content: 'Playing in background',
        );
      }
    });
  }

  @pragma('vm:entry-point')
  static Future<bool> _onIosForeground(ServiceInstance service) async {
    return true;
  }

  @pragma('vm:entry-point')
  static bool _onIosBackground(ServiceInstance service) {
    return true;
  }

  static Future<void> _createNotificationChannel() async {
    // Channel creation handled by flutter_background_service
  }

  static void _playTrack(
      ServiceInstance service, Map<String, dynamic> trackData) {
    // Implementation would use just_audio or media_kit
    _logger.info('Background play: ${trackData['title']}');
  }

  static void _pausePlayback() {
    _logger.info('Background pause');
  }

  static void _stopPlayback() {
    _logger.info('Background stop');
  }

  static void _seekPlayback(Duration position) {
    _logger.info('Background seek: $position');
  }

  static void _setQueue(List<Map<String, dynamic>> queue) {
    _logger.info('Background queue set: ${queue.length} tracks');
  }

  Future<void> play(Map<String, dynamic> track) async {
    _service.invoke('play', {'track': track});
  }

  Future<void> pause() async {
    _service.invoke('pause');
  }

  Future<void> stop() async {
    _service.invoke('stop');
  }

  Future<void> seek(Duration position) async {
    _service.invoke('seek', {'position': position.inMilliseconds});
  }

  Future<void> setQueue(List<Map<String, dynamic>> queue) async {
    _service.invoke('setQueue', {'queue': queue});
  }

  Future<void> updateNotification({
    required String title,
    required String artist,
    required String artworkUrl,
    required Duration position,
    required Duration duration,
    required bool isPlaying,
  }) async {
    if (_service is AndroidServiceInstance) {
      final androidService = _service as AndroidServiceInstance;
      await androidService.setForegroundNotificationInfo(
        title: title,
        content:
            '$artist • ${_formatDuration(position)}/${_formatDuration(duration)}',
      );
    }
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
