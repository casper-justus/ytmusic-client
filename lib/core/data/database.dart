library ytmusic_client.core.data.database;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:convert' as convert;
import 'dart:io';

part 'database.g.dart';

@DataClassName('TrackEntity')
class Tracks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get artistId => text()();
  TextColumn get album => text().nullable()();
  TextColumn get albumId => text().nullable()();
  IntColumn get duration => integer()();
  TextColumn get artworkUrl => text()();
  TextColumn get audioStreamUrl => text().nullable()();
  IntColumn get itag => integer().nullable()();
  IntColumn get bitrate => integer().nullable()();
  TextColumn get lyricsId => text().nullable()();
  BoolColumn get isExplicit => boolean().withDefault(const Constant(false))();
  BoolColumn get isAvailable => boolean().withDefault(const Constant(false))();
  TextColumn get availableCountries => text()
      .map(const _StringListConverter())
      .withDefault(const Constant(''))();
  TextColumn get rawData => text().map(const _JsonMapConverter()).nullable()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isOffline => boolean().withDefault(const Constant(false))();
  TextColumn get offlineFilePath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PlaylistEntity')
class Playlists extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get artworkUrl => text()();
  IntColumn get trackCount => integer()();
  TextColumn get author => text().nullable()();
  TextColumn get authorId => text().nullable()();
  BoolColumn get isPublic => boolean().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get rawData => text().map(const _JsonMapConverter()).nullable()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isLocal => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PlaylistTrackEntity')
class PlaylistTracks extends Table {
  TextColumn get playlistId =>
      text().references(Playlists, #id, onDelete: KeyAction.cascade)();
  TextColumn get trackId =>
      text().references(Tracks, #id, onDelete: KeyAction.cascade)();
  IntColumn get position => integer()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {playlistId, trackId};
}

@DataClassName('ArtistEntity')
class Artists extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get artworkUrl => text()();
  TextColumn get description => text().nullable()();
  IntColumn get subscriberCount => integer().nullable()();
  TextColumn get genres => text()
      .map(const _StringListConverter())
      .withDefault(const Constant(''))();
  TextColumn get rawData => text().map(const _JsonMapConverter()).nullable()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AlbumEntity')
class Albums extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get artistId => text()();
  TextColumn get artworkUrl => text()();
  IntColumn get year => integer()();
  IntColumn get trackCount => integer()();
  TextColumn get description => text().nullable()();
  TextColumn get genres => text()
      .map(const _StringListConverter())
      .withDefault(const Constant(''))();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  TextColumn get rawData => text().map(const _JsonMapConverter()).nullable()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('HistoryEntity')
class History extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get trackId =>
      text().references(Tracks, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get playedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get progress => integer().withDefault(const Constant(0))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

@DataClassName('LyricsEntity')
class LyricsCache extends Table {
  TextColumn get trackId => text()();
  TextColumn get source => text().withDefault(const Constant('none'))();
  TextColumn get rawLrc => text().nullable()();
  TextColumn get linesJson => text().map(const _JsonListConverter())();
  BoolColumn get hasSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {trackId};
}

@DataClassName('SearchHistoryEntity')
class SearchHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
  TextColumn get filter => text()();
  DateTimeColumn get searchedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SettingsEntity')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().map(const _JsonValueConverter())();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('DownloadEntity')
class Downloads extends Table {
  TextColumn get id => text()();
  TextColumn get trackId =>
      text().references(Tracks, #id, onDelete: KeyAction.cascade)();
  TextColumn get filePath => text()();
  IntColumn get totalBytes => integer()();
  IntColumn get downloadedBytes => integer()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get error => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class _StringListConverter extends TypeConverter<List<String>, String> {
  const _StringListConverter();

  @override
  List<String> fromSql(String fromDb) =>
      fromDb.isEmpty ? [] : fromDb.split('|');

  @override
  String toSql(List<String> value) => value.join('|');
}

class _JsonMapConverter extends TypeConverter<Map<String, dynamic>, String> {
  const _JsonMapConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) =>
      fromDb.isEmpty ? {} : convert.json.decode(fromDb) as Map<String, dynamic>;

  @override
  String toSql(Map<String, dynamic> value) => convert.json.encode(value);
}

class _JsonListConverter extends TypeConverter<List<dynamic>, String> {
  const _JsonListConverter();

  @override
  List<dynamic> fromSql(String fromDb) =>
      fromDb.isEmpty ? [] : convert.json.decode(fromDb) as List<dynamic>;

  @override
  String toSql(List<dynamic> value) => convert.json.encode(value);
}

class _JsonValueConverter extends TypeConverter<dynamic, String> {
  const _JsonValueConverter();

  @override
  dynamic fromSql(String fromDb) =>
      fromDb.isEmpty ? null : convert.json.decode(fromDb);

  @override
  String toSql(dynamic value) => convert.json.encode(value);
}

@DriftDatabase(tables: [
  Tracks,
  Playlists,
  PlaylistTracks,
  Artists,
  Albums,
  History,
  LyricsCache,
  SearchHistory,
  Settings,
  Downloads,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Handle migrations here
        },
      );

  // Track operations
  Future<void> cacheTrack(TracksCompanion track) =>
      into(tracks).insertOnConflictUpdate(track);
  Future<List<TrackEntity>> getAllTracks() => select(tracks).get();
  Future<TrackEntity?> getTrack(String id) =>
      (select(tracks)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<void> updateTrackOffline(String id, String filePath) =>
      (update(tracks)..where((t) => t.id.equals(id))).write(TracksCompanion(
        isOffline: Value(filePath.isNotEmpty),
        offlineFilePath: Value(filePath.isEmpty ? null : filePath),
      ));
  Future<void> deleteTrack(String id) =>
      (delete(tracks)..where((t) => t.id.equals(id))).go();

  // Playlist operations
  Future<void> cachePlaylist(PlaylistsCompanion playlist) =>
      into(playlists).insertOnConflictUpdate(playlist);
  Future<List<PlaylistEntity>> getAllPlaylists() => select(playlists).get();
  Future<PlaylistEntity?> getPlaylist(String id) =>
      (select(playlists)..where((p) => p.id.equals(id))).getSingleOrNull();
  Future<void> addTrackToPlaylist(
          String playlistId, String trackId, int position) =>
      into(playlistTracks).insertOnConflictUpdate(PlaylistTracksCompanion(
        playlistId: Value(playlistId),
        trackId: Value(trackId),
        position: Value(position),
      ));
  Future<List<TrackEntity>> getPlaylistTracks(String playlistId) =>
      (select(tracks)
            ..join([
              innerJoin(
                  playlistTracks, playlistTracks.trackId.equalsExp(tracks.id))
            ])
            ..where((r) => playlistTracks.playlistId.equals(playlistId))
            ..orderBy([(r) => OrderingTerm.asc(playlistTracks.position)]))
          .get();

  // History operations
  Future<void> addToHistory(String trackId,
          {int progress = 0, bool completed = false}) =>
      into(history).insert(HistoryCompanion(
        trackId: Value(trackId),
        progress: Value(progress),
        completed: Value(completed),
      ));
  Future<List<TrackEntity>> getHistory({int limit = 50}) => (select(tracks)
        ..join([innerJoin(history, history.trackId.equalsExp(tracks.id))])
        ..orderBy([(r) => OrderingTerm.desc(history.playedAt)])
        ..limit(limit))
      .get();

  // Lyrics cache
  Future<void> cacheLyrics(LyricsCacheCompanion lyrics) =>
      into(lyricsCache).insertOnConflictUpdate(lyrics);
  Future<LyricsEntity?> getCachedLyrics(String trackId) =>
      (select(lyricsCache)..where((l) => l.trackId.equals(trackId)))
          .getSingleOrNull();

  // Search history
  Future<void> addSearchHistory(String query, String filter) =>
      into(searchHistory).insert(
          SearchHistoryCompanion(query: Value(query), filter: Value(filter)));
  Future<List<SearchHistoryEntity>> getSearchHistory({int limit = 20}) =>
      (select(searchHistory)
            ..orderBy([(h) => OrderingTerm.desc(h.searchedAt)])
            ..limit(limit))
          .get();

  // Settings
  Future<void> setSetting(String key, dynamic value) =>
      into(settings).insertOnConflictUpdate(
          SettingsCompanion(key: Value(key), value: Value(value)));
  Future<dynamic> getSetting(String key) =>
      (select(settings)..where((s) => s.key.equals(key)))
          .getSingleOrNull()
          .then((s) => s?.value);

  // Downloads
  Future<void> addDownload(DownloadsCompanion download) =>
      into(downloads).insert(download);
  Future<void> updateDownloadProgress(String id, int downloaded, int total,
          {String? status, DateTime? completedAt, String? error}) =>
      (update(downloads)..where((d) => d.id.equals(id)))
          .write(DownloadsCompanion(
        downloadedBytes: Value(downloaded),
        totalBytes: Value(total),
        status: status != null ? Value(status) : const Value.absent(),
        completedAt:
            completedAt != null ? Value(completedAt) : const Value.absent(),
        error: error != null ? Value(error) : const Value.absent(),
      ));
  Future<DownloadEntity?> getDownload(String id) =>
      (select(downloads)..where((d) => d.id.equals(id))).getSingleOrNull();
  Future<void> deleteDownload(String id) =>
      (delete(downloads)..where((d) => d.id.equals(id))).go();
  Future<List<DownloadEntity>> getDownloads() => select(downloads).get();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ytmusic.db'));
    return NativeDatabase(file);
  });
}
