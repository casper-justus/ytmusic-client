library ytmusic_client.core.domain.lyrics_resolver;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import '../../shared/models/track.dart';
import '../data/innertube_client.dart';

final _logger = Logger('LyricsResolver');

abstract class LyricsResolver {
  Future<Lyrics> resolveLyrics(String trackId,
      {String? title, String? artist, int? duration});
}

class DualSourceLyricsResolver implements LyricsResolver {
  static const String _lrclibUrl = 'https://lrclib.net/api/get';

  final InnerTubeClient _innerTube;
  final Dio _dio;

  DualSourceLyricsResolver({
    required InnerTubeClient innerTube,
    Dio? dio,
  })  : _innerTube = innerTube,
        _dio = dio ?? _createDefaultDio();

  static Dio _createDefaultDio() {
    return Dio(BaseOptions(
      baseUrl: _lrclibUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'User-Agent': 'YTMusicClient/1.0',
        'Accept': 'application/json',
      },
    ));
  }

  @override
  Future<Lyrics> resolveLyrics(String trackId,
      {String? title, String? artist, int? duration}) async {
    // Try InnerTube first
    final innerTubeLyrics = await _fetchInnerTubeLyrics(trackId);
    if (innerTubeLyrics != null && innerTubeLyrics.hasSynced == true) {
      _logger.fine('Using InnerTube lyrics for $trackId');
      return innerTubeLyrics;
    }

    // Fallback to LRCLIB
    if (title != null && artist != null) {
      final lrclibLyrics = await _fetchLrclibLyrics(title, artist, duration);
      if (lrclibLyrics != null) {
        _logger.fine('Using LRCLIB lyrics for $trackId');
        return lrclibLyrics;
      }
    }

    // Return InnerTube lyrics even if not synced, or empty
    return innerTubeLyrics ??
        Lyrics(
          trackId: trackId,
          source: LyricsSource.none,
          lines: [],
          hasSynced: false,
        );
  }

  Future<Lyrics?> _fetchInnerTubeLyrics(String videoId) async {
    try {
      final response = await _innerTube.getLyrics(videoId: videoId);
      return _parseInnerTubeLyrics(response, videoId);
    } catch (e) {
      _logger.warning('InnerTube lyrics fetch failed: $e');
      return null;
    }
  }

  Lyrics? _parseInnerTubeLyrics(Map<String, dynamic> data, String trackId) {
    try {
      final lyricsRenderer = data['lyricsRenderer'] ?? data['lyrics'];
      if (lyricsRenderer == null) return null;

      final lines = <LyricsLine>[];
      final rawLrc = StringBuffer();

      // Parse segments
      final segments = lyricsRenderer['lyrics']?['runs'] as List? ?? [];
      for (final segment in segments) {
        final text = segment['text'] as String?;
        final timeMs = segment['navigationEndpoint']?['watchEndpoint']
            ?['startTimeMillis'] as int?;

        if (text != null && text.trim().isNotEmpty) {
          final time =
              timeMs != null ? Duration(milliseconds: timeMs) : Duration.zero;
          lines.add(LyricsLine(time: time, text: text));
          rawLrc.writeln('[${_formatLrcTime(time)}]$text');
        }
      }

      // Also check for line-by-line format
      final linesData = lyricsRenderer['lines'] as List? ?? [];
      if (linesData.isNotEmpty) {
        lines.clear();
        rawLrc.clear();
        for (final lineData in linesData) {
          final text = lineData['text'] as String?;
          final timeMs = lineData['startTimeMs'] as int?;
          if (text != null && text.trim().isNotEmpty) {
            final time =
                timeMs != null ? Duration(milliseconds: timeMs) : Duration.zero;
            lines.add(LyricsLine(time: time, text: text));
            rawLrc.writeln('[${_formatLrcTime(time)}]$text');
          }
        }
      }

      return Lyrics(
        trackId: trackId,
        source: LyricsSource.innerTube,
        lines: lines,
        hasSynced: lines.any((l) => l.time > Duration.zero),
        rawLrc: rawLrc.toString().trim(),
      );
    } catch (e) {
      _logger.warning('Failed to parse InnerTube lyrics: $e');
      return null;
    }
  }

  Future<Lyrics?> _fetchLrclibLyrics(
      String title, String artist, int? duration) async {
    try {
      final queryParams = <String, dynamic>{
        'track_name': title,
        'artist_name': artist,
        if (duration != null) 'duration': duration,
      };

      final response = await _dio.get('', queryParameters: queryParams);

      if (response.statusCode == 200 && response.data != null) {
        return _parseLrclibResponse(response.data, title);
      } else if (response.statusCode == 404) {
        _logger.fine('No LRCLIB lyrics found for $title - $artist');
        return null;
      }
    } catch (e) {
      _logger.warning('LRCLIB lyrics fetch failed: $e');
    }
    return null;
  }

  Lyrics? _parseLrclibResponse(Map<String, dynamic> data, String trackId) {
    try {
      final syncedLyrics = data['syncedLyrics'] as String?;
      final plainLyrics = data['plainLyrics'] as String?;

      if (syncedLyrics == null && plainLyrics == null) return null;

      final lines = <LyricsLine>[];
      final rawLrc = syncedLyrics ?? plainLyrics ?? '';
      final hasSynced = syncedLyrics != null;

      if (syncedLyrics != null) {
        final lrcLines = _parseLrcFormat(syncedLyrics);
        lines.addAll(lrcLines);
      } else if (plainLyrics != null) {
        // Create unsynced lines
        for (final line in plainLyrics.split('\n')) {
          if (line.trim().isNotEmpty) {
            lines.add(LyricsLine(time: Duration.zero, text: line.trim()));
          }
        }
      }

      return Lyrics(
        trackId: trackId,
        source: LyricsSource.lrclib,
        lines: lines,
        hasSynced: hasSynced,
        rawLrc: rawLrc,
      );
    } catch (e) {
      _logger.warning('Failed to parse LRCLIB response: $e');
      return null;
    }
  }

  List<LyricsLine> _parseLrcFormat(String lrc) {
    final lines = <LyricsLine>[];
    final regex = RegExp(r'\[(\d{2}):(\d{2})(?:\.(\d{2,3}))?\](.*)');

    for (final line in lrc.split('\n')) {
      final match = regex.firstMatch(line);
      if (match != null) {
        final minutes = int.parse(match.group(1)!);
        final seconds = int.parse(match.group(2)!);
        final milliseconds = match.group(3) != null
            ? int.parse(match.group(3)!.padRight(3, '0').substring(0, 3))
            : 0;
        final text = match.group(4)?.trim() ?? '';

        if (text.isNotEmpty) {
          final time = Duration(
              minutes: minutes, seconds: seconds, milliseconds: milliseconds);
          lines.add(LyricsLine(time: time, text: text));
        }
      }
    }

    // Sort by time
    lines.sort((a, b) => a.time.compareTo(b.time));
    return lines;
  }

  String _formatLrcTime(Duration time) {
    final minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
    final milliseconds =
        (time.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0');
    return '$minutes:$seconds.$milliseconds';
  }
}

class MockLyricsResolver implements LyricsResolver {
  final Map<String, Lyrics> _mockLyrics = {};

  @override
  Future<Lyrics> resolveLyrics(String trackId,
      {String? title, String? artist, int? duration}) async {
    return _mockLyrics[trackId] ??
        Lyrics(
          trackId: trackId,
          source: LyricsSource.none,
          lines: [],
          hasSynced: false,
        );
  }

  void setMockLyrics(String trackId, Lyrics lyrics) {
    _mockLyrics[trackId] = lyrics;
  }
}
