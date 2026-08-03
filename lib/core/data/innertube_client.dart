library ytmusic_client.core.data.innertube_client;

import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';
import '../../shared/models/track.dart';
import '../constants.dart';
import 'po_token_provider.dart';

final _logger = Logger('InnerTubeClient');

abstract class InnerTubeClient {
  Future<Map<String, dynamic>> browse({
    required String browseId,
    Map<String, dynamic>? params,
    String? continuation,
  });

  Future<Map<String, dynamic>> search({
    required String query,
    required SearchFilter filter,
    String? continuation,
  });

  Future<Map<String, dynamic>> next({
    required String videoId,
    String? playlistId,
    String? params,
  });

  Future<Map<String, dynamic>> player({
    required String videoId,
    required ClientContext context,
    String? poToken,
    String? cpn,
  });

  Future<Map<String, dynamic>> getLyrics({
    required String videoId,
  });

  Future<Map<String, dynamic>> getAccount();

  Future<Map<String, dynamic>> getPlaylist({required String playlistId});
}

enum SearchFilter { songs, videos, albums, artists, playlists }

enum ClientContext { webRemix, androidMusic, ios, tvEmbedded }

class InnerTubeClientImpl implements InnerTubeClient {
  static const String _baseUrl = kInnerTubeBaseUrl;
  static const String _apiKey = kYouTubeApiKey;

  final Dio _dio;
  final PoTokenProvider _poTokenProvider;
  final String? _sessionCookie;
  final Map<ClientContext, Map<String, dynamic>> _clientContexts;

  InnerTubeClientImpl({
    required PoTokenProvider poTokenProvider,
    String? sessionCookie,
    Dio? dio,
  })  : _poTokenProvider = poTokenProvider,
        _sessionCookie = sessionCookie,
        _dio = dio ?? _createDefaultDio(),
        _clientContexts = _buildClientContexts();

  static Dio _createDefaultDio() {
    return Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'User-Agent': _getUserAgent(ClientContext.webRemix),
        'X-Goog-Api-Key': _apiKey,
        'X-Goog-Visitor-Id': _generateVisitorId(),
        'X-YouTube-Client-Name': '1',
        'X-YouTube-Client-Version': '2.20240101.00.00',
      },
    ))
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => _logger.fine(obj.toString()),
      ));
  }

  static String _generateVisitorId() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  static String _getUserAgent(ClientContext context) {
    switch (context) {
      case ClientContext.webRemix:
        return 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36,gzip(gfe)';
      case ClientContext.androidMusic:
        return 'com.google.android.apps.youtube.music/6.00.52 (Linux; U; Android 14; en_US) gzip';
      case ClientContext.ios:
        return 'com.google.ios.youtube.music/6.00 (iPhone15,2; U; iOS 17.2; en_US) gzip';
      case ClientContext.tvEmbedded:
        return 'Mozilla/5.0 (SMART-TV; Linux; Tizen 7.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36';
    }
  }

  static Map<ClientContext, Map<String, dynamic>> _buildClientContexts() {
    return {
      ClientContext.webRemix: {
        'clientName': 'WEB_REMIX',
        'clientVersion': '1.20240101.00.00',
        'hl': 'en',
        'gl': 'US',
        'locationInfo': {},
        'clientFormFactor': 'UNKNOWN_FORM_FACTOR',
        'platform': 'DESKTOP',
        'configInfo': {
          'appInstallData': '',
        },
        'userInterfaceTheme': 'USER_INTERFACE_THEME_DARK',
      },
      ClientContext.androidMusic: {
        'clientName': 'ANDROID_MUSIC',
        'clientVersion': '6.00.52',
        'hl': 'en',
        'gl': 'US',
        'locationInfo': {},
        'clientFormFactor': 'PHONE',
        'platform': 'MOBILE',
        'osName': 'Android',
        'osVersion': '14',
        'deviceMake': 'Google',
        'deviceModel': 'Pixel 8',
        'userInterfaceTheme': 'USER_INTERFACE_THEME_DARK',
        'musicAppInfo': {
          'musicActivityMasterSwitch': 'MUSIC_ACTIVITY_MASTER_SWITCH_ON',
          'musicLocationMasterSwitch': 'MUSIC_LOCATION_MASTER_SWITCH_ON',
          'pwaInstallabilityStatus': 'PWA_INSTALLABILITY_STATUS_UNKNOWN',
        },
      },
      ClientContext.ios: {
        'clientName': 'IOS_MUSIC',
        'clientVersion': '6.00',
        'hl': 'en',
        'gl': 'US',
        'locationInfo': {},
        'clientFormFactor': 'PHONE',
        'platform': 'MOBILE',
        'osName': 'iOS',
        'osVersion': '17.2',
        'deviceMake': 'Apple',
        'deviceModel': 'iPhone15,2',
        'userInterfaceTheme': 'USER_INTERFACE_THEME_DARK',
      },
      ClientContext.tvEmbedded: {
        'clientName': 'TV_EMBEDDED',
        'clientVersion': '2.20240101.00.00',
        'hl': 'en',
        'gl': 'US',
        'locationInfo': {},
        'clientFormFactor': 'TV',
        'platform': 'TV',
      },
    };
  }

  Map<String, dynamic> _getContext(ClientContext context) {
    final baseContext = Map<String, dynamic>.from(_clientContexts[context]!);
    baseContext['visitorData'] = _generateVisitorId();
    return {'context': baseContext};
  }

  Map<String, String> _getHeaders(ClientContext context) {
    return {
      'Content-Type': 'application/json',
      'User-Agent': _getUserAgent(context),
      'X-Goog-Api-Key': _apiKey,
      'X-Goog-Visitor-Id': _generateVisitorId(),
      'X-YouTube-Client-Name': _getClientName(context).toString(),
      'X-YouTube-Client-Version': _getClientVersion(context),
      if (_sessionCookie != null) 'Cookie': _sessionCookie!,
    };
  }

  int _getClientName(ClientContext context) {
    switch (context) {
      case ClientContext.webRemix:
        return 1;
      case ClientContext.androidMusic:
        return 3;
      case ClientContext.ios:
        return 4;
      case ClientContext.tvEmbedded:
        return 6;
    }
  }

  String _getClientVersion(ClientContext context) {
    switch (context) {
      case ClientContext.webRemix:
        return '1.20240101.00.00';
      case ClientContext.androidMusic:
        return '6.00.52';
      case ClientContext.ios:
        return '6.00';
      case ClientContext.tvEmbedded:
        return '2.20240101.00.00';
    }
  }

  @override
  Future<Map<String, dynamic>> browse({
    required String browseId,
    Map<String, dynamic>? params,
    String? continuation,
  }) async {
    final body = {
      ..._getContext(ClientContext.webRemix),
      'browseId': browseId,
      if (params != null) 'params': params,
      if (continuation != null) 'continuation': continuation,
    };

    final response = await _retryRequest(
      () => _dio.post(
        '/browse',
        data: body,
        options: Options(headers: _getHeaders(ClientContext.webRemix)),
      ),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> search({
    required String query,
    required SearchFilter filter,
    String? continuation,
  }) async {
    final filterParams = _getSearchFilterParams(filter);

    final body = {
      ..._getContext(ClientContext.webRemix),
      'query': query,
      if (filterParams.isNotEmpty) 'params': filterParams,
      if (continuation != null) 'continuation': continuation,
    };

    final response = await _retryRequest(
      () => _dio.post(
        '/search',
        data: body,
        options: Options(headers: _getHeaders(ClientContext.webRemix)),
      ),
    );
    return response.data;
  }

  String _getSearchFilterParams(SearchFilter filter) {
    const filterMap = {
      SearchFilter.songs: 'EgWKAQIIAWoKEAoQBhgQBA==',
      SearchFilter.videos: 'EgWKAQIIAWoKEAoQBhgQBQ==',
      SearchFilter.albums: 'EgWKAQIIAWoKEAoQBhgQBg==',
      SearchFilter.artists: 'EgWKAQIIAWoKEAoQBhgQBw==',
      SearchFilter.playlists: 'EgWKAQIIAWoKEAoQBhgQCA==',
    };
    return filterMap[filter] ?? '';
  }

  @override
  Future<Map<String, dynamic>> next({
    required String videoId,
    String? playlistId,
    String? params,
  }) async {
    final body = {
      ..._getContext(ClientContext.webRemix),
      'videoId': videoId,
      if (playlistId != null) 'playlistId': playlistId,
      if (params != null) 'params': params,
    };

    final response = await _retryRequest(
      () => _dio.post(
        '/next',
        data: body,
        options: Options(headers: _getHeaders(ClientContext.webRemix)),
      ),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> player({
    required String videoId,
    required ClientContext context,
    String? poToken,
    String? cpn,
  }) async {
    final token = poToken ?? await _poTokenProvider.getPoToken(videoId);
    final nonce = cpn ?? _generateCpn();

    final body = {
      ..._getContext(context),
      'videoId': videoId,
      'playbackContext': {
        'contentPlaybackContext': {
          'html5Preference': 'HTML5_PREF_WANTS',
          'lactMilliseconds': '-1',
        },
      },
      'cpn': nonce,
      if (token != null)
        'serviceIntegrityDimensions': {
          'poToken': token,
        },
      'contentCheckOk': true,
      'racyCheckOk': true,
    };

    final response = await _retryRequest(
      () => _dio.post(
        '/player',
        data: body,
        options: Options(headers: _getHeaders(context)),
      ),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getLyrics({required String videoId}) async {
    final body = {
      ..._getContext(ClientContext.webRemix),
      'videoId': videoId,
    };

    final response = await _retryRequest(
      () => _dio.post(
        '/get_lyrics',
        data: body,
        options: Options(headers: _getHeaders(ClientContext.webRemix)),
      ),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getAccount() async {
    final body = _getContext(ClientContext.webRemix);

    final response = await _retryRequest(
      () => _dio.post(
        '/account',
        data: body,
        options: Options(headers: _getHeaders(ClientContext.webRemix)),
      ),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getPlaylist({required String playlistId}) async {
    final body = {
      ..._getContext(ClientContext.webRemix),
      'playlistId': playlistId,
    };

    final response = await _retryRequest(
      () => _dio.post(
        '/browse',
        data: body,
        options: Options(headers: _getHeaders(ClientContext.webRemix)),
      ),
    );
    return response.data;
  }

  String _generateCpn() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  Future<Response<dynamic>> _retryRequest(
      Future<Response<dynamic>> Function() request) async {
    int attempts = 0;
    const maxAttempts = 3;

    while (attempts < maxAttempts) {
      try {
        return await request();
      } on DioException catch (e) {
        attempts++;
        if (attempts >= maxAttempts) rethrow;

        if (e.response?.statusCode == 403) {
          await _poTokenProvider.invalidateCache();
        }

        final delay =
            Duration(milliseconds: 1000 * pow(2, attempts - 1).toInt());
        await Future.delayed(delay);
      }
    }
    throw Exception('Max retry attempts reached');
  }
}
