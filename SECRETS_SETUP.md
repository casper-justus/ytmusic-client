# GitHub Actions Secrets Configuration Guide

This document lists all the secrets required for the build & release workflow.

## Required Secrets (Repository Settings → Secrets and variables → Actions)

### Android Debug Keystore (Required for Debug/Pre-release builds)
| Secret Name | Description | Example |
|-------------|-------------|---------|
| `ANDROID_DEBUG_KEYSTORE_BASE64` | Base64-encoded debug.keystore file | `base64 -i debug.keystore \| pbcopy` |
| `ANDROID_DEBUG_KEYSTORE_PASSWORD` | Keystore password | `android` |
| `ANDROID_DEBUG_KEY_ALIAS` | Key alias | `debug` |
| `ANDROID_DEBUG_KEY_PASSWORD` | Key password | `android` |

### Android Release Keystore (Required for Release builds)
| Secret Name | Description | Example |
|-------------|-------------|---------|
| `ANDROID_RELEASE_KEYSTORE_BASE64` | Base64-encoded release.keystore file | `base64 -i release.keystore \| pbcopy` |
| `ANDROID_RELEASE_KEYSTORE_PASSWORD` | Keystore password | `your_secure_password` |
| `ANDROID_RELEASE_KEY_ALIAS` | Key alias | `release` |
| `ANDROID_RELEASE_KEY_PASSWORD` | Key password | `your_secure_password` |

### iOS (Optional - for App Store builds)
| Secret Name | Description |
|-------------|-------------|
| `APP_STORE_CONNECT_ISSUER_ID` | App Store Connect API issuer ID |
| `APP_STORE_CONNECT_API_KEY_ID` | App Store Connect API key ID |
| `APP_STORE_CONNECT_API_PRIVATE_KEY` | Base64-encoded .p8 private key |

## How to Generate Debug Keystore

```bash
# Generate keystore
keytool -genkeypair \
  -alias debug \
  -keypass android \
  -keystore debug.keystore \
  -storepass android \
  -dname "CN=Android Debug,O=Android,C=US" \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000

# Convert to base64 (copy output to GitHub secret)
base64 -i debug.keystore | pbcopy  # macOS
base64 -i debug.keystore | clip    # Windows
base64 -w0 debug.keystore          # Linux
```

## How to Generate Release Keystore

```bash
# Generate release keystore (USE STRONG PASSWORDS!)
keytool -genkeypair \
  -alias release \
  -keypass YOUR_KEY_PASSWORD \
  -keystore release.keystore \
  -storepass YOUR_STORE_PASSWORD \
  -dname "CN=Your Name,O=Your Organization,C=US" \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000

# Convert to base64
base64 -w0 release.keystore
```

## Important Notes

1. **Debug keystore consistency**: Use the SAME debug.keystore across all CI runs and local builds to allow debug OTA updates to work.

2. **Release keystore security**: Never commit the release keystore. Only store as base64 in GitHub secrets.

3. **Key validity**: 10000 days (~27 years) ensures long-term compatibility.

4. **Base64 encoding**: Use `base64 -w0` (no line wrapping) for Linux, `base64` for macOS.

5. **Workflow triggers**:
   - Push tag `v1.0.0` → Release build
   - Push tag `v1.0.0-beta.1` or `v1.0.0-debug` → Debug build
   - Manual trigger with `build_type` input

## Verification

After adding secrets, verify they work by running the workflow manually with a test tag:

```bash
git tag v0.0.1-test
git push origin v0.0.1-test
```

Check the Actions tab for successful build and release creation.