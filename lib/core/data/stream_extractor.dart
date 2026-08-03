library ytmusic_client.core.data.stream_extractor;

import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import '../../shared/models/track.dart';
import '../constants.dart';
import 'po_token_provider.dart';

final _logger = Logger('StreamExtractor');

abstract class StreamExtractor {
  Future<List<AudioStream>> extractStreams(String videoId,
      {ClientContext context = ClientContext.androidMusic});
  Future<AudioStream?> getBestAudioStream(String videoId,
      {ClientContext context = ClientContext.androidMusic});
}

enum ClientContext { androidMusic, ios, webRemix, tvEmbedded }

class NewPipeExtractorImpl implements StreamExtractor {
  static const String _playerUrl = '$kYouTubeBaseUrl/youtubei/v1/player';
  static const String _apiKey = kYouTubeApiKey;

  final Dio _dio;
  final PoTokenProvider _poTokenProvider;
  final CipherDecipher _cipherDecipher;

  NewPipeExtractorImpl({
    required PoTokenProvider poTokenProvider,
    required CipherDecipher cipherDecipher,
    Dio? dio,
  })  : _poTokenProvider = poTokenProvider,
        _cipherDecipher = cipherDecipher,
        _dio = dio ?? _createDefaultDio();

  static Dio _createDefaultDio() {
    return Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'User-Agent':
            'com.google.android.apps.youtube.music/6.00.52 (Linux; U; Android 14; en_US) gzip',
        'X-Goog-Api-Key': _apiKey,
      },
    ));
  }

  @override
  Future<List<AudioStream>> extractStreams(String videoId,
      {ClientContext context = ClientContext.androidMusic}) async {
    final poToken = await _poTokenProvider.getPoToken(videoId);
    final cpn = _generateCpn();

    final body = _buildPlayerRequest(videoId, context, poToken, cpn);
    final headers = _buildHeaders(context);

    final response = await _dio.post(
      _playerUrl,
      queryParameters: {'key': _apiKey},
      data: body,
      options: Options(headers: headers),
    );

    if (response.statusCode != 200) {
      throw StreamExtractionException(
          'Failed to extract streams: ${response.statusCode}');
    }

    return _parseStreamingData(response.data, videoId);
  }

  @override
  Future<AudioStream?> getBestAudioStream(String videoId,
      {ClientContext context = ClientContext.androidMusic}) async {
    final streams = await extractStreams(videoId, context: context);

    // Prefer Opus (itag 251) > AAC (itag 140) > others
    const preferredItags = [251, 140, 250, 249, 139, 141, 256, 258];

    for (final itag in preferredItags) {
      final stream = streams.where((s) => s.itag == itag).firstOrNull;
      if (stream != null) return stream;
    }

    // Fallback to highest bitrate
    streams.sort((a, b) => b.bitrate.compareTo(a.bitrate));
    return streams.isNotEmpty ? streams.first : null;
  }

  Map<String, dynamic> _buildPlayerRequest(
    String videoId,
    ClientContext context,
    String? poToken,
    String cpn,
  ) {
    return {
      'context': _getClientContext(context),
      'videoId': videoId,
      'playbackContext': {
        'contentPlaybackContext': {
          'html5Preference': 'HTML5_PREF_WANTS',
          'lactMilliseconds': '-1',
        },
      },
      'cpn': cpn,
      if (poToken != null) 'serviceIntegrityDimensions': {'poToken': poToken},
      'contentCheckOk': true,
      'racyCheckOk': true,
    };
  }

  Map<String, dynamic> _getClientContext(ClientContext context) {
    switch (context) {
      case ClientContext.androidMusic:
        return {
          'clientName': 'ANDROID_MUSIC',
          'clientVersion': '6.00.52',
          'hl': 'en',
          'gl': 'US',
          'clientFormFactor': 'PHONE',
          'platform': 'MOBILE',
          'osName': 'Android',
          'osVersion': '14',
          'deviceMake': 'Google',
          'deviceModel': 'Pixel 8',
          'userInterfaceTheme': 'USER_INTERFACE_THEME_DARK',
        };
      case ClientContext.ios:
        return {
          'clientName': 'IOS_MUSIC',
          'clientVersion': '6.00',
          'hl': 'en',
          'gl': 'US',
          'clientFormFactor': 'PHONE',
          'platform': 'MOBILE',
          'osName': 'iOS',
          'osVersion': '17.2',
          'deviceMake': 'Apple',
          'deviceModel': 'iPhone15,2',
        };
      case ClientContext.webRemix:
        return {
          'clientName': 'WEB_REMIX',
          'clientVersion': '1.20240101.00.00',
          'hl': 'en',
          'gl': 'US',
          'clientFormFactor': 'UNKNOWN_FORM_FACTOR',
          'platform': 'DESKTOP',
        };
      case ClientContext.tvEmbedded:
        return {
          'clientName': 'TV_EMBEDDED',
          'clientVersion': '2.20240101.00.00',
          'hl': 'en',
          'gl': 'US',
          'clientFormFactor': 'TV',
          'platform': 'TV',
        };
    }
  }

  Map<String, String> _buildHeaders(ClientContext context) {
    const userAgents = {
      ClientContext.androidMusic:
          'com.google.android.apps.youtube.music/6.00.52 (Linux; U; Android 14; en_US) gzip',
      ClientContext.ios:
          'com.google.ios.youtube.music/6.00 (iPhone15,2; U; iOS 17.2; en_US) gzip',
      ClientContext.webRemix:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      ClientContext.tvEmbedded:
          'Mozilla/5.0 (SMART-TV; Linux; Tizen 7.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    };

    return {
      'Content-Type': 'application/json',
      'User-Agent': userAgents[context]!,
      'X-Goog-Api-Key': _apiKey,
    };
  }

  List<AudioStream> _parseStreamingData(
      Map<String, dynamic> data, String videoId) {
    final streamingData = data['streamingData'];
    if (streamingData == null) {
      throw StreamExtractionException('No streaming data in response');
    }

    final formats = <Map<String, dynamic>>[];

    if (streamingData['formats'] != null) {
      formats.addAll(List<Map<String, dynamic>>.from(streamingData['formats']));
    }
    if (streamingData['adaptiveFormats'] != null) {
      formats.addAll(
          List<Map<String, dynamic>>.from(streamingData['adaptiveFormats']));
    }

    return formats
        .where((f) => f['mimeType']?.toString().startsWith('audio/') == true)
        .map((f) => _parseAudioStream(f, videoId))
        .whereType<AudioStream>()
        .toList();
  }

  AudioStream? _parseAudioStream(Map<String, dynamic> format, String videoId) {
    try {
      final itag = format['itag'] as int?;
      if (itag == null) return null;

      String? url = format['url'] as String?;
      final signatureCipher = format['signatureCipher'] as String?;

      if (url == null && signatureCipher != null) {
        url = _decipherSignature(signatureCipher);
      }

      if (url == null) return null;

      final mimeType = format['mimeType'] as String? ?? '';
      final bitrate = format['bitrate'] as int? ?? 0;
      final container = _extractContainer(mimeType);
      final codec = _extractCodec(mimeType);

      return AudioStream(
        url: url,
        itag: itag,
        mimeType: mimeType,
        bitrate: bitrate,
        container: container,
        codec: codec,
        isEncrypted: signatureCipher != null,
        rawData: format,
      );
    } catch (e) {
      _logger.warning('Failed to parse audio stream: $e');
      return null;
    }
  }

  String? _decipherSignature(String signatureCipher) {
    final params = Uri.splitQueryString(signatureCipher);
    final url = params['url'];
    final signature = params['s'] ?? params['sig'];

    if (url == null || signature == null) return null;

    final deciphered = _cipherDecipher.decipher(signature);
    return '$url&sig=$deciphered';
  }

  String _extractContainer(String mimeType) {
    if (mimeType.contains('webm')) return 'webm';
    if (mimeType.contains('mp4') || mimeType.contains('m4a')) return 'mp4';
    if (mimeType.contains('ogg')) return 'ogg';
    return 'unknown';
  }

  String _extractCodec(String mimeType) {
    if (mimeType.contains('opus')) return 'opus';
    if (mimeType.contains('mp4a') || mimeType.contains('aac')) return 'aac';
    if (mimeType.contains('vorbis')) return 'vorbis';
    return 'unknown';
  }

  String _generateCpn() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }
}

abstract class CipherDecipher {
  String decipher(String signature);
}

class CipherDecipherImpl implements CipherDecipher {
  static const String _baseJsUrl = 'https://www.youtube.com/s/player/';
  String? _cachedPlayerJs;
  List<_TransformStep>? _cachedTransforms;

  @override
  String decipher(String signature) {
    if (_cachedTransforms == null) {
      throw CipherException(
          'Cipher transforms not initialized. Call initialize() first.');
    }

    var result = signature.split('');
    for (final step in _cachedTransforms!) {
      result = step.apply(result);
    }
    return result.join('');
  }

  Future<void> initialize() async {
    if (_cachedTransforms != null) return;

    try {
      await _fetchAndParsePlayerJs();
    } catch (e) {
      _logger
          .warning('Failed to fetch player JS, using fallback transforms: $e');
      _cachedTransforms = _getFallbackTransforms();
    }
  }

  Future<void> _fetchAndParsePlayerJs() async {
    final dio = Dio();
    final response =
        await dio.get('$_baseJsUrl${_getLatestPlayerVersion()}/player.js');
    _cachedPlayerJs = response.data as String?;
    _cachedTransforms = _parseTransforms(_cachedPlayerJs!);
  }

  String _getLatestPlayerVersion() {
    // This would typically be extracted from the HTML page
    // For now, use a known recent version
    return 'a1b2c3d4';
  }

  List<_TransformStep> _parseTransforms(String js) {
    // Simplified transform parsing - in production, this would be more robust
    // The actual implementation would parse the base.js to extract the cipher operations
    return _getFallbackTransforms();
  }

  List<_TransformStep> _getFallbackTransforms() {
    // Common transform patterns used by YouTube
    return [
      _ReverseTransform(),
      _SwapTransform(1),
      _SliceTransform(2),
      _SwapTransform(3),
      _ReverseTransform(),
    ];
  }
}

abstract class _TransformStep {
  List<String> apply(List<String> input);
}

class _ReverseTransform implements _TransformStep {
  @override
  List<String> apply(List<String> input) => input.reversed.toList();
}

class _SwapTransform implements _TransformStep {
  final int position;
  _SwapTransform(this.position);

  @override
  List<String> apply(List<String> input) {
    if (input.length <= position) return input;
    final result = List<String>.from(input);
    final temp = result[0];
    result[0] = result[position % result.length];
    result[position % result.length] = temp;
    return result;
  }
}

class _SliceTransform implements _TransformStep {
  final int start;
  _SliceTransform(this.start);

  @override
  List<String> apply(List<String> input) => input.sublist(start % input.length);
}

class StreamExtractionException implements Exception {
  final String message;
  StreamExtractionException(this.message);
  @override
  String toString() => 'StreamExtractionException: $message';
}

class CipherException implements Exception {
  final String message;
  CipherException(this.message);
  @override
  String toString() => 'CipherException: $message';
}
