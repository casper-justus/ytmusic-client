# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.android.** { *; }
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.plugins.** { *; }

# OkHttp
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Okio
-keep class okio.** { *; }
-dontwarn okio.**

# Gson
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# Kotlin
-keep class kotlin.** { *; }
-dontwarn kotlin.**

# Permission Handler
-keep class com.baseflow.permissionhandler.** { *; }
-dontwarn com.baseflow.permissionhandler.**

# Just Audio
-keep class com.ryanheise.just_audio.** { *; }
-keep class com.ryanheise.audio_session.** { *; }
-dontwarn com.ryanheise.just_audio.**
-dontwarn com.ryanheise.audio_session.**

# Media Kit
-keep class com.media_kit.** { *; }
-dontwarn com.media_kit.**

# Drift/SQLite
-keep class com.github.simonschwartz.** { *; }
-keep class io.drift.** { *; }
-dontwarn io.drift.**

# Secure Storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }
-dontwarn com.it_nomads.fluttersecurestorage.**

# Background Service
-keep class io.flutter.plugins.backgroundservice.** { *; }
-dontwarn io.flutter.plugins.backgroundservice.**

# WorkManager
-keep class androidx.work.** { *; }
-dontwarn androidx.work.**

# File Provider
-keep class androidx.core.content.FileProvider { *; }