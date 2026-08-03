library ytmusic_client.core.presentation.providers;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart';
import '../data/innertube_client.dart';
import '../data/po_token_provider.dart';
import '../data/stream_extractor.dart';
import '../data/database.dart';
import '../domain/queue_controller.dart';
import '../domain/lyrics_resolver.dart';
import '../domain/audio_player.dart';
import '../domain/session_manager.dart';
import '../services/ota_service.dart';
import '../../shared/models/track.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialized in main.dart');
});

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final poTokenProvider = Provider<PoTokenProvider>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PoTokenProviderImpl(prefs: prefs);
});

final innerTubeClientProvider = Provider<InnerTubeClient>((ref) {
  final poToken = ref.watch(poTokenProvider);
  return InnerTubeClientImpl(poTokenProvider: poToken);
});

final streamExtractorProvider = Provider<StreamExtractor>((ref) {
  final poToken = ref.watch(poTokenProvider);
  final cipher = CipherDecipherImpl();
  return NewPipeExtractorImpl(
    poTokenProvider: poToken,
    cipherDecipher: cipher,
  );
});

final queueControllerProvider = Provider<QueueController>((ref) {
  final innerTube = ref.watch(innerTubeClientProvider);
  final extractor = ref.watch(streamExtractorProvider);
  return QueueController(innerTube: innerTube, streamExtractor: extractor);
});

final lyricsResolverProvider = Provider<LyricsResolver>((ref) {
  final innerTube = ref.watch(innerTubeClientProvider);
  return DualSourceLyricsResolver(innerTube: innerTube);
});

final audioPlayerProvider = Provider<AudioPlayerService>((ref) {
  return AudioPlayerService();
});

final sessionManagerProvider = Provider<SessionManager>((ref) {
  return SessionManager();
});

final authModeProvider =
    StateNotifierProvider<AuthModeNotifier, AuthMode>((ref) {
  return AuthModeNotifier(ref.watch(sessionManagerProvider));
});

class AuthModeNotifier extends StateNotifier<AuthMode> {
  final SessionManager _sessionManager;

  AuthModeNotifier(this._sessionManager) : super(_sessionManager.currentMode) {
    _sessionManager
        .initialize()
        .then((_) => state = _sessionManager.currentMode);
  }

  Future<void> setAuthenticated(String cookies, UserProfile profile) async {
    await _sessionManager.setAuthenticatedMode(cookies, profile);
    state = AuthMode.authenticated;
  }

  Future<void> setAnonymous() async {
    await _sessionManager.setAnonymousMode();
    state = AuthMode.anonymous;
  }
}

final homeFeedProvider = FutureProvider.family<List<HomeSection>, String?>(
    (ref, continuation) async {
  final innerTube = ref.watch(innerTubeClientProvider);
  final response = await innerTube.browse(
      browseId: 'FEmusic_home', continuation: continuation);
  return _parseHomeFeed(response);
});

final searchProvider =
    FutureProvider.family<SearchResult, SearchParams>((ref, params) async {
  final innerTube = ref.watch(innerTubeClientProvider);
  final response = await innerTube.search(
    query: params.query,
    filter: params.filter,
    continuation: params.continuation,
  );
  return _parseSearchResults(response, params.query);
});

final artistProvider =
    FutureProvider.family<Artist, String>((ref, artistId) async {
  final innerTube = ref.watch(innerTubeClientProvider);
  final response = await innerTube.browse(browseId: artistId);
  return _parseArtist(response);
});

final albumProvider =
    FutureProvider.family<Album, String>((ref, browseId) async {
  final innerTube = ref.watch(innerTubeClientProvider);
  final response = await innerTube.browse(browseId: browseId);
  return _parseAlbum(response);
});

final playlistProvider =
    FutureProvider.family<Playlist, String>((ref, playlistId) async {
  final innerTube = ref.watch(innerTubeClientProvider);
  final response = await innerTube.getPlaylist(playlistId: playlistId);
  return _parsePlaylist(response);
});

final moodCategoriesProvider = FutureProvider<List<MoodCategory>>((ref) async {
  final innerTube = ref.watch(innerTubeClientProvider);
  final response = await innerTube.browse(browseId: 'FEmusic_moods_and_genres');
  return _parseMoodCategories(response);
});

final lyricsProvider =
    FutureProvider.family<Lyrics, LyricsParams>((ref, params) async {
  final resolver = ref.watch(lyricsResolverProvider);
  return resolver.resolveLyrics(
    params.trackId,
    title: params.title,
    artist: params.artist,
    duration: params.duration,
  );
});

class SearchParams {
  final String query;
  final SearchFilter filter;
  final String? continuation;

  SearchParams({required this.query, required this.filter, this.continuation});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchParams &&
          runtimeType == other.runtimeType &&
          query == other.query &&
          filter == other.filter &&
          continuation == other.continuation;

  @override
  int get hashCode => Object.hash(query, filter, continuation);
}

class LyricsParams {
  final String trackId;
  final String? title;
  final String? artist;
  final int? duration;

  LyricsParams({required this.trackId, this.title, this.artist, this.duration});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LyricsParams &&
          runtimeType == other.runtimeType &&
          trackId == other.trackId &&
          title == other.title &&
          artist == other.artist &&
          duration == other.duration;

  @override
  int get hashCode => Object.hash(trackId, title, artist, duration);
}

List<HomeSection> _parseHomeFeed(Map<String, dynamic> response) {
  final sections = <HomeSection>[];
  try {
    final tabs = response['contents']?['singleColumnBrowseResultsRenderer']
        ?['tabs'] as List?;
    if (tabs != null) {
      for (final tab in tabs) {
        final tabRenderer = tab['tabRenderer'];
        if (tabRenderer == null) continue;

        final content = tabRenderer['content']?['sectionListRenderer']
            ?['contents'] as List?;
        if (content != null) {
          for (final section in content) {
            final parsed = _parseHomeSection(section);
            if (parsed != null) sections.add(parsed);
          }
        }
      }
    }
  } catch (e) {
    // Handle parsing errors
  }
  return sections;
}

HomeSection? _parseHomeSection(Map<String, dynamic> section) {
  try {
    final musicShelf = section['musicShelfRenderer'];
    if (musicShelf == null) return null;

    final title = musicShelf['title']?['runs']?[0]?['text'] as String? ??
        musicShelf['title']?['simpleText'] as String? ??
        '';

    final items = musicShelf['contents']?['musicShelfContentsRenderer']
            ?['items'] as List? ??
        [];

    return HomeSection(
      title: title,
      type: _mapSectionType(title),
      items: items,
      navigationEndpoint: musicShelf['navigationEndpoint']?['browseEndpoint']
          ?['browseId'] as String?,
      rawData: section,
    );
  } catch (_) {
    return null;
  }
}

HomeSectionType _mapSectionType(String title) {
  final lower = title.toLowerCase();
  if (lower.contains('quick pick') || lower.contains('mixed for you'))
    return HomeSectionType.quickPicks;
  if (lower.contains('recommended album'))
    return HomeSectionType.recommendedAlbums;
  if (lower.contains('mood')) return HomeSectionType.moods;
  if (lower.contains('genre')) return HomeSectionType.genres;
  if (lower.contains('new release')) return HomeSectionType.newReleases;
  if (lower.contains('library playlist'))
    return HomeSectionType.libraryPlaylists;
  if (lower.contains('recently played')) return HomeSectionType.recentlyPlayed;
  return HomeSectionType.mixedForYou;
}

SearchResult _parseSearchResults(Map<String, dynamic> response, String query) {
  // Implementation would parse the search response
  return SearchResult(query: query);
}

Artist _parseArtist(Map<String, dynamic> response) {
  // Implementation would parse artist response
  return Artist(id: '', name: '', artworkUrl: '');
}

Album _parseAlbum(Map<String, dynamic> response) {
  // Implementation would parse album response
  return Album(
      id: '',
      title: '',
      artist: '',
      artistId: '',
      artworkUrl: '',
      year: 0,
      trackCount: 0);
}

Playlist _parsePlaylist(Map<String, dynamic> response) {
  // Implementation would parse playlist response
  return Playlist(id: '', title: '', artworkUrl: '', trackCount: 0);
}

List<MoodCategory> _parseMoodCategories(Map<String, dynamic> response) {
  // Implementation would parse mood categories
  return [];
}

final otaServiceProvider = Provider<OtaService>((ref) {
  return OtaService();
});

final otaStatusProvider = StreamProvider<OtaStatus>((ref) {
  return OtaService.statusStream;
});
