# OTA Update Setup Guide

This guide explains how to configure Over-The-Air (OTA) updates for the YTMusic client using GitHub Releases.

## Architecture Overview

The OTA system supports two separate channels:
- **Debug Channel**: For development/testing builds (pre-releases)
- **Release Channel**: For production builds (stable releases)

Each channel uses different signing keys, so debug builds can only update to debug builds, and release builds can only update to release builds.

## Prerequisites

1. **GitHub Repository** with releases enabled
2. **Consistent Debug Keystore** for debug builds across CI runs
3. **Release Keystore** for production builds
4. **Flutter 3.22+** with Android SDK 34

## Setup Steps

### 1. Generate Debug Keystore

Run the keystore generation script:

```bash
./scripts/generate_debug_keystore.sh
```

This creates `android/app/debug.keystore` which should be:
- Committed to the repository (for local development)
- **OR** stored as base64 in CI secrets (for CI builds)

### 2. Configure GitHub Secrets

In your GitHub repository settings → Secrets and variables → Actions, add:

**For Debug Builds:**
```
ANDROID_KEYSTORE_BASE64=<base64 encoded debug.keystore>
ANDROID_KEYSTORE_PASSWORD=android
ANDROID_KEY_ALIAS=debug
ANDROID_KEY_PASSWORD=android
```

**For Release Builds:**
```
RELEASE_KEYSTORE_BASE64=<base64 encoded release.keystore>
RELEASE_KEYSTORE_PASSWORD=<your password>
RELEASE_KEY_ALIAS=<your alias>
RELEASE_KEY_PASSWORD=<your password>
```

### 3. Update Repository Configuration

Edit `.github/workflows/release.yml` and replace:
```yaml
repoOwner = "YOUR_GITHUB_USERNAME"
repoName = "YOUR_REPO_NAME"
```

In `android/app/src/main/java/com/ytmusic/client/OtaUpdater.kt`:
```kotlin
private val repoOwner = "YOUR_GITHUB_USERNAME"
private val repoName = "YOUR_REPO_NAME"
```

### 4. Create Release Tags

**For Debug/Pre-release:**
```bash
git tag v1.0.0-debug
git push origin v1.0.0-debug
```

**For Release:**
```bash
git tag v1.0.0
git push origin v1.0.0
```

The workflow will automatically:
1. Build both debug and release APKs for all architectures
2. Rename them with version and architecture (e.g., `ytmusic-1.0.0-arm64-v8a-debug.apk`)
3. Create a GitHub Release with the APKs attached
4. Mark debug tags as pre-releases, release tags as stable

### 5. APK Naming Convention

The workflow expects APKs named:
- Debug: `ytmusic-{version}-{arch}-debug.apk`
- Release: `ytmusic-{version}-{arch}-release.apk`

The app matches its current build type to the correct suffix.

## Version Comparison

The app uses semantic versioning comparison:
- `1.0.1` > `1.0.0`
- `1.1.0` > `1.0.9`
- `2.0.0` > `1.9.9`

Pre-release suffixes (`-debug`, `-beta`, `-alpha`) are stripped for comparison.

## Android Permissions Required

The following permissions are added to `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" />
```

And a `FileProvider` for secure APK sharing:

```xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/file_paths" />
</provider>
```

## Testing OTA Updates

### Local Testing

1. Build debug APK:
   ```bash
   flutter build apk --debug
   ```

2. Upload to a test GitHub release (pre-release)

3. Install current version on device

4. Open Settings → Advanced → App Updates → Check Now

### CI Testing

1. Push a debug tag: `git tag v1.0.1-debug && git push origin v1.0.1-debug`

2. Wait for workflow to complete

3. Check GitHub Releases for the new APKs

4. Test update from device

## Troubleshooting

### "Install Failed: Update Incompatible"
- **Cause**: Trying to update debug build with release APK (or vice versa)
- **Fix**: Ensure you're downloading the correct APK type for your build variant

### "Permission Denied: REQUEST_INSTALL_PACKAGES"
- **Cause**: User hasn't granted "Install unknown apps" permission
- **Fix**: App will prompt to open settings; user must enable for your app

### "No Update Found"
- **Cause**: Version comparison failed or no matching APK in release
- **Fix**: Check tag format (`v1.0.0`), APK naming, and GitHub release assets

### "Network Error"
- **Cause**: GitHub API rate limit or connectivity
- **Fix**: Add GitHub token for higher rate limits, check network

## GitHub API Rate Limits

Unauthenticated requests: 60/hour
Authenticated requests: 5000/hour

For production, add a GitHub token to the workflow:
```yaml
env:
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Security Considerations

1. **Signature Verification**: Android enforces signature matching automatically
2. **HTTPS Only**: All downloads use HTTPS
3. **No Root Required**: Uses standard Android package installer
4. **User Consent**: User must approve each installation

## Architecture Details

### Platform Channel
- `MethodChannel('com.ytmusic.client/ota')`
- Methods: `checkForUpdates`, `downloadAndInstall`, `canInstallPackages`, `openInstallSettings`

### Dart Service
- `OtaService` in `lib/core/services/ota_service.dart`
- Provides `Stream<OtaStatus>` for UI updates
- Handles version comparison and update flow

### Kotlin Implementation
- `OtaUpdater` in `android/app/src/main/java/com/ytmusic/client/OtaUpdater.kt`
- Uses OkHttp for GitHub API calls
- Downloads to cache directory
- Uses `FileProvider` for secure installation intent

## Customization

### Change Update Channel
Modify the suffix matching in `OtaUpdater.kt`:
```kotlin
val targetSuffix = if (isDebug) "-debug.apk" else "-release.apk"
```

### Add Custom Headers
```kotlin
val request = Request.Builder()
    .url(url)
    .header("Authorization", "token YOUR_GITHUB_TOKEN")
    .header("Accept", "application/vnd.github.v3+json")
    .build()
```

### Background Checks
Add a `WorkManager` periodic task to check for updates automatically:

```kotlin
PeriodicWorkRequestBuilder<OtaCheckWorker>(24, TimeUnit.HOURS).build()
```

## Migration from Other Systems

If migrating from Firebase App Distribution, CodePush, etc.:
1. Keep existing version codes consistent
2. Ensure GitHub release tags match version names
3. Test update path from old version to new OTA version

## Support

For issues:
1. Check GitHub Actions logs for build failures
2. Check device logs for installation errors
3. Verify APK naming and GitHub release assets
4. Ensure debug keystore consistency across builds