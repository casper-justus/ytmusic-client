library ytmusic_client.core.domain.session_manager;

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import '../../shared/models/track.dart';

final _logger = Logger('SessionManager');

enum AuthMode { authenticated, anonymous }

class SessionManager {
  static const String _cookieKey = 'youtube_music_cookies';
  static const String _authModeKey = 'auth_mode';
  static const String _userProfileKey = 'user_profile';
  
  final FlutterSecureStorage _secureStorage;
  AuthMode _currentMode = AuthMode.anonymous;
  String? _sessionCookies;
  UserProfile? _userProfile;

  SessionManager({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  Future<void> initialize() async {
    await _loadSession();
  }

  Future<void> _loadSession() async {
    final modeStr = await _secureStorage.read(key: _authModeKey);
    if (modeStr != null) {
      _currentMode = AuthMode.values.byName(modeStr);
    }

    _sessionCookies = await _secureStorage.read(key: _cookieKey);
    
    final profileJson = await _secureStorage.read(key: _userProfileKey);
    if (profileJson != null) {
      _userProfile = UserProfile.fromJson(jsonDecode(profileJson));
    }
    
    _logger.info('Session loaded: mode=$_currentMode, hasCookies=${_sessionCookies != null}');
  }

  AuthMode get currentMode => _currentMode;
  String? get sessionCookies => _sessionCookies;
  UserProfile? get userProfile => _userProfile;
  bool get isAuthenticated => _currentMode == AuthMode.authenticated && _sessionCookies != null;

  Future<void> setAuthenticatedMode(String cookies, UserProfile profile) async {
    _currentMode = AuthMode.authenticated;
    _sessionCookies = cookies;
    _userProfile = profile;
    
    await _secureStorage.write(key: _authModeKey, value: AuthMode.authenticated.name);
    await _secureStorage.write(key: _cookieKey, value: cookies);
    await _secureStorage.write(key: _userProfileKey, value: jsonEncode(profile.toJson()));
    
    _logger.info('Authenticated session saved for user: ${profile.name}');
  }

  Future<void> setAnonymousMode() async {
    _currentMode = AuthMode.anonymous;
    _sessionCookies = null;
    _userProfile = null;
    
    await _secureStorage.write(key: _authModeKey, value: AuthMode.anonymous.name);
    await _secureStorage.delete(key: _cookieKey);
    await _secureStorage.delete(key: _userProfileKey);
    
    _logger.info('Switched to anonymous mode');
  }

  Future<void> updateCookies(String cookies) async {
    _sessionCookies = cookies;
    await _secureStorage.write(key: _cookieKey, value: cookies);
  }

  Future<void> updateProfile(UserProfile profile) async {
    _userProfile = profile;
    await _secureStorage.write(key: _userProfileKey, value: jsonEncode(profile.toJson()));
  }

  Future<void> clearSession() async {
    _currentMode = AuthMode.anonymous;
    _sessionCookies = null;
    _userProfile = null;
    
    await _secureStorage.delete(key: _authModeKey);
    await _secureStorage.delete(key: _cookieKey);
    await _secureStorage.delete(key: _userProfileKey);
    
    _logger.info('Session cleared');
  }

  Map<String, String> getCookieHeaders() {
    if (_sessionCookies == null) return {};
    return {'Cookie': _sessionCookies!};
  }

  Map<String, dynamic> getAuthState() {
    return {
      'mode': _currentMode.name,
      'isAuthenticated': isAuthenticated,
      'user': _userProfile?.toJson(),
    };
  }
}

class CookieParser {
  static String? extractCookieFromWebView(String url, Map<String, String> headers) {
    // This would be called from a WebView after user logs in
    final cookieHeader = headers['cookie'] ?? headers['Cookie'];
    return cookieHeader;
  }

  static Map<String, String> parseCookieString(String cookieString) {
    final cookies = <String, String>{};
    for (final part in cookieString.split(';')) {
      final trimmed = part.trim();
      final eqIndex = trimmed.indexOf('=');
      if (eqIndex > 0) {
        final name = trimmed.substring(0, eqIndex);
        final value = trimmed.substring(eqIndex + 1);
        cookies[name] = value;
      }
    }
    return cookies;
  }

  static String buildCookieHeader(Map<String, String> cookies) {
    return cookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
  }

  static bool hasRequiredCookies(String cookieString) {
    final required = ['SID', 'HSID', 'SSID', 'APISID', 'SAPISID'];
    final cookies = parseCookieString(cookieString);
    return required.every((name) => cookies.containsKey(name));
  }
}