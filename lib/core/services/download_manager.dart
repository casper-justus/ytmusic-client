library ytmusic_client.core.services.download_manager;

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/data/database.dart';
import '../../core/presentation/providers.dart';
import '../../shared/models/track.dart';

final _logger = Logger('DownloadManager');

class DownloadManager {
  final Dio _dio;
  final AppDatabase _db;
  final Map<String, CancelToken> _activeDownloads = {};
  final _progressController = StreamController<DownloadProgress>.broadcast();

  DownloadManager({Dio? dio, required AppDatabase db})
      : _dio = dio ?? _createDefaultDio(),
        _db = db;

  static Dio _createDefaultDio() {
    return Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 300),
      headers: {
        'User-Agent': 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36',
      },
    ));
  }

  Stream<DownloadProgress> get progressStream => _progressController.stream;

  Future<void> downloadTrack(Track track) async {
    if (track.audioStreamUrl == null) {
      throw Exception('No stream URL for track');
    }

    final filePath = await _getFilePath(track);
    final cancelToken = CancelToken();
    _activeDownloads[track.id] = cancelToken;

    try {
      await _db.addDownload(DownloadsCompanion(
        id: Value(track.id),
        trackId: Value(track.id),
        filePath: Value(filePath),
        status: Value('downloading'),
        startedAt: Value(DateTime.now()),
      ));

      await _dio.download(
        track.audioStreamUrl!,
        filePath,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            _progressController.add(DownloadProgress(
              trackId: track.id,
              downloadedBytes: received,
              totalBytes: total,
              progress: received / total,
            ));
            _db.updateDownloadProgress(track.id, received, total);
          }
        },
      );

      await _db.updateTrackOffline(track.id, filePath);
      await _db.updateDownloadProgress(track.id, -1, -1,
          status: 'completed', completedAt: DateTime.now());

      _logger.info('Download completed: ${track.title}');
    } on DioException catch (e) {
      if (e.type != DioExceptionType.cancel) {
        await _db.updateDownloadProgress(track.id, 0, 0,
            status: 'failed', error: e.message);
        _logger.severe('Download failed: ${track.title}', e);
        rethrow;
      }
    } finally {
      _activeDownloads.remove(track.id);
    }
  }

  Future<void> downloadQueue(List<Track> tracks) async {
    for (final track in tracks) {
      if (!_activeDownloads.containsKey(track.id)) {
        try {
          await downloadTrack(track);
        } catch (e) {
          _logger.warning('Failed to download ${track.title}: $e');
        }
      }
    }
  }

  Future<void> cancelDownload(String trackId) async {
    final token = _activeDownloads[trackId];
    if (token != null) {
      token.cancel('User cancelled');
      _activeDownloads.remove(trackId);
      await _db.updateDownloadProgress(trackId, 0, 0, status: 'cancelled');
    }
  }

  Future<void> pauseDownload(String trackId) async {
    final token = _activeDownloads[trackId];
    if (token != null) {
      token.cancel('Paused');
      _activeDownloads.remove(trackId);
      await _db.updateDownloadProgress(trackId, 0, 0, status: 'paused');
    }
  }

  Future<void> resumeDownload(String trackId) async {
    final download = await _db.getDownload(trackId);
    if (download != null && download.status == 'paused') {
      final track = await _db.getTrack(trackId);
      if (track != null) {
        await downloadTrack(Track.fromEntity(track));
      }
    }
  }

  Future<void> deleteDownload(String trackId) async {
    await cancelDownload(trackId);
    final download = await _db.getDownload(trackId);
    if (download != null) {
      final file = File(download.filePath);
      if (await file.exists()) {
        await file.delete();
      }
      await _db.deleteDownload(trackId);
      await _db.updateTrackOffline(trackId, '');
    }
  }

  Future<String> _getFilePath(Track track) async {
    final dir = await getApplicationDocumentsDirectory();
    final downloadsDir = Directory('${dir.path}/downloads');
    if (!await downloadsDir.exists()) {
      await downloadsDir.create(recursive: true);
    }

    final ext = track.audioStreamUrl?.contains('mimeType=audio/webm') == true
        ? '.webm'
        : '.m4a';
    final safeTitle = track.title.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
    final safeArtist = track.artist.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
    return '${downloadsDir.path}/${safeArtist} - $safeTitle$ext';
  }

  void dispose() {
    for (final token in _activeDownloads.values) {
      token.cancel('Service disposing');
    }
    _activeDownloads.clear();
    _progressController.close();
  }
}

class DownloadProgress {
  final String trackId;
  final int downloadedBytes;
  final int totalBytes;
  final double progress;

  DownloadProgress({
    required this.trackId,
    required this.downloadedBytes,
    required this.totalBytes,
    required this.progress,
  });
}

final downloadManagerProvider = Provider<DownloadManager>((ref) {
  final db = ref.watch(databaseProvider);
  return DownloadManager(db: db);
});
