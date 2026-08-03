library ytmusic_client.core.data.po_token_provider;

import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

final _logger = Logger('PoTokenProvider');

abstract class PoTokenProvider {
  Future<String?> getPoToken(String videoId);
  Future<void> invalidateCache();
  Future<void> warmUp();
}

class PoTokenProviderImpl implements PoTokenProvider {
  static const String _challengeUrl =
      '$kYouTubeBaseUrl/youtubei/v1/validate_playback';
  static const String _apiKey = kYouTubeApiKey;

  final Dio _dio;
  final SharedPreferences _prefs;
  final Map<String, _CachedToken> _cache = {};

  PoTokenProviderImpl({
    Dio? dio,
    required SharedPreferences prefs,
  })  : _dio = dio ?? _createDefaultDio(),
        _prefs = prefs;

  static Dio _createDefaultDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://www.youtube.com',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'X-Goog-Api-Key': _apiKey,
      },
    ));
  }

  @override
  Future<String?> getPoToken(String videoId) async {
    final cached = _cache[videoId];
    if (cached != null && !cached.isExpired) {
      _logger.fine('Returning cached PoToken for $videoId');
      return cached.token;
    }

    try {
      final token = await _fetchPoToken(videoId);
      if (token != null) {
        _cache[videoId] = _CachedToken(
          token: token,
          expiresAt: DateTime.now().add(const Duration(hours: 1)),
        );
        await _persistCache();
      }
      return token;
    } catch (e) {
      _logger.warning('Failed to fetch PoToken for $videoId: $e');
      return cached?.token;
    }
  }

  Future<String?> _fetchPoToken(String videoId) async {
    final challenge = _generateChallenge();
    final body = {
      'context': {
        'client': {
          'clientName': 'WEB_REMIX',
          'clientVersion': '1.20240101.00.00',
          'hl': 'en',
          'gl': 'US',
        },
      },
      'videoId': videoId,
      'playbackContext': {
        'contentPlaybackContext': {
          'html5Preference': 'HTML5_PREF_WANTS',
        },
      },
      'serviceIntegrityDimensions': {
        'format': 'JSON',
        'token': challenge,
      },
    };

    final response = await _dio.post(
      '/youtubei/v1/validate_playback',
      queryParameters: {'key': _apiKey},
      data: body,
    );

    if (response.statusCode == 200) {
      final data = response.data;
      if (data['poToken'] != null) {
        return data['poToken'] as String;
      }
    }
    return null;
  }

  String _generateChallenge() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random =
        List<int>.generate(32, (_) => DateTime.now().microsecond % 256);
    final bytes = utf8.encode('$timestamp:${base64Url.encode(random)}');
    return base64Url.encode(sha256.convert(bytes).bytes);
  }

  @override
  Future<void> invalidateCache() async {
    _cache.clear();
    await _prefs.remove('po_token_cache');
    _logger.info('PoToken cache invalidated');
  }

  @override
  Future<void> warmUp() async {
    await _loadCache();
    _logger
        .info('PoToken provider warmed up with ${_cache.length} cached tokens');
  }

  Future<void> _loadCache() async {
    final jsonString = _prefs.getString('po_token_cache');
    if (jsonString != null) {
      final Map<String, dynamic> data = jsonDecode(jsonString);
      _cache.clear();
      data.forEach((key, value) {
        final expiresAt = DateTime.parse(value['expiresAt'] as String);
        if (expiresAt.isAfter(DateTime.now())) {
          _cache[key] = _CachedToken(
            token: value['token'] as String,
            expiresAt: expiresAt,
          );
        }
      });
    }
  }

  Future<void> _persistCache() async {
    final data = <String, Map<String, dynamic>>{};
    _cache.forEach((key, value) {
      data[key] = {
        'token': value.token,
        'expiresAt': value.expiresAt.toIso8601String(),
      };
    });
    await _prefs.setString('po_token_cache', jsonEncode(data));
  }
}

class _CachedToken {
  final String token;
  final DateTime expiresAt;

  _CachedToken({required this.token, required this.expiresAt});

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

class MockPoTokenProvider implements PoTokenProvider {
  final Map<String, String> _mockTokens = {};
  bool _shouldFail = false;

  @override
  Future<String?> getPoToken(String videoId) async {
    if (_shouldFail) return null;
    return _mockTokens[videoId] ??
        'mock_po_token_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<void> invalidateCache() async {
    _mockTokens.clear();
  }

  @override
  Future<void> warmUp() async {}

  void setMockToken(String videoId, String token) {
    _mockTokens[videoId] = token;
  }

  void setShouldFail(bool fail) {
    _shouldFail = fail;
  }
}
