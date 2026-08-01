part of 'track.freezed.dart';
part of 'track.g.dart';

@freezed
abstract class Track with _$Track {
  const factory Track({
    required String id,
    required String title,
    required String artist,
    required String artistId,
    String? album,
    String? albumId,
    required int duration,
    required String artworkUrl,
    String? audioStreamUrl,
    int? itag,
    int? bitrate,
    String? lyricsId,
    bool? isExplicit,
    @Default(false) bool isAvailable,
    @Default([]) List<String> availableCountries,
    Map<String, dynamic>? rawData,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

@freezed
abstract class Playlist with _$Playlist {
  const factory Playlist({
    required String id,
    required String title,
    String? description,
    required String artworkUrl,
    required int trackCount,
    @Default([]) List<Track> tracks,
    String? author,
    String? authorId,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? rawData,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
}

@freezed
abstract class Artist with _$Artist {
  const factory Artist({
    required String id,
    required String name,
    required String artworkUrl,
    String? description,
    int? subscriberCount,
    @Default([]) List<String> genres,
    @Default([]) List<Album> albums,
    @Default([]) List<Track> topTracks,
    Map<String, dynamic>? rawData,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@freezed
abstract class Album with _$Album {
  const factory Album({
    required String id,
    required String title,
    required String artist,
    required String artistId,
    required String artworkUrl,
    required int year,
    required int trackCount,
    @Default([]) List<Track> tracks,
    String? description,
    @Default([]) List<String> genres,
    DateTime? releaseDate,
    Map<String, dynamic>? rawData,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

@freezed
abstract class QueueState with _$QueueState {
  const factory QueueState({
    required Track currentTrack,
    @Default([]) List<Track> queueList,
    @Default(0) int index,
    @Default(false) bool isRadioActive,
    String? continuationToken,
    @Default(PlaybackMode.sequential) PlaybackMode mode,
    @Default(0.0) double currentPosition,
    @Default(Duration.zero) Duration bufferedPosition,
  }) = _QueueState;

  factory QueueState.fromJson(Map<String, dynamic> json) => _$QueueStateFromJson(json);
}

@freezed
abstract class Lyrics with _$Lyrics {
  const factory Lyrics({
    required String trackId,
    required LyricsSource source,
    @Default([]) List<LyricsLine> lines,
    bool? hasSynced,
    String? rawLrc,
  }) = _Lyrics;

  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);
}

@freezed
abstract class LyricsLine with _$LyricsLine {
  const factory LyricsLine({
    required Duration time,
    required String text,
    @Default([]) List<WordTimestamp> words,
  }) = _LyricsLine;

  factory LyricsLine.fromJson(Map<String, dynamic> json) => _$LyricsLineFromJson(json);
}

@freezed
abstract class WordTimestamp with _$WordTimestamp {
  const factory WordTimestamp({
    required Duration start,
    required Duration end,
    required String word,
  }) = _WordTimestamp;

  factory WordTimestamp.fromJson(Map<String, dynamic> json) => _$WordTimestampFromJson(json);
}

enum LyricsSource { innerTube, lrclib, none }

enum PlaybackMode { sequential, shuffle, repeatOne, repeatAll }

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String query,
    @Default([]) List<Track> songs,
    @Default([]) List<Playlist> playlists,
    @Default([]) List<Artist> artists,
    @Default([]) List<Album> albums,
    @Default([]) List<Video> videos,
    String? continuationToken,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);
}

@freezed
abstract class Video with _$Video {
  const factory Video({
    required String id,
    required String title,
    required String channelTitle,
    required String channelId,
    required int duration,
    required String artworkUrl,
    int? viewCount,
    DateTime? publishedAt,
    bool? isLive,
    Map<String, dynamic>? rawData,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}

@freezed
abstract class HomeSection with _$HomeSection {
  const factory HomeSection({
    required String title,
    required HomeSectionType type,
    required List<dynamic> items,
    String? navigationEndpoint,
    Map<String, dynamic>? rawData,
  }) = _HomeSection;

  factory HomeSection.fromJson(Map<String, dynamic> json) => _$HomeSectionFromJson(json);
}

enum HomeSectionType { quickPicks, recommendedAlbums, moods, genres, newReleases, libraryPlaylists, recentlyPlayed, mixedForYou }

@freezed
abstract class MoodCategory with _$MoodCategory {
  const factory MoodCategory({
    required String id,
    required String title,
    required String artworkUrl,
    String? description,
    @Default([]) List<Playlist> playlists,
    Map<String, dynamic>? rawData,
  }) = _MoodCategory;

  factory MoodCategory.fromJson(Map<String, dynamic> json) => _$MoodCategoryFromJson(json);
}

@freezed
abstract class AudioStream with _$AudioStream {
  const factory AudioStream({
    required String url,
    required int itag,
    required String mimeType,
    required int bitrate,
    required String container,
    required String codec,
    String? signature,
    String? poToken,
    String? cpn,
    @Default(false) bool isEncrypted,
    Map<String, dynamic>? rawData,
  }) = _AudioStream;

  factory AudioStream.fromJson(Map<String, dynamic> json) => _$AudioStreamFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    required String avatarUrl,
    String? email,
    @Default([]) List<String> subscriptionTypes,
    Map<String, dynamic>? rawData,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}