#!/bin/bash
# Generate debug keystore for consistent debug builds
# Run this once to create the keystore, then commit it to the repo (or store in CI secrets)

set -e

KEYSTORE_PATH="android/app/debug.keystore"
KEYSTORE_PASSWORD="android"
KEY_ALIAS="debug"
KEY_PASSWORD="android"
VALIDITY_DAYS=10000

if [ -f "$KEYSTORE_PATH" ]; then
    echo "Debug keystore already exists at $KEYSTORE_PATH"
    exit 0
fi

echo "Generating debug keystore..."

keytool -genkeypair \
    -alias "$KEY_ALIAS" \
    -keypass "$KEY_PASSWORD" \
    -keystore "$KEYSTORE_PATH" \
    -storepass "$KEYSTORE_PASSWORD" \
    -dname "CN=Android Debug,O=Android,C=US" \
    -keyalg RSA \
    -keysize 2048 \
    -validity "$VALIDITY_DAYS"

echo "Debug keystore created at $KEYSTORE_PATH"
echo ""
echo "IMPORTANT: Add this keystore to your CI/CD secrets:"
echo "  - keystore file: debug.keystore (base64 encoded)"
echo "  - keystore password: $KEYSTORE_PASSWORD"
echo "  - key alias: $KEY_ALIAS"
echo "  - key password: $KEY_PASSWORD"
echo ""
echo "For GitHub Actions, add as repository secrets:"
echo "  - ANDROID_KEYSTORE_BASE64"
echo "  - ANDROID_KEYSTORE_PASSWORD"
echo "  - ANDROID_KEY_ALIAS"
echo "  - ANDROID_KEY_PASSWORD"