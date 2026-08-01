# YTMusic Client

A fully-featured, open-source YouTube Music client built with Flutter.

## Features

- **Full YouTube Music Parity**: Home feed, search, artist/album/playlist views, dynamic queue, radio
- **Ad-Free Streaming**: Direct audio stream extraction (Opus 251, AAC 140)
- **Background Playback**: Native MediaSession integration
- **Synced Lyrics**: Dual-source (YouTube Music + LRCLIB)
- **Offline Downloads**: Local file storage with SQLite
- **Equalizer**: 5-band parametric EQ
- **Dynamic Theming**: Colors extracted from album artwork
- **SponsorBlock**: Skip non-music segments
- **Privacy-First**: Anonymous mode, no telemetry
- **Gapless Playback**: Predictive preloading
- **OTA Updates**: Dual-channel (Debug/Release) via GitHub Releases

## Architecture

```
lib/
├── core/
│   ├── data/           # Network, database, extractors
│   ├── domain/         # Business logic (queue, player, lyrics)
│   ├── presentation/   # Providers, router, theme
│   └── services/       # Background audio, downloads, SponsorBlock
├── features/           # Feature modules (home, search, library, etc.)
├── shared/
│   ├── models/         # Data models (Track, Playlist, etc.)
│   └── widgets/        # Reusable UI components
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK 3.22+
- Dart 3.4+
- Android Studio / Xcode for platform-specific builds

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/ytmusic_client.git
cd ytmusic_client

# Install dependencies
flutter pub get

# Generate code (freezed, drift, riverpod)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Configuration

The app uses reverse-engineered InnerTube APIs - no API keys required.

For authenticated features (library sync, playlists):
1. Open YouTube Music in browser
2. Copy cookies from DevTools > Application > Cookies
3. Paste in Settings > Sign in

## Key Components

### InnerTube Client (`core/data/innertube_client.dart`)
- Implements YouTube Music's private API
- Client contexts: WEB_REMIX (browsing), ANDROID_MUSIC (streams)
- Automatic retry with exponential backoff

### Stream Extractor (`core/data/stream_extractor.dart`)
- NewPipeExtractor port for Dart
- Signature deciphering from player.js
- PoToken integration for anti-throttling

### PoToken Provider (`core/data/po_token_provider.dart`)
- Proof-of-origin token generation
- Caching with 1-hour TTL
- Automatic renewal on 403 errors

### Queue Controller (`core/domain/queue_controller.dart`)
- Dynamic queue from `/next` endpoint
- Predictive preloading at 80% playback
- Infinite radio generation

### Lyrics Resolver (`core/domain/lyrics_resolver.dart`)
- Primary: YouTube Music native lyrics
- Fallback: LRCLIB API (synced LRC)
- Real-time line highlighting

### Database (`core/data/database.dart`)
- Drift/SQLite for offline storage
- Tracks, playlists, history, lyrics cache
- Download management

## Platform Support

| Platform | Status |
|----------|--------|
| Android  | ✅ Full |
| iOS      | ✅ Full |
| Web      | ⚠️ Limited (CORS) |
| Desktop  | ✅ Full |

## OTA Updates

The app supports Over-The-Air updates via GitHub Releases with dual-channel support:

- **Debug Channel**: Pre-release builds, signed with debug keystore
- **Release Channel**: Stable builds, signed with release keystore

See [OTA_SETUP.md](OTA_SETUP.md) for complete setup instructions.

### Quick Start

1. Generate debug keystore: `./scripts/generate_debug_keystore.sh`
2. Add GitHub secrets for keystore credentials
3. Update `repoOwner`/`repoName` in `.github/workflows/release.yml` and `OtaUpdater.kt`
4. Push version tags: `git tag v1.0.0 && git push origin v1.0.0`
5. Check for updates in Settings → Advanced → App Updates

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `flutter test`
5. Run linter: `flutter analyze`
6. Submit a PR

## Legal

This project is for educational purposes. It reverse-engineers public API endpoints used by the official YouTube Music clients. No copyrighted content is distributed.

Respect YouTube's Terms of Service. Consider supporting artists through official channels.

## License

MIT License - see LICENSE file for details.