library ytmusic_client.core.services.ota_service;

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:logging/logging.dart';

final _logger = Logger('OtaService');

class OtaService {
  static const MethodChannel _channel = MethodChannel('com.ytmusic.client/ota');

  static bool _isChecking = false;
  static StreamController<OtaStatus>? _statusController;

  static Stream<OtaStatus> get statusStream {
    _statusController ??= StreamController<OtaStatus>.broadcast();
    return _statusController!.stream;
  }

  static Future<OtaReleaseInfo?> checkForUpdates() async {
    if (_isChecking) return null;
    _isChecking = true;

    try {
      _emitStatus(OtaStatusFactory.checking());

      final result =
          await _channel.invokeMethod<Map<dynamic, dynamic>>('checkForUpdates');

      if (result != null) {
        final info = OtaReleaseInfo(
          versionName: result['versionName'] as String,
          downloadUrl: result['downloadUrl'] as String,
          isPreRelease: result['isPreRelease'] as bool,
          changelog: result['changelog'] as String? ?? '',
        );

        final currentVersion = await _getCurrentVersion();
        if (_isNewerVersion(currentVersion, info.versionName)) {
          _emitStatus(OtaStatusFactory.updateAvailable(info));
          return info;
        }
      }

      _emitStatus(OtaStatusFactory.upToDate());
      return null;
    } on PlatformException catch (e) {
      _logger.warning('OTA check failed: ${e.message}');
      _emitStatus(OtaStatusFactory.error(e.message ?? 'Unknown error'));
      return null;
    } finally {
      _isChecking = false;
    }
  }

  static Future<bool> downloadAndInstall(OtaReleaseInfo info,
      {Function(double)? onProgress}) async {
    try {
      _emitStatus(OtaStatusFactory.downloading(0.0));

      // For now, we'll use the platform channel which doesn't support progress callbacks
      // In a full implementation, you'd use an EventChannel for progress
      final success = await _channel.invokeMethod<bool>('downloadAndInstall', {
        'url': info.downloadUrl,
      });

      if (success == true) {
        _emitStatus(OtaStatusFactory.installing());
        return true;
      }

      _emitStatus(OtaStatusFactory.error('Download failed'));
      return false;
    } on PlatformException catch (e) {
      _logger.warning('OTA install failed: ${e.message}');
      _emitStatus(OtaStatusFactory.error(e.message ?? 'Unknown error'));
      return false;
    }
  }

  static Future<bool> canInstallPackages() async {
    try {
      return await _channel.invokeMethod<bool>('canInstallPackages') ?? false;
    } on PlatformException {
      return false;
    }
  }

  static Future<void> openInstallSettings() async {
    await _channel.invokeMethod('openInstallSettings');
  }

  static Future<String> _getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static bool _isNewerVersion(String current, String remote) {
    final cleanCurrent = current.split('-')[0];
    final cleanRemote = remote.split('-')[0];

    final parts1 = cleanRemote.split('.').map(int.parse).toList();
    final parts2 = cleanCurrent.split('.').map(int.parse).toList();
    final maxSize =
        parts1.length > parts2.length ? parts1.length : parts2.length;

    for (int i = 0; i < maxSize; i++) {
      final p1 = i < parts1.length ? parts1[i] : 0;
      final p2 = i < parts2.length ? parts2[i] : 0;
      if (p1 != p2) return p1 > p2;
    }
    return false;
  }

  static void _emitStatus(OtaStatus status) {
    _statusController?.add(status);
  }

  static void dispose() {
    _statusController?.close();
    _statusController = null;
  }
}

class OtaReleaseInfo {
  final String versionName;
  final String downloadUrl;
  final bool isPreRelease;
  final String changelog;

  OtaReleaseInfo({
    required this.versionName,
    required this.downloadUrl,
    required this.isPreRelease,
    required this.changelog,
  });
}

sealed class OtaStatus {
  const OtaStatus();
}

class OtaChecking extends OtaStatus {
  const OtaChecking();
}

class OtaUpdateAvailable extends OtaStatus {
  final OtaReleaseInfo info;
  const OtaUpdateAvailable(this.info);
}

class OtaDownloading extends OtaStatus {
  final double progress;
  const OtaDownloading(this.progress);
}

class OtaInstalling extends OtaStatus {
  const OtaInstalling();
}

class OtaUpToDate extends OtaStatus {
  const OtaUpToDate();
}

class OtaError extends OtaStatus {
  final String message;
  const OtaError(this.message);
}

abstract final class OtaStatusFactory {
  static OtaStatus checking() => const OtaChecking();
  static OtaStatus updateAvailable(OtaReleaseInfo info) =>
      OtaUpdateAvailable(info);
  static OtaStatus downloading(double progress) => OtaDownloading(progress);
  static OtaStatus installing() => const OtaInstalling();
  static OtaStatus upToDate() => const OtaUpToDate();
  static OtaStatus error(String message) => OtaError(message);
}
