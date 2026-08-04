package com.ytmusic.client

import android.app.DownloadManager
import android.content.Context
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.util.Log
import com.google.gson.Gson
import com.google.gson.JsonArray
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import com.ytmusic.client.BuildConfig
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okio.buffer
import okio.sink
import java.io.File
import java.util.concurrent.TimeUnit

class OtaUpdater(private val context: Context) {

    private val client = OkHttpClient.Builder()
        .connectTimeout(15, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .build()

    private val repoOwner = "casper-justus"
    private val repoName = "ytmusic-client"
    private val gson = Gson()

    interface Callback {
        fun onProgress(progress: Float)
        fun onSuccess()
        fun onError(error: String)
    }

    data class ReleaseInfo(
        val versionName: String,
        val downloadUrl: String,
        val isPreRelease: Boolean,
        val changelog: String
    )

    fun checkForUpdates(callback: (ReleaseInfo?) -> Unit) {
        Thread {
            try {
                val isDebugBuild = BuildConfig.DEBUG
                val url = if (isDebugBuild) {
                    "https://api.github.com/repos/$repoOwner/$repoName/releases"
                } else {
                    "https://api.github.com/repos/$repoOwner/$repoName/releases/latest"
                }

                val request = Request.Builder()
                    .url(url)
                    .header("Accept", "application/vnd.github.v3+json")
                    .header("User-Agent", "YTMusic-OTA")
                    .build()

                client.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        callback(null)
                        return@use
                    }

                    val body = response.body?.string() ?: return@use
                    val releaseInfo = if (isDebugBuild) {
                        parseDebugReleases(body)
                    } else {
                        parseReleaseRelease(body)
                    }
                    callback(releaseInfo)
                }
            } catch (e: Exception) {
                Log.e("OtaUpdater", "Check failed", e)
                callback(null)
            }
        }.start()
    }

    private fun parseDebugReleases(json: String): ReleaseInfo? {
        val array = JsonParser.parseString(json).asJsonArray
        val currentVersion = getCurrentVersionName()

        for (element in array) {
            val release = element.asJsonObject
            if (release.get("prerelease").asBoolean) {
                val tagName = release.get("tag_name").asString.removePrefix("v")
                if (isNewerVersion(currentVersion, tagName)) {
                    val asset = findAsset(release.get("assets").asJsonArray, "-debug.apk")
                    asset?.let { return parseReleaseInfo(tagName, it, release) }
                }
            }
        }
        return null
    }

    private fun parseReleaseRelease(json: String): ReleaseInfo? {
        val release = JsonParser.parseString(json).asJsonObject
        val tagName = release.get("tag_name").asString.removePrefix("v")
        val currentVersion = getCurrentVersionName()

        if (!isNewerVersion(currentVersion, tagName)) return null

        val asset = findAsset(release.get("assets").asJsonArray, "-release.apk")
        asset?.let { return parseReleaseInfo(tagName, it, release) }
        return null
    }

    private fun findAsset(assets: JsonArray, suffix: String): JsonObject? {
        for (element in assets) {
            val asset = element.asJsonObject
            val name = asset.get("name").asString
            if (name.endsWith(suffix)) {
                return asset
            }
        }
        return null
    }

    private fun parseReleaseInfo(tagName: String, asset: JsonObject, release: JsonObject): ReleaseInfo {
        return ReleaseInfo(
            versionName = tagName,
            downloadUrl = asset.get("browser_download_url").asString,
            isPreRelease = release.get("prerelease").asBoolean,
            changelog = release.get("body")?.asString ?: ""
        )
    }

    private fun getCurrentVersionName(): String {
        return context.packageManager.getPackageInfo(context.packageName, 0).versionName
    }

    private fun isNewerVersion(current: String, remote: String): Boolean {
        val cleanCurrent = current.split("-")[0]
        val cleanRemote = remote.split("-")[0]
        return compareVersions(cleanRemote, cleanCurrent) > 0
    }

    private fun compareVersions(v1: String, v2: String): Int {
        val parts1 = v1.split(".").map { it.toInt() }.toList()
        val parts2 = v2.split(".").map { it.toInt() }.toList()
        val maxSize = maxOf(parts1.size, parts2.size)

        for (i in 0 until maxSize) {
            val p1 = if (i < parts1.size) parts1[i] else 0
            val p2 = if (i < parts2.size) parts2[i] else 0
            if (p1 != p2) return p1 - p2
        }
        return 0
    }

    fun downloadAndInstall(downloadUrl: String, callback: Callback) {
        Thread {
            try {
                val request = Request.Builder()
                    .url(downloadUrl)
                    .build()

                client.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        callback.onError("Download failed: ${response.code}")
                        return@use
                    }

                    val body = response.body ?: return@use
                    val totalBytes = body.contentLength()
                    var downloadedBytes = 0L

                    val apkFile = File(context.cacheDir, "update-${System.currentTimeMillis()}.apk")
                    apkFile.parentFile?.mkdirs()

                    val sink = apkFile.sink().buffer()
                    val source = body.source()

                    while (true) {
                        val read = source.read(sink.buffer, 8192)
                        if (read == -1L) break
                        downloadedBytes += read
                        if (totalBytes > 0) {
                            callback.onProgress(downloadedBytes.toFloat() / totalBytes)
                        }
                    }

                    sink.flush()
                    sink.close()
                    source.close()

                    installApk(apkFile)
                    callback.onSuccess()
                }
            } catch (e: Exception) {
                Log.e("OtaUpdater", "Download failed", e)
                callback.onError(e.message ?: "Unknown error")
            }
        }.start()
    }

    private fun installApk(apkFile: File) {
        val apkUri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            androidx.core.content.FileProvider.getUriForFile(
                context,
                "${context.packageName}.fileprovider",
                apkFile
            )
        } else {
            Uri.fromFile(apkFile)
        }

        val intent = android.content.Intent(android.content.Intent.ACTION_VIEW).apply {
            setDataAndType(apkUri, "application/vnd.android.package-archive")
            flags = android.content.Intent.FLAG_ACTIVITY_NEW_TASK or
                    android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION
        }
        context.startActivity(intent)
    }
}