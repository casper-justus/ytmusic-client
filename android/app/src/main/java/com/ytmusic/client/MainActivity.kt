package com.ytmusic.client

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.ytmusic.client/ota"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkForUpdates" -> checkForUpdates(result)
                "downloadAndInstall" -> downloadAndInstall(call.argument<String>("url")!!, result)
                "canInstallPackages" -> result.success(packageManager.canRequestPackageInstalls())
                "openInstallSettings" -> openInstallSettings()
                else -> result.notImplemented()
            }
        }
    }

    private fun checkForUpdates(result: MethodChannel.Result) {
        OtaUpdater(this).checkForUpdates { releaseInfo ->
            if (releaseInfo != null) {
                result.success(mapOf(
                    "versionName" to releaseInfo.versionName,
                    "downloadUrl" to releaseInfo.downloadUrl,
                    "isPreRelease" to releaseInfo.isPreRelease,
                    "changelog" to releaseInfo.changelog
                ))
            } else {
                result.success(null)
            }
        }
    }

    private fun downloadAndInstall(url: String, result: MethodChannel.Result) {
        OtaUpdater(this).downloadAndInstall(url, object : OtaUpdater.Callback {
            override fun onProgress(progress: Float) {
                // Could send progress events via EventChannel if needed
            }

            override fun onSuccess() {
                result.success(true)
            }

            override fun onError(error: String) {
                result.error("OTA_ERROR", error, null)
            }
        })
    }

    private fun openInstallSettings() {
        val intent = android.content.Intent(android.provider.Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES)
            .setData(android.net.Uri.parse("package:$packageName"))
            .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
    }
}