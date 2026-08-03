// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TracksTable extends Tracks with TableInfo<$TracksTable, TrackEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistIdMeta =
      const VerificationMeta('artistId');
  @override
  late final GeneratedColumn<String> artistId = GeneratedColumn<String>(
      'artist_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
      'album', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _albumIdMeta =
      const VerificationMeta('albumId');
  @override
  late final GeneratedColumn<String> albumId = GeneratedColumn<String>(
      'album_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _artworkUrlMeta =
      const VerificationMeta('artworkUrl');
  @override
  late final GeneratedColumn<String> artworkUrl = GeneratedColumn<String>(
      'artwork_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _audioStreamUrlMeta =
      const VerificationMeta('audioStreamUrl');
  @override
  late final GeneratedColumn<String> audioStreamUrl = GeneratedColumn<String>(
      'audio_stream_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itagMeta = const VerificationMeta('itag');
  @override
  late final GeneratedColumn<int> itag = GeneratedColumn<int>(
      'itag', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bitrateMeta =
      const VerificationMeta('bitrate');
  @override
  late final GeneratedColumn<int> bitrate = GeneratedColumn<int>(
      'bitrate', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lyricsIdMeta =
      const VerificationMeta('lyricsId');
  @override
  late final GeneratedColumn<String> lyricsId = GeneratedColumn<String>(
      'lyrics_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isExplicitMeta =
      const VerificationMeta('isExplicit');
  @override
  late final GeneratedColumn<bool> isExplicit = GeneratedColumn<bool>(
      'is_explicit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_explicit" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isAvailableMeta =
      const VerificationMeta('isAvailable');
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
      'is_available', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_available" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _availableCountriesMeta =
      const VerificationMeta('availableCountries');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      availableCountries = GeneratedColumn<String>(
              'available_countries', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>(
              $TracksTable.$converteravailableCountries);
  static const VerificationMeta _rawDataMeta =
      const VerificationMeta('rawData');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      rawData = GeneratedColumn<String>('raw_data', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $TracksTable.$converterrawDatan);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isOfflineMeta =
      const VerificationMeta('isOffline');
  @override
  late final GeneratedColumn<bool> isOffline = GeneratedColumn<bool>(
      'is_offline', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_offline" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _offlineFilePathMeta =
      const VerificationMeta('offlineFilePath');
  @override
  late final GeneratedColumn<String> offlineFilePath = GeneratedColumn<String>(
      'offline_file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        artist,
        artistId,
        album,
        albumId,
        duration,
        artworkUrl,
        audioStreamUrl,
        itag,
        bitrate,
        lyricsId,
        isExplicit,
        isAvailable,
        availableCountries,
        rawData,
        cachedAt,
        isOffline,
        offlineFilePath
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracks';
  @override
  VerificationContext validateIntegrity(Insertable<TrackEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('artist_id')) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableOrUnknown(data['artist_id']!, _artistIdMeta));
    } else if (isInserting) {
      context.missing(_artistIdMeta);
    }
    if (data.containsKey('album')) {
      context.handle(
          _albumMeta, album.isAcceptableOrUnknown(data['album']!, _albumMeta));
    }
    if (data.containsKey('album_id')) {
      context.handle(_albumIdMeta,
          albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('artwork_url')) {
      context.handle(
          _artworkUrlMeta,
          artworkUrl.isAcceptableOrUnknown(
              data['artwork_url']!, _artworkUrlMeta));
    } else if (isInserting) {
      context.missing(_artworkUrlMeta);
    }
    if (data.containsKey('audio_stream_url')) {
      context.handle(
          _audioStreamUrlMeta,
          audioStreamUrl.isAcceptableOrUnknown(
              data['audio_stream_url']!, _audioStreamUrlMeta));
    }
    if (data.containsKey('itag')) {
      context.handle(
          _itagMeta, itag.isAcceptableOrUnknown(data['itag']!, _itagMeta));
    }
    if (data.containsKey('bitrate')) {
      context.handle(_bitrateMeta,
          bitrate.isAcceptableOrUnknown(data['bitrate']!, _bitrateMeta));
    }
    if (data.containsKey('lyrics_id')) {
      context.handle(_lyricsIdMeta,
          lyricsId.isAcceptableOrUnknown(data['lyrics_id']!, _lyricsIdMeta));
    }
    if (data.containsKey('is_explicit')) {
      context.handle(
          _isExplicitMeta,
          isExplicit.isAcceptableOrUnknown(
              data['is_explicit']!, _isExplicitMeta));
    }
    if (data.containsKey('is_available')) {
      context.handle(
          _isAvailableMeta,
          isAvailable.isAcceptableOrUnknown(
              data['is_available']!, _isAvailableMeta));
    }
    context.handle(_availableCountriesMeta, const VerificationResult.success());
    context.handle(_rawDataMeta, const VerificationResult.success());
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    if (data.containsKey('is_offline')) {
      context.handle(_isOfflineMeta,
          isOffline.isAcceptableOrUnknown(data['is_offline']!, _isOfflineMeta));
    }
    if (data.containsKey('offline_file_path')) {
      context.handle(
          _offlineFilePathMeta,
          offlineFilePath.isAcceptableOrUnknown(
              data['offline_file_path']!, _offlineFilePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      artistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_id'])!,
      album: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album']),
      albumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album_id']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      artworkUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artwork_url'])!,
      audioStreamUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audio_stream_url']),
      itag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itag']),
      bitrate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bitrate']),
      lyricsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lyrics_id']),
      isExplicit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_explicit'])!,
      isAvailable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_available'])!,
      availableCountries: $TracksTable.$converteravailableCountries.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}available_countries'])!),
      rawData: $TracksTable.$converterrawDatan.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_data'])),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
      isOffline: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_offline'])!,
      offlineFilePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}offline_file_path']),
    );
  }

  @override
  $TracksTable createAlias(String alias) {
    return $TracksTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteravailableCountries =
      const _StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converterrawData =
      const _JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterrawDatan =
      NullAwareTypeConverter.wrap($converterrawData);
}

class TrackEntity extends DataClass implements Insertable<TrackEntity> {
  final String id;
  final String title;
  final String artist;
  final String artistId;
  final String? album;
  final String? albumId;
  final int duration;
  final String artworkUrl;
  final String? audioStreamUrl;
  final int? itag;
  final int? bitrate;
  final String? lyricsId;
  final bool isExplicit;
  final bool isAvailable;
  final List<String> availableCountries;
  final Map<String, dynamic>? rawData;
  final DateTime cachedAt;
  final bool isOffline;
  final String? offlineFilePath;
  const TrackEntity(
      {required this.id,
      required this.title,
      required this.artist,
      required this.artistId,
      this.album,
      this.albumId,
      required this.duration,
      required this.artworkUrl,
      this.audioStreamUrl,
      this.itag,
      this.bitrate,
      this.lyricsId,
      required this.isExplicit,
      required this.isAvailable,
      required this.availableCountries,
      this.rawData,
      required this.cachedAt,
      required this.isOffline,
      this.offlineFilePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['artist_id'] = Variable<String>(artistId);
    if (!nullToAbsent || album != null) {
      map['album'] = Variable<String>(album);
    }
    if (!nullToAbsent || albumId != null) {
      map['album_id'] = Variable<String>(albumId);
    }
    map['duration'] = Variable<int>(duration);
    map['artwork_url'] = Variable<String>(artworkUrl);
    if (!nullToAbsent || audioStreamUrl != null) {
      map['audio_stream_url'] = Variable<String>(audioStreamUrl);
    }
    if (!nullToAbsent || itag != null) {
      map['itag'] = Variable<int>(itag);
    }
    if (!nullToAbsent || bitrate != null) {
      map['bitrate'] = Variable<int>(bitrate);
    }
    if (!nullToAbsent || lyricsId != null) {
      map['lyrics_id'] = Variable<String>(lyricsId);
    }
    map['is_explicit'] = Variable<bool>(isExplicit);
    map['is_available'] = Variable<bool>(isAvailable);
    {
      map['available_countries'] = Variable<String>(
          $TracksTable.$converteravailableCountries.toSql(availableCountries));
    }
    if (!nullToAbsent || rawData != null) {
      map['raw_data'] =
          Variable<String>($TracksTable.$converterrawDatan.toSql(rawData));
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['is_offline'] = Variable<bool>(isOffline);
    if (!nullToAbsent || offlineFilePath != null) {
      map['offline_file_path'] = Variable<String>(offlineFilePath);
    }
    return map;
  }

  TracksCompanion toCompanion(bool nullToAbsent) {
    return TracksCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      artistId: Value(artistId),
      album:
          album == null && nullToAbsent ? const Value.absent() : Value(album),
      albumId: albumId == null && nullToAbsent
          ? const Value.absent()
          : Value(albumId),
      duration: Value(duration),
      artworkUrl: Value(artworkUrl),
      audioStreamUrl: audioStreamUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioStreamUrl),
      itag: itag == null && nullToAbsent ? const Value.absent() : Value(itag),
      bitrate: bitrate == null && nullToAbsent
          ? const Value.absent()
          : Value(bitrate),
      lyricsId: lyricsId == null && nullToAbsent
          ? const Value.absent()
          : Value(lyricsId),
      isExplicit: Value(isExplicit),
      isAvailable: Value(isAvailable),
      availableCountries: Value(availableCountries),
      rawData: rawData == null && nullToAbsent
          ? const Value.absent()
          : Value(rawData),
      cachedAt: Value(cachedAt),
      isOffline: Value(isOffline),
      offlineFilePath: offlineFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(offlineFilePath),
    );
  }

  factory TrackEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      artistId: serializer.fromJson<String>(json['artistId']),
      album: serializer.fromJson<String?>(json['album']),
      albumId: serializer.fromJson<String?>(json['albumId']),
      duration: serializer.fromJson<int>(json['duration']),
      artworkUrl: serializer.fromJson<String>(json['artworkUrl']),
      audioStreamUrl: serializer.fromJson<String?>(json['audioStreamUrl']),
      itag: serializer.fromJson<int?>(json['itag']),
      bitrate: serializer.fromJson<int?>(json['bitrate']),
      lyricsId: serializer.fromJson<String?>(json['lyricsId']),
      isExplicit: serializer.fromJson<bool>(json['isExplicit']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      availableCountries:
          serializer.fromJson<List<String>>(json['availableCountries']),
      rawData: serializer.fromJson<Map<String, dynamic>?>(json['rawData']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      isOffline: serializer.fromJson<bool>(json['isOffline']),
      offlineFilePath: serializer.fromJson<String?>(json['offlineFilePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'artistId': serializer.toJson<String>(artistId),
      'album': serializer.toJson<String?>(album),
      'albumId': serializer.toJson<String?>(albumId),
      'duration': serializer.toJson<int>(duration),
      'artworkUrl': serializer.toJson<String>(artworkUrl),
      'audioStreamUrl': serializer.toJson<String?>(audioStreamUrl),
      'itag': serializer.toJson<int?>(itag),
      'bitrate': serializer.toJson<int?>(bitrate),
      'lyricsId': serializer.toJson<String?>(lyricsId),
      'isExplicit': serializer.toJson<bool>(isExplicit),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'availableCountries': serializer.toJson<List<String>>(availableCountries),
      'rawData': serializer.toJson<Map<String, dynamic>?>(rawData),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'isOffline': serializer.toJson<bool>(isOffline),
      'offlineFilePath': serializer.toJson<String?>(offlineFilePath),
    };
  }

  TrackEntity copyWith(
          {String? id,
          String? title,
          String? artist,
          String? artistId,
          Value<String?> album = const Value.absent(),
          Value<String?> albumId = const Value.absent(),
          int? duration,
          String? artworkUrl,
          Value<String?> audioStreamUrl = const Value.absent(),
          Value<int?> itag = const Value.absent(),
          Value<int?> bitrate = const Value.absent(),
          Value<String?> lyricsId = const Value.absent(),
          bool? isExplicit,
          bool? isAvailable,
          List<String>? availableCountries,
          Value<Map<String, dynamic>?> rawData = const Value.absent(),
          DateTime? cachedAt,
          bool? isOffline,
          Value<String?> offlineFilePath = const Value.absent()}) =>
      TrackEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        artistId: artistId ?? this.artistId,
        album: album.present ? album.value : this.album,
        albumId: albumId.present ? albumId.value : this.albumId,
        duration: duration ?? this.duration,
        artworkUrl: artworkUrl ?? this.artworkUrl,
        audioStreamUrl:
            audioStreamUrl.present ? audioStreamUrl.value : this.audioStreamUrl,
        itag: itag.present ? itag.value : this.itag,
        bitrate: bitrate.present ? bitrate.value : this.bitrate,
        lyricsId: lyricsId.present ? lyricsId.value : this.lyricsId,
        isExplicit: isExplicit ?? this.isExplicit,
        isAvailable: isAvailable ?? this.isAvailable,
        availableCountries: availableCountries ?? this.availableCountries,
        rawData: rawData.present ? rawData.value : this.rawData,
        cachedAt: cachedAt ?? this.cachedAt,
        isOffline: isOffline ?? this.isOffline,
        offlineFilePath: offlineFilePath.present
            ? offlineFilePath.value
            : this.offlineFilePath,
      );
  TrackEntity copyWithCompanion(TracksCompanion data) {
    return TrackEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      artistId: data.artistId.present ? data.artistId.value : this.artistId,
      album: data.album.present ? data.album.value : this.album,
      albumId: data.albumId.present ? data.albumId.value : this.albumId,
      duration: data.duration.present ? data.duration.value : this.duration,
      artworkUrl:
          data.artworkUrl.present ? data.artworkUrl.value : this.artworkUrl,
      audioStreamUrl: data.audioStreamUrl.present
          ? data.audioStreamUrl.value
          : this.audioStreamUrl,
      itag: data.itag.present ? data.itag.value : this.itag,
      bitrate: data.bitrate.present ? data.bitrate.value : this.bitrate,
      lyricsId: data.lyricsId.present ? data.lyricsId.value : this.lyricsId,
      isExplicit:
          data.isExplicit.present ? data.isExplicit.value : this.isExplicit,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
      availableCountries: data.availableCountries.present
          ? data.availableCountries.value
          : this.availableCountries,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      isOffline: data.isOffline.present ? data.isOffline.value : this.isOffline,
      offlineFilePath: data.offlineFilePath.present
          ? data.offlineFilePath.value
          : this.offlineFilePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrackEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('artistId: $artistId, ')
          ..write('album: $album, ')
          ..write('albumId: $albumId, ')
          ..write('duration: $duration, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('audioStreamUrl: $audioStreamUrl, ')
          ..write('itag: $itag, ')
          ..write('bitrate: $bitrate, ')
          ..write('lyricsId: $lyricsId, ')
          ..write('isExplicit: $isExplicit, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('availableCountries: $availableCountries, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('isOffline: $isOffline, ')
          ..write('offlineFilePath: $offlineFilePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      artist,
      artistId,
      album,
      albumId,
      duration,
      artworkUrl,
      audioStreamUrl,
      itag,
      bitrate,
      lyricsId,
      isExplicit,
      isAvailable,
      availableCountries,
      rawData,
      cachedAt,
      isOffline,
      offlineFilePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.artistId == this.artistId &&
          other.album == this.album &&
          other.albumId == this.albumId &&
          other.duration == this.duration &&
          other.artworkUrl == this.artworkUrl &&
          other.audioStreamUrl == this.audioStreamUrl &&
          other.itag == this.itag &&
          other.bitrate == this.bitrate &&
          other.lyricsId == this.lyricsId &&
          other.isExplicit == this.isExplicit &&
          other.isAvailable == this.isAvailable &&
          other.availableCountries == this.availableCountries &&
          other.rawData == this.rawData &&
          other.cachedAt == this.cachedAt &&
          other.isOffline == this.isOffline &&
          other.offlineFilePath == this.offlineFilePath);
}

class TracksCompanion extends UpdateCompanion<TrackEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> artistId;
  final Value<String?> album;
  final Value<String?> albumId;
  final Value<int> duration;
  final Value<String> artworkUrl;
  final Value<String?> audioStreamUrl;
  final Value<int?> itag;
  final Value<int?> bitrate;
  final Value<String?> lyricsId;
  final Value<bool> isExplicit;
  final Value<bool> isAvailable;
  final Value<List<String>> availableCountries;
  final Value<Map<String, dynamic>?> rawData;
  final Value<DateTime> cachedAt;
  final Value<bool> isOffline;
  final Value<String?> offlineFilePath;
  final Value<int> rowid;
  const TracksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.artistId = const Value.absent(),
    this.album = const Value.absent(),
    this.albumId = const Value.absent(),
    this.duration = const Value.absent(),
    this.artworkUrl = const Value.absent(),
    this.audioStreamUrl = const Value.absent(),
    this.itag = const Value.absent(),
    this.bitrate = const Value.absent(),
    this.lyricsId = const Value.absent(),
    this.isExplicit = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.availableCountries = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.isOffline = const Value.absent(),
    this.offlineFilePath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TracksCompanion.insert({
    required String id,
    required String title,
    required String artist,
    required String artistId,
    this.album = const Value.absent(),
    this.albumId = const Value.absent(),
    required int duration,
    required String artworkUrl,
    this.audioStreamUrl = const Value.absent(),
    this.itag = const Value.absent(),
    this.bitrate = const Value.absent(),
    this.lyricsId = const Value.absent(),
    this.isExplicit = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.availableCountries = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.isOffline = const Value.absent(),
    this.offlineFilePath = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        artist = Value(artist),
        artistId = Value(artistId),
        duration = Value(duration),
        artworkUrl = Value(artworkUrl);
  static Insertable<TrackEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? artistId,
    Expression<String>? album,
    Expression<String>? albumId,
    Expression<int>? duration,
    Expression<String>? artworkUrl,
    Expression<String>? audioStreamUrl,
    Expression<int>? itag,
    Expression<int>? bitrate,
    Expression<String>? lyricsId,
    Expression<bool>? isExplicit,
    Expression<bool>? isAvailable,
    Expression<String>? availableCountries,
    Expression<String>? rawData,
    Expression<DateTime>? cachedAt,
    Expression<bool>? isOffline,
    Expression<String>? offlineFilePath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (artistId != null) 'artist_id': artistId,
      if (album != null) 'album': album,
      if (albumId != null) 'album_id': albumId,
      if (duration != null) 'duration': duration,
      if (artworkUrl != null) 'artwork_url': artworkUrl,
      if (audioStreamUrl != null) 'audio_stream_url': audioStreamUrl,
      if (itag != null) 'itag': itag,
      if (bitrate != null) 'bitrate': bitrate,
      if (lyricsId != null) 'lyrics_id': lyricsId,
      if (isExplicit != null) 'is_explicit': isExplicit,
      if (isAvailable != null) 'is_available': isAvailable,
      if (availableCountries != null) 'available_countries': availableCountries,
      if (rawData != null) 'raw_data': rawData,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (isOffline != null) 'is_offline': isOffline,
      if (offlineFilePath != null) 'offline_file_path': offlineFilePath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TracksCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? artistId,
      Value<String?>? album,
      Value<String?>? albumId,
      Value<int>? duration,
      Value<String>? artworkUrl,
      Value<String?>? audioStreamUrl,
      Value<int?>? itag,
      Value<int?>? bitrate,
      Value<String?>? lyricsId,
      Value<bool>? isExplicit,
      Value<bool>? isAvailable,
      Value<List<String>>? availableCountries,
      Value<Map<String, dynamic>?>? rawData,
      Value<DateTime>? cachedAt,
      Value<bool>? isOffline,
      Value<String?>? offlineFilePath,
      Value<int>? rowid}) {
    return TracksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      artistId: artistId ?? this.artistId,
      album: album ?? this.album,
      albumId: albumId ?? this.albumId,
      duration: duration ?? this.duration,
      artworkUrl: artworkUrl ?? this.artworkUrl,
      audioStreamUrl: audioStreamUrl ?? this.audioStreamUrl,
      itag: itag ?? this.itag,
      bitrate: bitrate ?? this.bitrate,
      lyricsId: lyricsId ?? this.lyricsId,
      isExplicit: isExplicit ?? this.isExplicit,
      isAvailable: isAvailable ?? this.isAvailable,
      availableCountries: availableCountries ?? this.availableCountries,
      rawData: rawData ?? this.rawData,
      cachedAt: cachedAt ?? this.cachedAt,
      isOffline: isOffline ?? this.isOffline,
      offlineFilePath: offlineFilePath ?? this.offlineFilePath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (artistId.present) {
      map['artist_id'] = Variable<String>(artistId.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (albumId.present) {
      map['album_id'] = Variable<String>(albumId.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (artworkUrl.present) {
      map['artwork_url'] = Variable<String>(artworkUrl.value);
    }
    if (audioStreamUrl.present) {
      map['audio_stream_url'] = Variable<String>(audioStreamUrl.value);
    }
    if (itag.present) {
      map['itag'] = Variable<int>(itag.value);
    }
    if (bitrate.present) {
      map['bitrate'] = Variable<int>(bitrate.value);
    }
    if (lyricsId.present) {
      map['lyrics_id'] = Variable<String>(lyricsId.value);
    }
    if (isExplicit.present) {
      map['is_explicit'] = Variable<bool>(isExplicit.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (availableCountries.present) {
      map['available_countries'] = Variable<String>($TracksTable
          .$converteravailableCountries
          .toSql(availableCountries.value));
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(
          $TracksTable.$converterrawDatan.toSql(rawData.value));
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (isOffline.present) {
      map['is_offline'] = Variable<bool>(isOffline.value);
    }
    if (offlineFilePath.present) {
      map['offline_file_path'] = Variable<String>(offlineFilePath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TracksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('artistId: $artistId, ')
          ..write('album: $album, ')
          ..write('albumId: $albumId, ')
          ..write('duration: $duration, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('audioStreamUrl: $audioStreamUrl, ')
          ..write('itag: $itag, ')
          ..write('bitrate: $bitrate, ')
          ..write('lyricsId: $lyricsId, ')
          ..write('isExplicit: $isExplicit, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('availableCountries: $availableCountries, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('isOffline: $isOffline, ')
          ..write('offlineFilePath: $offlineFilePath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlaylistsTable extends Playlists
    with TableInfo<$PlaylistsTable, PlaylistEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _artworkUrlMeta =
      const VerificationMeta('artworkUrl');
  @override
  late final GeneratedColumn<String> artworkUrl = GeneratedColumn<String>(
      'artwork_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trackCountMeta =
      const VerificationMeta('trackCount');
  @override
  late final GeneratedColumn<int> trackCount = GeneratedColumn<int>(
      'track_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isPublicMeta =
      const VerificationMeta('isPublic');
  @override
  late final GeneratedColumn<bool> isPublic = GeneratedColumn<bool>(
      'is_public', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_public" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _rawDataMeta =
      const VerificationMeta('rawData');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      rawData = GeneratedColumn<String>('raw_data', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PlaylistsTable.$converterrawDatan);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isLocalMeta =
      const VerificationMeta('isLocal');
  @override
  late final GeneratedColumn<bool> isLocal = GeneratedColumn<bool>(
      'is_local', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_local" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        artworkUrl,
        trackCount,
        author,
        authorId,
        isPublic,
        createdAt,
        updatedAt,
        rawData,
        cachedAt,
        isLocal
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlists';
  @override
  VerificationContext validateIntegrity(Insertable<PlaylistEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('artwork_url')) {
      context.handle(
          _artworkUrlMeta,
          artworkUrl.isAcceptableOrUnknown(
              data['artwork_url']!, _artworkUrlMeta));
    } else if (isInserting) {
      context.missing(_artworkUrlMeta);
    }
    if (data.containsKey('track_count')) {
      context.handle(
          _trackCountMeta,
          trackCount.isAcceptableOrUnknown(
              data['track_count']!, _trackCountMeta));
    } else if (isInserting) {
      context.missing(_trackCountMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    }
    if (data.containsKey('is_public')) {
      context.handle(_isPublicMeta,
          isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_rawDataMeta, const VerificationResult.success());
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    if (data.containsKey('is_local')) {
      context.handle(_isLocalMeta,
          isLocal.isAcceptableOrUnknown(data['is_local']!, _isLocalMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      artworkUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artwork_url'])!,
      trackCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}track_count'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id']),
      isPublic: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_public']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      rawData: $PlaylistsTable.$converterrawDatan.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_data'])),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
      isLocal: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_local'])!,
    );
  }

  @override
  $PlaylistsTable createAlias(String alias) {
    return $PlaylistsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterrawData =
      const _JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterrawDatan =
      NullAwareTypeConverter.wrap($converterrawData);
}

class PlaylistEntity extends DataClass implements Insertable<PlaylistEntity> {
  final String id;
  final String title;
  final String? description;
  final String artworkUrl;
  final int trackCount;
  final String? author;
  final String? authorId;
  final bool? isPublic;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? rawData;
  final DateTime cachedAt;
  final bool isLocal;
  const PlaylistEntity(
      {required this.id,
      required this.title,
      this.description,
      required this.artworkUrl,
      required this.trackCount,
      this.author,
      this.authorId,
      this.isPublic,
      this.createdAt,
      this.updatedAt,
      this.rawData,
      required this.cachedAt,
      required this.isLocal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['artwork_url'] = Variable<String>(artworkUrl);
    map['track_count'] = Variable<int>(trackCount);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || authorId != null) {
      map['author_id'] = Variable<String>(authorId);
    }
    if (!nullToAbsent || isPublic != null) {
      map['is_public'] = Variable<bool>(isPublic);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || rawData != null) {
      map['raw_data'] =
          Variable<String>($PlaylistsTable.$converterrawDatan.toSql(rawData));
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['is_local'] = Variable<bool>(isLocal);
    return map;
  }

  PlaylistsCompanion toCompanion(bool nullToAbsent) {
    return PlaylistsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      artworkUrl: Value(artworkUrl),
      trackCount: Value(trackCount),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      authorId: authorId == null && nullToAbsent
          ? const Value.absent()
          : Value(authorId),
      isPublic: isPublic == null && nullToAbsent
          ? const Value.absent()
          : Value(isPublic),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      rawData: rawData == null && nullToAbsent
          ? const Value.absent()
          : Value(rawData),
      cachedAt: Value(cachedAt),
      isLocal: Value(isLocal),
    );
  }

  factory PlaylistEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      artworkUrl: serializer.fromJson<String>(json['artworkUrl']),
      trackCount: serializer.fromJson<int>(json['trackCount']),
      author: serializer.fromJson<String?>(json['author']),
      authorId: serializer.fromJson<String?>(json['authorId']),
      isPublic: serializer.fromJson<bool?>(json['isPublic']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      rawData: serializer.fromJson<Map<String, dynamic>?>(json['rawData']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      isLocal: serializer.fromJson<bool>(json['isLocal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'artworkUrl': serializer.toJson<String>(artworkUrl),
      'trackCount': serializer.toJson<int>(trackCount),
      'author': serializer.toJson<String?>(author),
      'authorId': serializer.toJson<String?>(authorId),
      'isPublic': serializer.toJson<bool?>(isPublic),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'rawData': serializer.toJson<Map<String, dynamic>?>(rawData),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'isLocal': serializer.toJson<bool>(isLocal),
    };
  }

  PlaylistEntity copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          String? artworkUrl,
          int? trackCount,
          Value<String?> author = const Value.absent(),
          Value<String?> authorId = const Value.absent(),
          Value<bool?> isPublic = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<Map<String, dynamic>?> rawData = const Value.absent(),
          DateTime? cachedAt,
          bool? isLocal}) =>
      PlaylistEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        artworkUrl: artworkUrl ?? this.artworkUrl,
        trackCount: trackCount ?? this.trackCount,
        author: author.present ? author.value : this.author,
        authorId: authorId.present ? authorId.value : this.authorId,
        isPublic: isPublic.present ? isPublic.value : this.isPublic,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        rawData: rawData.present ? rawData.value : this.rawData,
        cachedAt: cachedAt ?? this.cachedAt,
        isLocal: isLocal ?? this.isLocal,
      );
  PlaylistEntity copyWithCompanion(PlaylistsCompanion data) {
    return PlaylistEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      artworkUrl:
          data.artworkUrl.present ? data.artworkUrl.value : this.artworkUrl,
      trackCount:
          data.trackCount.present ? data.trackCount.value : this.trackCount,
      author: data.author.present ? data.author.value : this.author,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      isLocal: data.isLocal.present ? data.isLocal.value : this.isLocal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('trackCount: $trackCount, ')
          ..write('author: $author, ')
          ..write('authorId: $authorId, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('isLocal: $isLocal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      description,
      artworkUrl,
      trackCount,
      author,
      authorId,
      isPublic,
      createdAt,
      updatedAt,
      rawData,
      cachedAt,
      isLocal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.artworkUrl == this.artworkUrl &&
          other.trackCount == this.trackCount &&
          other.author == this.author &&
          other.authorId == this.authorId &&
          other.isPublic == this.isPublic &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.rawData == this.rawData &&
          other.cachedAt == this.cachedAt &&
          other.isLocal == this.isLocal);
}

class PlaylistsCompanion extends UpdateCompanion<PlaylistEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> artworkUrl;
  final Value<int> trackCount;
  final Value<String?> author;
  final Value<String?> authorId;
  final Value<bool?> isPublic;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<Map<String, dynamic>?> rawData;
  final Value<DateTime> cachedAt;
  final Value<bool> isLocal;
  final Value<int> rowid;
  const PlaylistsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.artworkUrl = const Value.absent(),
    this.trackCount = const Value.absent(),
    this.author = const Value.absent(),
    this.authorId = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.isLocal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    required String artworkUrl,
    required int trackCount,
    this.author = const Value.absent(),
    this.authorId = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.isLocal = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        artworkUrl = Value(artworkUrl),
        trackCount = Value(trackCount);
  static Insertable<PlaylistEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? artworkUrl,
    Expression<int>? trackCount,
    Expression<String>? author,
    Expression<String>? authorId,
    Expression<bool>? isPublic,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? rawData,
    Expression<DateTime>? cachedAt,
    Expression<bool>? isLocal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (artworkUrl != null) 'artwork_url': artworkUrl,
      if (trackCount != null) 'track_count': trackCount,
      if (author != null) 'author': author,
      if (authorId != null) 'author_id': authorId,
      if (isPublic != null) 'is_public': isPublic,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rawData != null) 'raw_data': rawData,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (isLocal != null) 'is_local': isLocal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? artworkUrl,
      Value<int>? trackCount,
      Value<String?>? author,
      Value<String?>? authorId,
      Value<bool?>? isPublic,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<Map<String, dynamic>?>? rawData,
      Value<DateTime>? cachedAt,
      Value<bool>? isLocal,
      Value<int>? rowid}) {
    return PlaylistsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      artworkUrl: artworkUrl ?? this.artworkUrl,
      trackCount: trackCount ?? this.trackCount,
      author: author ?? this.author,
      authorId: authorId ?? this.authorId,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rawData: rawData ?? this.rawData,
      cachedAt: cachedAt ?? this.cachedAt,
      isLocal: isLocal ?? this.isLocal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (artworkUrl.present) {
      map['artwork_url'] = Variable<String>(artworkUrl.value);
    }
    if (trackCount.present) {
      map['track_count'] = Variable<int>(trackCount.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<bool>(isPublic.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(
          $PlaylistsTable.$converterrawDatan.toSql(rawData.value));
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (isLocal.present) {
      map['is_local'] = Variable<bool>(isLocal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('trackCount: $trackCount, ')
          ..write('author: $author, ')
          ..write('authorId: $authorId, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('isLocal: $isLocal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlaylistTracksTable extends PlaylistTracks
    with TableInfo<$PlaylistTracksTable, PlaylistTrackEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistTracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _playlistIdMeta =
      const VerificationMeta('playlistId');
  @override
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES playlists (id) ON DELETE CASCADE'));
  static const VerificationMeta _trackIdMeta =
      const VerificationMeta('trackId');
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
      'track_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tracks (id) ON DELETE CASCADE'));
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [playlistId, trackId, position, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_tracks';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlaylistTrackEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('playlist_id')) {
      context.handle(
          _playlistIdMeta,
          playlistId.isAcceptableOrUnknown(
              data['playlist_id']!, _playlistIdMeta));
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('track_id')) {
      context.handle(_trackIdMeta,
          trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta));
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {playlistId, trackId};
  @override
  PlaylistTrackEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistTrackEntity(
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id'])!,
      trackId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}track_id'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $PlaylistTracksTable createAlias(String alias) {
    return $PlaylistTracksTable(attachedDatabase, alias);
  }
}

class PlaylistTrackEntity extends DataClass
    implements Insertable<PlaylistTrackEntity> {
  final String playlistId;
  final String trackId;
  final int position;
  final DateTime addedAt;
  const PlaylistTrackEntity(
      {required this.playlistId,
      required this.trackId,
      required this.position,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['playlist_id'] = Variable<String>(playlistId);
    map['track_id'] = Variable<String>(trackId);
    map['position'] = Variable<int>(position);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  PlaylistTracksCompanion toCompanion(bool nullToAbsent) {
    return PlaylistTracksCompanion(
      playlistId: Value(playlistId),
      trackId: Value(trackId),
      position: Value(position),
      addedAt: Value(addedAt),
    );
  }

  factory PlaylistTrackEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistTrackEntity(
      playlistId: serializer.fromJson<String>(json['playlistId']),
      trackId: serializer.fromJson<String>(json['trackId']),
      position: serializer.fromJson<int>(json['position']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playlistId': serializer.toJson<String>(playlistId),
      'trackId': serializer.toJson<String>(trackId),
      'position': serializer.toJson<int>(position),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  PlaylistTrackEntity copyWith(
          {String? playlistId,
          String? trackId,
          int? position,
          DateTime? addedAt}) =>
      PlaylistTrackEntity(
        playlistId: playlistId ?? this.playlistId,
        trackId: trackId ?? this.trackId,
        position: position ?? this.position,
        addedAt: addedAt ?? this.addedAt,
      );
  PlaylistTrackEntity copyWithCompanion(PlaylistTracksCompanion data) {
    return PlaylistTrackEntity(
      playlistId:
          data.playlistId.present ? data.playlistId.value : this.playlistId,
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      position: data.position.present ? data.position.value : this.position,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistTrackEntity(')
          ..write('playlistId: $playlistId, ')
          ..write('trackId: $trackId, ')
          ..write('position: $position, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(playlistId, trackId, position, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistTrackEntity &&
          other.playlistId == this.playlistId &&
          other.trackId == this.trackId &&
          other.position == this.position &&
          other.addedAt == this.addedAt);
}

class PlaylistTracksCompanion extends UpdateCompanion<PlaylistTrackEntity> {
  final Value<String> playlistId;
  final Value<String> trackId;
  final Value<int> position;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const PlaylistTracksCompanion({
    this.playlistId = const Value.absent(),
    this.trackId = const Value.absent(),
    this.position = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistTracksCompanion.insert({
    required String playlistId,
    required String trackId,
    required int position,
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : playlistId = Value(playlistId),
        trackId = Value(trackId),
        position = Value(position);
  static Insertable<PlaylistTrackEntity> custom({
    Expression<String>? playlistId,
    Expression<String>? trackId,
    Expression<int>? position,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (playlistId != null) 'playlist_id': playlistId,
      if (trackId != null) 'track_id': trackId,
      if (position != null) 'position': position,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistTracksCompanion copyWith(
      {Value<String>? playlistId,
      Value<String>? trackId,
      Value<int>? position,
      Value<DateTime>? addedAt,
      Value<int>? rowid}) {
    return PlaylistTracksCompanion(
      playlistId: playlistId ?? this.playlistId,
      trackId: trackId ?? this.trackId,
      position: position ?? this.position,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playlistId.present) {
      map['playlist_id'] = Variable<String>(playlistId.value);
    }
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistTracksCompanion(')
          ..write('playlistId: $playlistId, ')
          ..write('trackId: $trackId, ')
          ..write('position: $position, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArtistsTable extends Artists
    with TableInfo<$ArtistsTable, ArtistEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artworkUrlMeta =
      const VerificationMeta('artworkUrl');
  @override
  late final GeneratedColumn<String> artworkUrl = GeneratedColumn<String>(
      'artwork_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subscriberCountMeta =
      const VerificationMeta('subscriberCount');
  @override
  late final GeneratedColumn<int> subscriberCount = GeneratedColumn<int>(
      'subscriber_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> genres =
      GeneratedColumn<String>('genres', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($ArtistsTable.$convertergenres);
  static const VerificationMeta _rawDataMeta =
      const VerificationMeta('rawData');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      rawData = GeneratedColumn<String>('raw_data', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $ArtistsTable.$converterrawDatan);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        artworkUrl,
        description,
        subscriberCount,
        genres,
        rawData,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artists';
  @override
  VerificationContext validateIntegrity(Insertable<ArtistEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('artwork_url')) {
      context.handle(
          _artworkUrlMeta,
          artworkUrl.isAcceptableOrUnknown(
              data['artwork_url']!, _artworkUrlMeta));
    } else if (isInserting) {
      context.missing(_artworkUrlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('subscriber_count')) {
      context.handle(
          _subscriberCountMeta,
          subscriberCount.isAcceptableOrUnknown(
              data['subscriber_count']!, _subscriberCountMeta));
    }
    context.handle(_genresMeta, const VerificationResult.success());
    context.handle(_rawDataMeta, const VerificationResult.success());
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArtistEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtistEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      artworkUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artwork_url'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      subscriberCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subscriber_count']),
      genres: $ArtistsTable.$convertergenres.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres'])!),
      rawData: $ArtistsTable.$converterrawDatan.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_data'])),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $ArtistsTable createAlias(String alias) {
    return $ArtistsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertergenres =
      const _StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converterrawData =
      const _JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterrawDatan =
      NullAwareTypeConverter.wrap($converterrawData);
}

class ArtistEntity extends DataClass implements Insertable<ArtistEntity> {
  final String id;
  final String name;
  final String artworkUrl;
  final String? description;
  final int? subscriberCount;
  final List<String> genres;
  final Map<String, dynamic>? rawData;
  final DateTime cachedAt;
  const ArtistEntity(
      {required this.id,
      required this.name,
      required this.artworkUrl,
      this.description,
      this.subscriberCount,
      required this.genres,
      this.rawData,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['artwork_url'] = Variable<String>(artworkUrl);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || subscriberCount != null) {
      map['subscriber_count'] = Variable<int>(subscriberCount);
    }
    {
      map['genres'] =
          Variable<String>($ArtistsTable.$convertergenres.toSql(genres));
    }
    if (!nullToAbsent || rawData != null) {
      map['raw_data'] =
          Variable<String>($ArtistsTable.$converterrawDatan.toSql(rawData));
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  ArtistsCompanion toCompanion(bool nullToAbsent) {
    return ArtistsCompanion(
      id: Value(id),
      name: Value(name),
      artworkUrl: Value(artworkUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      subscriberCount: subscriberCount == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriberCount),
      genres: Value(genres),
      rawData: rawData == null && nullToAbsent
          ? const Value.absent()
          : Value(rawData),
      cachedAt: Value(cachedAt),
    );
  }

  factory ArtistEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtistEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      artworkUrl: serializer.fromJson<String>(json['artworkUrl']),
      description: serializer.fromJson<String?>(json['description']),
      subscriberCount: serializer.fromJson<int?>(json['subscriberCount']),
      genres: serializer.fromJson<List<String>>(json['genres']),
      rawData: serializer.fromJson<Map<String, dynamic>?>(json['rawData']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'artworkUrl': serializer.toJson<String>(artworkUrl),
      'description': serializer.toJson<String?>(description),
      'subscriberCount': serializer.toJson<int?>(subscriberCount),
      'genres': serializer.toJson<List<String>>(genres),
      'rawData': serializer.toJson<Map<String, dynamic>?>(rawData),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  ArtistEntity copyWith(
          {String? id,
          String? name,
          String? artworkUrl,
          Value<String?> description = const Value.absent(),
          Value<int?> subscriberCount = const Value.absent(),
          List<String>? genres,
          Value<Map<String, dynamic>?> rawData = const Value.absent(),
          DateTime? cachedAt}) =>
      ArtistEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        artworkUrl: artworkUrl ?? this.artworkUrl,
        description: description.present ? description.value : this.description,
        subscriberCount: subscriberCount.present
            ? subscriberCount.value
            : this.subscriberCount,
        genres: genres ?? this.genres,
        rawData: rawData.present ? rawData.value : this.rawData,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  ArtistEntity copyWithCompanion(ArtistsCompanion data) {
    return ArtistEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      artworkUrl:
          data.artworkUrl.present ? data.artworkUrl.value : this.artworkUrl,
      description:
          data.description.present ? data.description.value : this.description,
      subscriberCount: data.subscriberCount.present
          ? data.subscriberCount.value
          : this.subscriberCount,
      genres: data.genres.present ? data.genres.value : this.genres,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArtistEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('description: $description, ')
          ..write('subscriberCount: $subscriberCount, ')
          ..write('genres: $genres, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, artworkUrl, description,
      subscriberCount, genres, rawData, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtistEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.artworkUrl == this.artworkUrl &&
          other.description == this.description &&
          other.subscriberCount == this.subscriberCount &&
          other.genres == this.genres &&
          other.rawData == this.rawData &&
          other.cachedAt == this.cachedAt);
}

class ArtistsCompanion extends UpdateCompanion<ArtistEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> artworkUrl;
  final Value<String?> description;
  final Value<int?> subscriberCount;
  final Value<List<String>> genres;
  final Value<Map<String, dynamic>?> rawData;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const ArtistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.artworkUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.subscriberCount = const Value.absent(),
    this.genres = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArtistsCompanion.insert({
    required String id,
    required String name,
    required String artworkUrl,
    this.description = const Value.absent(),
    this.subscriberCount = const Value.absent(),
    this.genres = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        artworkUrl = Value(artworkUrl);
  static Insertable<ArtistEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? artworkUrl,
    Expression<String>? description,
    Expression<int>? subscriberCount,
    Expression<String>? genres,
    Expression<String>? rawData,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (artworkUrl != null) 'artwork_url': artworkUrl,
      if (description != null) 'description': description,
      if (subscriberCount != null) 'subscriber_count': subscriberCount,
      if (genres != null) 'genres': genres,
      if (rawData != null) 'raw_data': rawData,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArtistsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? artworkUrl,
      Value<String?>? description,
      Value<int?>? subscriberCount,
      Value<List<String>>? genres,
      Value<Map<String, dynamic>?>? rawData,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return ArtistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      artworkUrl: artworkUrl ?? this.artworkUrl,
      description: description ?? this.description,
      subscriberCount: subscriberCount ?? this.subscriberCount,
      genres: genres ?? this.genres,
      rawData: rawData ?? this.rawData,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (artworkUrl.present) {
      map['artwork_url'] = Variable<String>(artworkUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (subscriberCount.present) {
      map['subscriber_count'] = Variable<int>(subscriberCount.value);
    }
    if (genres.present) {
      map['genres'] =
          Variable<String>($ArtistsTable.$convertergenres.toSql(genres.value));
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(
          $ArtistsTable.$converterrawDatan.toSql(rawData.value));
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('description: $description, ')
          ..write('subscriberCount: $subscriberCount, ')
          ..write('genres: $genres, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlbumsTable extends Albums with TableInfo<$AlbumsTable, AlbumEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlbumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistIdMeta =
      const VerificationMeta('artistId');
  @override
  late final GeneratedColumn<String> artistId = GeneratedColumn<String>(
      'artist_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artworkUrlMeta =
      const VerificationMeta('artworkUrl');
  @override
  late final GeneratedColumn<String> artworkUrl = GeneratedColumn<String>(
      'artwork_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _trackCountMeta =
      const VerificationMeta('trackCount');
  @override
  late final GeneratedColumn<int> trackCount = GeneratedColumn<int>(
      'track_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> genres =
      GeneratedColumn<String>('genres', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($AlbumsTable.$convertergenres);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
      'release_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _rawDataMeta =
      const VerificationMeta('rawData');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      rawData = GeneratedColumn<String>('raw_data', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $AlbumsTable.$converterrawDatan);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        artist,
        artistId,
        artworkUrl,
        year,
        trackCount,
        description,
        genres,
        releaseDate,
        rawData,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'albums';
  @override
  VerificationContext validateIntegrity(Insertable<AlbumEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('artist_id')) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableOrUnknown(data['artist_id']!, _artistIdMeta));
    } else if (isInserting) {
      context.missing(_artistIdMeta);
    }
    if (data.containsKey('artwork_url')) {
      context.handle(
          _artworkUrlMeta,
          artworkUrl.isAcceptableOrUnknown(
              data['artwork_url']!, _artworkUrlMeta));
    } else if (isInserting) {
      context.missing(_artworkUrlMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('track_count')) {
      context.handle(
          _trackCountMeta,
          trackCount.isAcceptableOrUnknown(
              data['track_count']!, _trackCountMeta));
    } else if (isInserting) {
      context.missing(_trackCountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    context.handle(_genresMeta, const VerificationResult.success());
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    context.handle(_rawDataMeta, const VerificationResult.success());
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlbumEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlbumEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      artistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_id'])!,
      artworkUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artwork_url'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      trackCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}track_count'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      genres: $AlbumsTable.$convertergenres.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres'])!),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_date']),
      rawData: $AlbumsTable.$converterrawDatan.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_data'])),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $AlbumsTable createAlias(String alias) {
    return $AlbumsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertergenres =
      const _StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converterrawData =
      const _JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterrawDatan =
      NullAwareTypeConverter.wrap($converterrawData);
}

class AlbumEntity extends DataClass implements Insertable<AlbumEntity> {
  final String id;
  final String title;
  final String artist;
  final String artistId;
  final String artworkUrl;
  final int year;
  final int trackCount;
  final String? description;
  final List<String> genres;
  final DateTime? releaseDate;
  final Map<String, dynamic>? rawData;
  final DateTime cachedAt;
  const AlbumEntity(
      {required this.id,
      required this.title,
      required this.artist,
      required this.artistId,
      required this.artworkUrl,
      required this.year,
      required this.trackCount,
      this.description,
      required this.genres,
      this.releaseDate,
      this.rawData,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['artist_id'] = Variable<String>(artistId);
    map['artwork_url'] = Variable<String>(artworkUrl);
    map['year'] = Variable<int>(year);
    map['track_count'] = Variable<int>(trackCount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['genres'] =
          Variable<String>($AlbumsTable.$convertergenres.toSql(genres));
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<DateTime>(releaseDate);
    }
    if (!nullToAbsent || rawData != null) {
      map['raw_data'] =
          Variable<String>($AlbumsTable.$converterrawDatan.toSql(rawData));
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  AlbumsCompanion toCompanion(bool nullToAbsent) {
    return AlbumsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      artistId: Value(artistId),
      artworkUrl: Value(artworkUrl),
      year: Value(year),
      trackCount: Value(trackCount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      genres: Value(genres),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      rawData: rawData == null && nullToAbsent
          ? const Value.absent()
          : Value(rawData),
      cachedAt: Value(cachedAt),
    );
  }

  factory AlbumEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlbumEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      artistId: serializer.fromJson<String>(json['artistId']),
      artworkUrl: serializer.fromJson<String>(json['artworkUrl']),
      year: serializer.fromJson<int>(json['year']),
      trackCount: serializer.fromJson<int>(json['trackCount']),
      description: serializer.fromJson<String?>(json['description']),
      genres: serializer.fromJson<List<String>>(json['genres']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
      rawData: serializer.fromJson<Map<String, dynamic>?>(json['rawData']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'artistId': serializer.toJson<String>(artistId),
      'artworkUrl': serializer.toJson<String>(artworkUrl),
      'year': serializer.toJson<int>(year),
      'trackCount': serializer.toJson<int>(trackCount),
      'description': serializer.toJson<String?>(description),
      'genres': serializer.toJson<List<String>>(genres),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
      'rawData': serializer.toJson<Map<String, dynamic>?>(rawData),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  AlbumEntity copyWith(
          {String? id,
          String? title,
          String? artist,
          String? artistId,
          String? artworkUrl,
          int? year,
          int? trackCount,
          Value<String?> description = const Value.absent(),
          List<String>? genres,
          Value<DateTime?> releaseDate = const Value.absent(),
          Value<Map<String, dynamic>?> rawData = const Value.absent(),
          DateTime? cachedAt}) =>
      AlbumEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        artistId: artistId ?? this.artistId,
        artworkUrl: artworkUrl ?? this.artworkUrl,
        year: year ?? this.year,
        trackCount: trackCount ?? this.trackCount,
        description: description.present ? description.value : this.description,
        genres: genres ?? this.genres,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        rawData: rawData.present ? rawData.value : this.rawData,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  AlbumEntity copyWithCompanion(AlbumsCompanion data) {
    return AlbumEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      artistId: data.artistId.present ? data.artistId.value : this.artistId,
      artworkUrl:
          data.artworkUrl.present ? data.artworkUrl.value : this.artworkUrl,
      year: data.year.present ? data.year.value : this.year,
      trackCount:
          data.trackCount.present ? data.trackCount.value : this.trackCount,
      description:
          data.description.present ? data.description.value : this.description,
      genres: data.genres.present ? data.genres.value : this.genres,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlbumEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('artistId: $artistId, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('year: $year, ')
          ..write('trackCount: $trackCount, ')
          ..write('description: $description, ')
          ..write('genres: $genres, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, artistId, artworkUrl, year,
      trackCount, description, genres, releaseDate, rawData, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlbumEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.artistId == this.artistId &&
          other.artworkUrl == this.artworkUrl &&
          other.year == this.year &&
          other.trackCount == this.trackCount &&
          other.description == this.description &&
          other.genres == this.genres &&
          other.releaseDate == this.releaseDate &&
          other.rawData == this.rawData &&
          other.cachedAt == this.cachedAt);
}

class AlbumsCompanion extends UpdateCompanion<AlbumEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> artistId;
  final Value<String> artworkUrl;
  final Value<int> year;
  final Value<int> trackCount;
  final Value<String?> description;
  final Value<List<String>> genres;
  final Value<DateTime?> releaseDate;
  final Value<Map<String, dynamic>?> rawData;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const AlbumsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.artistId = const Value.absent(),
    this.artworkUrl = const Value.absent(),
    this.year = const Value.absent(),
    this.trackCount = const Value.absent(),
    this.description = const Value.absent(),
    this.genres = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlbumsCompanion.insert({
    required String id,
    required String title,
    required String artist,
    required String artistId,
    required String artworkUrl,
    required int year,
    required int trackCount,
    this.description = const Value.absent(),
    this.genres = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.rawData = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        artist = Value(artist),
        artistId = Value(artistId),
        artworkUrl = Value(artworkUrl),
        year = Value(year),
        trackCount = Value(trackCount);
  static Insertable<AlbumEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? artistId,
    Expression<String>? artworkUrl,
    Expression<int>? year,
    Expression<int>? trackCount,
    Expression<String>? description,
    Expression<String>? genres,
    Expression<DateTime>? releaseDate,
    Expression<String>? rawData,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (artistId != null) 'artist_id': artistId,
      if (artworkUrl != null) 'artwork_url': artworkUrl,
      if (year != null) 'year': year,
      if (trackCount != null) 'track_count': trackCount,
      if (description != null) 'description': description,
      if (genres != null) 'genres': genres,
      if (releaseDate != null) 'release_date': releaseDate,
      if (rawData != null) 'raw_data': rawData,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlbumsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? artistId,
      Value<String>? artworkUrl,
      Value<int>? year,
      Value<int>? trackCount,
      Value<String?>? description,
      Value<List<String>>? genres,
      Value<DateTime?>? releaseDate,
      Value<Map<String, dynamic>?>? rawData,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return AlbumsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      artistId: artistId ?? this.artistId,
      artworkUrl: artworkUrl ?? this.artworkUrl,
      year: year ?? this.year,
      trackCount: trackCount ?? this.trackCount,
      description: description ?? this.description,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
      rawData: rawData ?? this.rawData,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (artistId.present) {
      map['artist_id'] = Variable<String>(artistId.value);
    }
    if (artworkUrl.present) {
      map['artwork_url'] = Variable<String>(artworkUrl.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (trackCount.present) {
      map['track_count'] = Variable<int>(trackCount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (genres.present) {
      map['genres'] =
          Variable<String>($AlbumsTable.$convertergenres.toSql(genres.value));
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(
          $AlbumsTable.$converterrawDatan.toSql(rawData.value));
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('artistId: $artistId, ')
          ..write('artworkUrl: $artworkUrl, ')
          ..write('year: $year, ')
          ..write('trackCount: $trackCount, ')
          ..write('description: $description, ')
          ..write('genres: $genres, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('rawData: $rawData, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoryTable extends History
    with TableInfo<$HistoryTable, HistoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trackIdMeta =
      const VerificationMeta('trackId');
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
      'track_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tracks (id) ON DELETE CASCADE'));
  static const VerificationMeta _playedAtMeta =
      const VerificationMeta('playedAt');
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
      'played_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'progress', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, trackId, playedAt, progress, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('track_id')) {
      context.handle(_trackIdMeta,
          trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta));
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('played_at')) {
      context.handle(_playedAtMeta,
          playedAt.isAcceptableOrUnknown(data['played_at']!, _playedAtMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      trackId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}track_id'])!,
      playedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}played_at'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}progress'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
    );
  }

  @override
  $HistoryTable createAlias(String alias) {
    return $HistoryTable(attachedDatabase, alias);
  }
}

class HistoryEntity extends DataClass implements Insertable<HistoryEntity> {
  final int id;
  final String trackId;
  final DateTime playedAt;
  final int progress;
  final bool completed;
  const HistoryEntity(
      {required this.id,
      required this.trackId,
      required this.playedAt,
      required this.progress,
      required this.completed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['track_id'] = Variable<String>(trackId);
    map['played_at'] = Variable<DateTime>(playedAt);
    map['progress'] = Variable<int>(progress);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  HistoryCompanion toCompanion(bool nullToAbsent) {
    return HistoryCompanion(
      id: Value(id),
      trackId: Value(trackId),
      playedAt: Value(playedAt),
      progress: Value(progress),
      completed: Value(completed),
    );
  }

  factory HistoryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryEntity(
      id: serializer.fromJson<int>(json['id']),
      trackId: serializer.fromJson<String>(json['trackId']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
      progress: serializer.fromJson<int>(json['progress']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trackId': serializer.toJson<String>(trackId),
      'playedAt': serializer.toJson<DateTime>(playedAt),
      'progress': serializer.toJson<int>(progress),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  HistoryEntity copyWith(
          {int? id,
          String? trackId,
          DateTime? playedAt,
          int? progress,
          bool? completed}) =>
      HistoryEntity(
        id: id ?? this.id,
        trackId: trackId ?? this.trackId,
        playedAt: playedAt ?? this.playedAt,
        progress: progress ?? this.progress,
        completed: completed ?? this.completed,
      );
  HistoryEntity copyWithCompanion(HistoryCompanion data) {
    return HistoryEntity(
      id: data.id.present ? data.id.value : this.id,
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
      progress: data.progress.present ? data.progress.value : this.progress,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryEntity(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('playedAt: $playedAt, ')
          ..write('progress: $progress, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, trackId, playedAt, progress, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryEntity &&
          other.id == this.id &&
          other.trackId == this.trackId &&
          other.playedAt == this.playedAt &&
          other.progress == this.progress &&
          other.completed == this.completed);
}

class HistoryCompanion extends UpdateCompanion<HistoryEntity> {
  final Value<int> id;
  final Value<String> trackId;
  final Value<DateTime> playedAt;
  final Value<int> progress;
  final Value<bool> completed;
  const HistoryCompanion({
    this.id = const Value.absent(),
    this.trackId = const Value.absent(),
    this.playedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.completed = const Value.absent(),
  });
  HistoryCompanion.insert({
    this.id = const Value.absent(),
    required String trackId,
    this.playedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.completed = const Value.absent(),
  }) : trackId = Value(trackId);
  static Insertable<HistoryEntity> custom({
    Expression<int>? id,
    Expression<String>? trackId,
    Expression<DateTime>? playedAt,
    Expression<int>? progress,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackId != null) 'track_id': trackId,
      if (playedAt != null) 'played_at': playedAt,
      if (progress != null) 'progress': progress,
      if (completed != null) 'completed': completed,
    });
  }

  HistoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? trackId,
      Value<DateTime>? playedAt,
      Value<int>? progress,
      Value<bool>? completed}) {
    return HistoryCompanion(
      id: id ?? this.id,
      trackId: trackId ?? this.trackId,
      playedAt: playedAt ?? this.playedAt,
      progress: progress ?? this.progress,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (playedAt.present) {
      map['played_at'] = Variable<DateTime>(playedAt.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryCompanion(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('playedAt: $playedAt, ')
          ..write('progress: $progress, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $LyricsCacheTable extends LyricsCache
    with TableInfo<$LyricsCacheTable, LyricsEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LyricsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackIdMeta =
      const VerificationMeta('trackId');
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
      'track_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('none'));
  static const VerificationMeta _rawLrcMeta = const VerificationMeta('rawLrc');
  @override
  late final GeneratedColumn<String> rawLrc = GeneratedColumn<String>(
      'raw_lrc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linesJsonMeta =
      const VerificationMeta('linesJson');
  @override
  late final GeneratedColumnWithTypeConverter<List<dynamic>, String> linesJson =
      GeneratedColumn<String>('lines_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<dynamic>>($LyricsCacheTable.$converterlinesJson);
  static const VerificationMeta _hasSyncedMeta =
      const VerificationMeta('hasSynced');
  @override
  late final GeneratedColumn<bool> hasSynced = GeneratedColumn<bool>(
      'has_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [trackId, source, rawLrc, linesJson, hasSynced, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lyrics_cache';
  @override
  VerificationContext validateIntegrity(Insertable<LyricsEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_id')) {
      context.handle(_trackIdMeta,
          trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta));
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('raw_lrc')) {
      context.handle(_rawLrcMeta,
          rawLrc.isAcceptableOrUnknown(data['raw_lrc']!, _rawLrcMeta));
    }
    context.handle(_linesJsonMeta, const VerificationResult.success());
    if (data.containsKey('has_synced')) {
      context.handle(_hasSyncedMeta,
          hasSynced.isAcceptableOrUnknown(data['has_synced']!, _hasSyncedMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trackId};
  @override
  LyricsEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LyricsEntity(
      trackId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}track_id'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      rawLrc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_lrc']),
      linesJson: $LyricsCacheTable.$converterlinesJson.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lines_json'])!),
      hasSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_synced'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $LyricsCacheTable createAlias(String alias) {
    return $LyricsCacheTable(attachedDatabase, alias);
  }

  static TypeConverter<List<dynamic>, String> $converterlinesJson =
      const _JsonListConverter();
}

class LyricsEntity extends DataClass implements Insertable<LyricsEntity> {
  final String trackId;
  final String source;
  final String? rawLrc;
  final List<dynamic> linesJson;
  final bool hasSynced;
  final DateTime cachedAt;
  const LyricsEntity(
      {required this.trackId,
      required this.source,
      this.rawLrc,
      required this.linesJson,
      required this.hasSynced,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<String>(trackId);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || rawLrc != null) {
      map['raw_lrc'] = Variable<String>(rawLrc);
    }
    {
      map['lines_json'] = Variable<String>(
          $LyricsCacheTable.$converterlinesJson.toSql(linesJson));
    }
    map['has_synced'] = Variable<bool>(hasSynced);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  LyricsCacheCompanion toCompanion(bool nullToAbsent) {
    return LyricsCacheCompanion(
      trackId: Value(trackId),
      source: Value(source),
      rawLrc:
          rawLrc == null && nullToAbsent ? const Value.absent() : Value(rawLrc),
      linesJson: Value(linesJson),
      hasSynced: Value(hasSynced),
      cachedAt: Value(cachedAt),
    );
  }

  factory LyricsEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LyricsEntity(
      trackId: serializer.fromJson<String>(json['trackId']),
      source: serializer.fromJson<String>(json['source']),
      rawLrc: serializer.fromJson<String?>(json['rawLrc']),
      linesJson: serializer.fromJson<List<dynamic>>(json['linesJson']),
      hasSynced: serializer.fromJson<bool>(json['hasSynced']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<String>(trackId),
      'source': serializer.toJson<String>(source),
      'rawLrc': serializer.toJson<String?>(rawLrc),
      'linesJson': serializer.toJson<List<dynamic>>(linesJson),
      'hasSynced': serializer.toJson<bool>(hasSynced),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  LyricsEntity copyWith(
          {String? trackId,
          String? source,
          Value<String?> rawLrc = const Value.absent(),
          List<dynamic>? linesJson,
          bool? hasSynced,
          DateTime? cachedAt}) =>
      LyricsEntity(
        trackId: trackId ?? this.trackId,
        source: source ?? this.source,
        rawLrc: rawLrc.present ? rawLrc.value : this.rawLrc,
        linesJson: linesJson ?? this.linesJson,
        hasSynced: hasSynced ?? this.hasSynced,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  LyricsEntity copyWithCompanion(LyricsCacheCompanion data) {
    return LyricsEntity(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      source: data.source.present ? data.source.value : this.source,
      rawLrc: data.rawLrc.present ? data.rawLrc.value : this.rawLrc,
      linesJson: data.linesJson.present ? data.linesJson.value : this.linesJson,
      hasSynced: data.hasSynced.present ? data.hasSynced.value : this.hasSynced,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LyricsEntity(')
          ..write('trackId: $trackId, ')
          ..write('source: $source, ')
          ..write('rawLrc: $rawLrc, ')
          ..write('linesJson: $linesJson, ')
          ..write('hasSynced: $hasSynced, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(trackId, source, rawLrc, linesJson, hasSynced, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LyricsEntity &&
          other.trackId == this.trackId &&
          other.source == this.source &&
          other.rawLrc == this.rawLrc &&
          other.linesJson == this.linesJson &&
          other.hasSynced == this.hasSynced &&
          other.cachedAt == this.cachedAt);
}

class LyricsCacheCompanion extends UpdateCompanion<LyricsEntity> {
  final Value<String> trackId;
  final Value<String> source;
  final Value<String?> rawLrc;
  final Value<List<dynamic>> linesJson;
  final Value<bool> hasSynced;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const LyricsCacheCompanion({
    this.trackId = const Value.absent(),
    this.source = const Value.absent(),
    this.rawLrc = const Value.absent(),
    this.linesJson = const Value.absent(),
    this.hasSynced = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LyricsCacheCompanion.insert({
    required String trackId,
    this.source = const Value.absent(),
    this.rawLrc = const Value.absent(),
    required List<dynamic> linesJson,
    this.hasSynced = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : trackId = Value(trackId),
        linesJson = Value(linesJson);
  static Insertable<LyricsEntity> custom({
    Expression<String>? trackId,
    Expression<String>? source,
    Expression<String>? rawLrc,
    Expression<String>? linesJson,
    Expression<bool>? hasSynced,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (source != null) 'source': source,
      if (rawLrc != null) 'raw_lrc': rawLrc,
      if (linesJson != null) 'lines_json': linesJson,
      if (hasSynced != null) 'has_synced': hasSynced,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LyricsCacheCompanion copyWith(
      {Value<String>? trackId,
      Value<String>? source,
      Value<String?>? rawLrc,
      Value<List<dynamic>>? linesJson,
      Value<bool>? hasSynced,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return LyricsCacheCompanion(
      trackId: trackId ?? this.trackId,
      source: source ?? this.source,
      rawLrc: rawLrc ?? this.rawLrc,
      linesJson: linesJson ?? this.linesJson,
      hasSynced: hasSynced ?? this.hasSynced,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rawLrc.present) {
      map['raw_lrc'] = Variable<String>(rawLrc.value);
    }
    if (linesJson.present) {
      map['lines_json'] = Variable<String>(
          $LyricsCacheTable.$converterlinesJson.toSql(linesJson.value));
    }
    if (hasSynced.present) {
      map['has_synced'] = Variable<bool>(hasSynced.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LyricsCacheCompanion(')
          ..write('trackId: $trackId, ')
          ..write('source: $source, ')
          ..write('rawLrc: $rawLrc, ')
          ..write('linesJson: $linesJson, ')
          ..write('hasSynced: $hasSynced, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoryTable extends SearchHistory
    with TableInfo<$SearchHistoryTable, SearchHistoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filterMeta = const VerificationMeta('filter');
  @override
  late final GeneratedColumn<String> filter = GeneratedColumn<String>(
      'filter', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchedAtMeta =
      const VerificationMeta('searchedAt');
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
      'searched_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, query, filter, searchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<SearchHistoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('filter')) {
      context.handle(_filterMeta,
          filter.isAcceptableOrUnknown(data['filter']!, _filterMeta));
    } else if (isInserting) {
      context.missing(_filterMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
          _searchedAtMeta,
          searchedAt.isAcceptableOrUnknown(
              data['searched_at']!, _searchedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchHistoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      filter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filter'])!,
      searchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}searched_at'])!,
    );
  }

  @override
  $SearchHistoryTable createAlias(String alias) {
    return $SearchHistoryTable(attachedDatabase, alias);
  }
}

class SearchHistoryEntity extends DataClass
    implements Insertable<SearchHistoryEntity> {
  final int id;
  final String query;
  final String filter;
  final DateTime searchedAt;
  const SearchHistoryEntity(
      {required this.id,
      required this.query,
      required this.filter,
      required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['filter'] = Variable<String>(filter);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  SearchHistoryCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryCompanion(
      id: Value(id),
      query: Value(query),
      filter: Value(filter),
      searchedAt: Value(searchedAt),
    );
  }

  factory SearchHistoryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryEntity(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      filter: serializer.fromJson<String>(json['filter']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'filter': serializer.toJson<String>(filter),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  SearchHistoryEntity copyWith(
          {int? id, String? query, String? filter, DateTime? searchedAt}) =>
      SearchHistoryEntity(
        id: id ?? this.id,
        query: query ?? this.query,
        filter: filter ?? this.filter,
        searchedAt: searchedAt ?? this.searchedAt,
      );
  SearchHistoryEntity copyWithCompanion(SearchHistoryCompanion data) {
    return SearchHistoryEntity(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      filter: data.filter.present ? data.filter.value : this.filter,
      searchedAt:
          data.searchedAt.present ? data.searchedAt.value : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntity(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('filter: $filter, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, query, filter, searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryEntity &&
          other.id == this.id &&
          other.query == this.query &&
          other.filter == this.filter &&
          other.searchedAt == this.searchedAt);
}

class SearchHistoryCompanion extends UpdateCompanion<SearchHistoryEntity> {
  final Value<int> id;
  final Value<String> query;
  final Value<String> filter;
  final Value<DateTime> searchedAt;
  const SearchHistoryCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.filter = const Value.absent(),
    this.searchedAt = const Value.absent(),
  });
  SearchHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required String filter,
    this.searchedAt = const Value.absent(),
  })  : query = Value(query),
        filter = Value(filter);
  static Insertable<SearchHistoryEntity> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<String>? filter,
    Expression<DateTime>? searchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (filter != null) 'filter': filter,
      if (searchedAt != null) 'searched_at': searchedAt,
    });
  }

  SearchHistoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? query,
      Value<String>? filter,
      Value<DateTime>? searchedAt}) {
    return SearchHistoryCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      filter: filter ?? this.filter,
      searchedAt: searchedAt ?? this.searchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (filter.present) {
      map['filter'] = Variable<String>(filter.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('filter: $filter, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingsEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String> value =
      GeneratedColumn<String>('value', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>($SettingsTable.$convertervalue);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    context.handle(_valueMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingsEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsEntity(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: $SettingsTable.$convertervalue.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!),
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }

  static TypeConverter<dynamic, String> $convertervalue =
      const _JsonValueConverter();
}

class SettingsEntity extends DataClass implements Insertable<SettingsEntity> {
  final String key;
  final dynamic value;
  const SettingsEntity({required this.key, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] =
          Variable<String>($SettingsTable.$convertervalue.toSql(value));
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory SettingsEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsEntity(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<dynamic>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<dynamic>(value),
    };
  }

  SettingsEntity copyWith(
          {String? key, Value<dynamic> value = const Value.absent()}) =>
      SettingsEntity(
        key: key ?? this.key,
        value: value.present ? value.value : this.value,
      );
  SettingsEntity copyWithCompanion(SettingsCompanion data) {
    return SettingsEntity(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsEntity(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsEntity &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<SettingsEntity> {
  final Value<String> key;
  final Value<dynamic> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required dynamic value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<SettingsEntity> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<String>? key, Value<dynamic>? value, Value<int>? rowid}) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] =
          Variable<String>($SettingsTable.$convertervalue.toSql(value.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DownloadsTable extends Downloads
    with TableInfo<$DownloadsTable, DownloadEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trackIdMeta =
      const VerificationMeta('trackId');
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
      'track_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tracks (id) ON DELETE CASCADE'));
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalBytesMeta =
      const VerificationMeta('totalBytes');
  @override
  late final GeneratedColumn<int> totalBytes = GeneratedColumn<int>(
      'total_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _downloadedBytesMeta =
      const VerificationMeta('downloadedBytes');
  @override
  late final GeneratedColumn<int> downloadedBytes = GeneratedColumn<int>(
      'downloaded_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
      'error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        trackId,
        filePath,
        totalBytes,
        downloadedBytes,
        status,
        startedAt,
        completedAt,
        error
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloads';
  @override
  VerificationContext validateIntegrity(Insertable<DownloadEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('track_id')) {
      context.handle(_trackIdMeta,
          trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta));
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('total_bytes')) {
      context.handle(
          _totalBytesMeta,
          totalBytes.isAcceptableOrUnknown(
              data['total_bytes']!, _totalBytesMeta));
    } else if (isInserting) {
      context.missing(_totalBytesMeta);
    }
    if (data.containsKey('downloaded_bytes')) {
      context.handle(
          _downloadedBytesMeta,
          downloadedBytes.isAcceptableOrUnknown(
              data['downloaded_bytes']!, _downloadedBytesMeta));
    } else if (isInserting) {
      context.missing(_downloadedBytesMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('error')) {
      context.handle(
          _errorMeta, error.isAcceptableOrUnknown(data['error']!, _errorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DownloadEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      trackId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}track_id'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      totalBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_bytes'])!,
      downloadedBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}downloaded_bytes'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      error: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error']),
    );
  }

  @override
  $DownloadsTable createAlias(String alias) {
    return $DownloadsTable(attachedDatabase, alias);
  }
}

class DownloadEntity extends DataClass implements Insertable<DownloadEntity> {
  final String id;
  final String trackId;
  final String filePath;
  final int totalBytes;
  final int downloadedBytes;
  final String status;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final String? error;
  const DownloadEntity(
      {required this.id,
      required this.trackId,
      required this.filePath,
      required this.totalBytes,
      required this.downloadedBytes,
      required this.status,
      this.startedAt,
      this.completedAt,
      this.error});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['track_id'] = Variable<String>(trackId);
    map['file_path'] = Variable<String>(filePath);
    map['total_bytes'] = Variable<int>(totalBytes);
    map['downloaded_bytes'] = Variable<int>(downloadedBytes);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    return map;
  }

  DownloadsCompanion toCompanion(bool nullToAbsent) {
    return DownloadsCompanion(
      id: Value(id),
      trackId: Value(trackId),
      filePath: Value(filePath),
      totalBytes: Value(totalBytes),
      downloadedBytes: Value(downloadedBytes),
      status: Value(status),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      error:
          error == null && nullToAbsent ? const Value.absent() : Value(error),
    );
  }

  factory DownloadEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadEntity(
      id: serializer.fromJson<String>(json['id']),
      trackId: serializer.fromJson<String>(json['trackId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      totalBytes: serializer.fromJson<int>(json['totalBytes']),
      downloadedBytes: serializer.fromJson<int>(json['downloadedBytes']),
      status: serializer.fromJson<String>(json['status']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      error: serializer.fromJson<String?>(json['error']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'trackId': serializer.toJson<String>(trackId),
      'filePath': serializer.toJson<String>(filePath),
      'totalBytes': serializer.toJson<int>(totalBytes),
      'downloadedBytes': serializer.toJson<int>(downloadedBytes),
      'status': serializer.toJson<String>(status),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'error': serializer.toJson<String?>(error),
    };
  }

  DownloadEntity copyWith(
          {String? id,
          String? trackId,
          String? filePath,
          int? totalBytes,
          int? downloadedBytes,
          String? status,
          Value<DateTime?> startedAt = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          Value<String?> error = const Value.absent()}) =>
      DownloadEntity(
        id: id ?? this.id,
        trackId: trackId ?? this.trackId,
        filePath: filePath ?? this.filePath,
        totalBytes: totalBytes ?? this.totalBytes,
        downloadedBytes: downloadedBytes ?? this.downloadedBytes,
        status: status ?? this.status,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        error: error.present ? error.value : this.error,
      );
  DownloadEntity copyWithCompanion(DownloadsCompanion data) {
    return DownloadEntity(
      id: data.id.present ? data.id.value : this.id,
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      totalBytes:
          data.totalBytes.present ? data.totalBytes.value : this.totalBytes,
      downloadedBytes: data.downloadedBytes.present
          ? data.downloadedBytes.value
          : this.downloadedBytes,
      status: data.status.present ? data.status.value : this.status,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      error: data.error.present ? data.error.value : this.error,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadEntity(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('filePath: $filePath, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('downloadedBytes: $downloadedBytes, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('error: $error')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, trackId, filePath, totalBytes,
      downloadedBytes, status, startedAt, completedAt, error);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadEntity &&
          other.id == this.id &&
          other.trackId == this.trackId &&
          other.filePath == this.filePath &&
          other.totalBytes == this.totalBytes &&
          other.downloadedBytes == this.downloadedBytes &&
          other.status == this.status &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.error == this.error);
}

class DownloadsCompanion extends UpdateCompanion<DownloadEntity> {
  final Value<String> id;
  final Value<String> trackId;
  final Value<String> filePath;
  final Value<int> totalBytes;
  final Value<int> downloadedBytes;
  final Value<String> status;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String?> error;
  final Value<int> rowid;
  const DownloadsCompanion({
    this.id = const Value.absent(),
    this.trackId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.totalBytes = const Value.absent(),
    this.downloadedBytes = const Value.absent(),
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.error = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DownloadsCompanion.insert({
    required String id,
    required String trackId,
    required String filePath,
    required int totalBytes,
    required int downloadedBytes,
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.error = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        trackId = Value(trackId),
        filePath = Value(filePath),
        totalBytes = Value(totalBytes),
        downloadedBytes = Value(downloadedBytes);
  static Insertable<DownloadEntity> custom({
    Expression<String>? id,
    Expression<String>? trackId,
    Expression<String>? filePath,
    Expression<int>? totalBytes,
    Expression<int>? downloadedBytes,
    Expression<String>? status,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? error,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackId != null) 'track_id': trackId,
      if (filePath != null) 'file_path': filePath,
      if (totalBytes != null) 'total_bytes': totalBytes,
      if (downloadedBytes != null) 'downloaded_bytes': downloadedBytes,
      if (status != null) 'status': status,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (error != null) 'error': error,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DownloadsCompanion copyWith(
      {Value<String>? id,
      Value<String>? trackId,
      Value<String>? filePath,
      Value<int>? totalBytes,
      Value<int>? downloadedBytes,
      Value<String>? status,
      Value<DateTime?>? startedAt,
      Value<DateTime?>? completedAt,
      Value<String?>? error,
      Value<int>? rowid}) {
    return DownloadsCompanion(
      id: id ?? this.id,
      trackId: trackId ?? this.trackId,
      filePath: filePath ?? this.filePath,
      totalBytes: totalBytes ?? this.totalBytes,
      downloadedBytes: downloadedBytes ?? this.downloadedBytes,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      error: error ?? this.error,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (totalBytes.present) {
      map['total_bytes'] = Variable<int>(totalBytes.value);
    }
    if (downloadedBytes.present) {
      map['downloaded_bytes'] = Variable<int>(downloadedBytes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadsCompanion(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('filePath: $filePath, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('downloadedBytes: $downloadedBytes, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('error: $error, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TracksTable tracks = $TracksTable(this);
  late final $PlaylistsTable playlists = $PlaylistsTable(this);
  late final $PlaylistTracksTable playlistTracks = $PlaylistTracksTable(this);
  late final $ArtistsTable artists = $ArtistsTable(this);
  late final $AlbumsTable albums = $AlbumsTable(this);
  late final $HistoryTable history = $HistoryTable(this);
  late final $LyricsCacheTable lyricsCache = $LyricsCacheTable(this);
  late final $SearchHistoryTable searchHistory = $SearchHistoryTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $DownloadsTable downloads = $DownloadsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tracks,
        playlists,
        playlistTracks,
        artists,
        albums,
        history,
        lyricsCache,
        searchHistory,
        settings,
        downloads
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('playlists',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('playlist_tracks', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tracks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('playlist_tracks', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tracks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('history', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tracks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('downloads', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$TracksTableCreateCompanionBuilder = TracksCompanion Function({
  required String id,
  required String title,
  required String artist,
  required String artistId,
  Value<String?> album,
  Value<String?> albumId,
  required int duration,
  required String artworkUrl,
  Value<String?> audioStreamUrl,
  Value<int?> itag,
  Value<int?> bitrate,
  Value<String?> lyricsId,
  Value<bool> isExplicit,
  Value<bool> isAvailable,
  Value<List<String>> availableCountries,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<bool> isOffline,
  Value<String?> offlineFilePath,
  Value<int> rowid,
});
typedef $$TracksTableUpdateCompanionBuilder = TracksCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> artist,
  Value<String> artistId,
  Value<String?> album,
  Value<String?> albumId,
  Value<int> duration,
  Value<String> artworkUrl,
  Value<String?> audioStreamUrl,
  Value<int?> itag,
  Value<int?> bitrate,
  Value<String?> lyricsId,
  Value<bool> isExplicit,
  Value<bool> isAvailable,
  Value<List<String>> availableCountries,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<bool> isOffline,
  Value<String?> offlineFilePath,
  Value<int> rowid,
});

final class $$TracksTableReferences
    extends BaseReferences<_$AppDatabase, $TracksTable, TrackEntity> {
  $$TracksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlaylistTracksTable, List<PlaylistTrackEntity>>
      _playlistTracksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.playlistTracks,
              aliasName: $_aliasNameGenerator(
                  db.tracks.id, db.playlistTracks.trackId));

  $$PlaylistTracksTableProcessedTableManager get playlistTracksRefs {
    final manager = $$PlaylistTracksTableTableManager($_db, $_db.playlistTracks)
        .filter((f) => f.trackId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_playlistTracksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$HistoryTable, List<HistoryEntity>>
      _historyRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.history,
          aliasName: $_aliasNameGenerator(db.tracks.id, db.history.trackId));

  $$HistoryTableProcessedTableManager get historyRefs {
    final manager = $$HistoryTableTableManager($_db, $_db.history)
        .filter((f) => f.trackId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_historyRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DownloadsTable, List<DownloadEntity>>
      _downloadsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.downloads,
          aliasName: $_aliasNameGenerator(db.tracks.id, db.downloads.trackId));

  $$DownloadsTableProcessedTableManager get downloadsRefs {
    final manager = $$DownloadsTableTableManager($_db, $_db.downloads)
        .filter((f) => f.trackId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_downloadsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TracksTableFilterComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artist => $composableBuilder(
      column: $table.artist, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artistId => $composableBuilder(
      column: $table.artistId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get album => $composableBuilder(
      column: $table.album, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get albumId => $composableBuilder(
      column: $table.albumId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioStreamUrl => $composableBuilder(
      column: $table.audioStreamUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get itag => $composableBuilder(
      column: $table.itag, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bitrate => $composableBuilder(
      column: $table.bitrate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lyricsId => $composableBuilder(
      column: $table.lyricsId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isExplicit => $composableBuilder(
      column: $table.isExplicit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get availableCountries => $composableBuilder(
          column: $table.availableCountries,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get rawData => $composableBuilder(
          column: $table.rawData,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOffline => $composableBuilder(
      column: $table.isOffline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get offlineFilePath => $composableBuilder(
      column: $table.offlineFilePath,
      builder: (column) => ColumnFilters(column));

  Expression<bool> playlistTracksRefs(
      Expression<bool> Function($$PlaylistTracksTableFilterComposer f) f) {
    final $$PlaylistTracksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playlistTracks,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistTracksTableFilterComposer(
              $db: $db,
              $table: $db.playlistTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> historyRefs(
      Expression<bool> Function($$HistoryTableFilterComposer f) f) {
    final $$HistoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.history,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryTableFilterComposer(
              $db: $db,
              $table: $db.history,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> downloadsRefs(
      Expression<bool> Function($$DownloadsTableFilterComposer f) f) {
    final $$DownloadsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.downloads,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DownloadsTableFilterComposer(
              $db: $db,
              $table: $db.downloads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TracksTableOrderingComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artist => $composableBuilder(
      column: $table.artist, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artistId => $composableBuilder(
      column: $table.artistId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get album => $composableBuilder(
      column: $table.album, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get albumId => $composableBuilder(
      column: $table.albumId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioStreamUrl => $composableBuilder(
      column: $table.audioStreamUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get itag => $composableBuilder(
      column: $table.itag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bitrate => $composableBuilder(
      column: $table.bitrate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lyricsId => $composableBuilder(
      column: $table.lyricsId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isExplicit => $composableBuilder(
      column: $table.isExplicit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get availableCountries => $composableBuilder(
      column: $table.availableCountries,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawData => $composableBuilder(
      column: $table.rawData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOffline => $composableBuilder(
      column: $table.isOffline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get offlineFilePath => $composableBuilder(
      column: $table.offlineFilePath,
      builder: (column) => ColumnOrderings(column));
}

class $$TracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TracksTable> {
  $$TracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get artistId =>
      $composableBuilder(column: $table.artistId, builder: (column) => column);

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<String> get albumId =>
      $composableBuilder(column: $table.albumId, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => column);

  GeneratedColumn<String> get audioStreamUrl => $composableBuilder(
      column: $table.audioStreamUrl, builder: (column) => column);

  GeneratedColumn<int> get itag =>
      $composableBuilder(column: $table.itag, builder: (column) => column);

  GeneratedColumn<int> get bitrate =>
      $composableBuilder(column: $table.bitrate, builder: (column) => column);

  GeneratedColumn<String> get lyricsId =>
      $composableBuilder(column: $table.lyricsId, builder: (column) => column);

  GeneratedColumn<bool> get isExplicit => $composableBuilder(
      column: $table.isExplicit, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get availableCountries => $composableBuilder(
          column: $table.availableCountries, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<bool> get isOffline =>
      $composableBuilder(column: $table.isOffline, builder: (column) => column);

  GeneratedColumn<String> get offlineFilePath => $composableBuilder(
      column: $table.offlineFilePath, builder: (column) => column);

  Expression<T> playlistTracksRefs<T extends Object>(
      Expression<T> Function($$PlaylistTracksTableAnnotationComposer a) f) {
    final $$PlaylistTracksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playlistTracks,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistTracksTableAnnotationComposer(
              $db: $db,
              $table: $db.playlistTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> historyRefs<T extends Object>(
      Expression<T> Function($$HistoryTableAnnotationComposer a) f) {
    final $$HistoryTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.history,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryTableAnnotationComposer(
              $db: $db,
              $table: $db.history,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> downloadsRefs<T extends Object>(
      Expression<T> Function($$DownloadsTableAnnotationComposer a) f) {
    final $$DownloadsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.downloads,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DownloadsTableAnnotationComposer(
              $db: $db,
              $table: $db.downloads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TracksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TracksTable,
    TrackEntity,
    $$TracksTableFilterComposer,
    $$TracksTableOrderingComposer,
    $$TracksTableAnnotationComposer,
    $$TracksTableCreateCompanionBuilder,
    $$TracksTableUpdateCompanionBuilder,
    (TrackEntity, $$TracksTableReferences),
    TrackEntity,
    PrefetchHooks Function(
        {bool playlistTracksRefs, bool historyRefs, bool downloadsRefs})> {
  $$TracksTableTableManager(_$AppDatabase db, $TracksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> artist = const Value.absent(),
            Value<String> artistId = const Value.absent(),
            Value<String?> album = const Value.absent(),
            Value<String?> albumId = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<String> artworkUrl = const Value.absent(),
            Value<String?> audioStreamUrl = const Value.absent(),
            Value<int?> itag = const Value.absent(),
            Value<int?> bitrate = const Value.absent(),
            Value<String?> lyricsId = const Value.absent(),
            Value<bool> isExplicit = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<List<String>> availableCountries = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<bool> isOffline = const Value.absent(),
            Value<String?> offlineFilePath = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TracksCompanion(
            id: id,
            title: title,
            artist: artist,
            artistId: artistId,
            album: album,
            albumId: albumId,
            duration: duration,
            artworkUrl: artworkUrl,
            audioStreamUrl: audioStreamUrl,
            itag: itag,
            bitrate: bitrate,
            lyricsId: lyricsId,
            isExplicit: isExplicit,
            isAvailable: isAvailable,
            availableCountries: availableCountries,
            rawData: rawData,
            cachedAt: cachedAt,
            isOffline: isOffline,
            offlineFilePath: offlineFilePath,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String artist,
            required String artistId,
            Value<String?> album = const Value.absent(),
            Value<String?> albumId = const Value.absent(),
            required int duration,
            required String artworkUrl,
            Value<String?> audioStreamUrl = const Value.absent(),
            Value<int?> itag = const Value.absent(),
            Value<int?> bitrate = const Value.absent(),
            Value<String?> lyricsId = const Value.absent(),
            Value<bool> isExplicit = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<List<String>> availableCountries = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<bool> isOffline = const Value.absent(),
            Value<String?> offlineFilePath = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TracksCompanion.insert(
            id: id,
            title: title,
            artist: artist,
            artistId: artistId,
            album: album,
            albumId: albumId,
            duration: duration,
            artworkUrl: artworkUrl,
            audioStreamUrl: audioStreamUrl,
            itag: itag,
            bitrate: bitrate,
            lyricsId: lyricsId,
            isExplicit: isExplicit,
            isAvailable: isAvailable,
            availableCountries: availableCountries,
            rawData: rawData,
            cachedAt: cachedAt,
            isOffline: isOffline,
            offlineFilePath: offlineFilePath,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TracksTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {playlistTracksRefs = false,
              historyRefs = false,
              downloadsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (playlistTracksRefs) db.playlistTracks,
                if (historyRefs) db.history,
                if (downloadsRefs) db.downloads
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playlistTracksRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TracksTableReferences
                            ._playlistTracksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TracksTableReferences(db, table, p0)
                                .playlistTracksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.trackId == item.id),
                        typedResults: items),
                  if (historyRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TracksTableReferences._historyRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TracksTableReferences(db, table, p0).historyRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.trackId == item.id),
                        typedResults: items),
                  if (downloadsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TracksTableReferences._downloadsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TracksTableReferences(db, table, p0)
                                .downloadsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.trackId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TracksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TracksTable,
    TrackEntity,
    $$TracksTableFilterComposer,
    $$TracksTableOrderingComposer,
    $$TracksTableAnnotationComposer,
    $$TracksTableCreateCompanionBuilder,
    $$TracksTableUpdateCompanionBuilder,
    (TrackEntity, $$TracksTableReferences),
    TrackEntity,
    PrefetchHooks Function(
        {bool playlistTracksRefs, bool historyRefs, bool downloadsRefs})>;
typedef $$PlaylistsTableCreateCompanionBuilder = PlaylistsCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  required String artworkUrl,
  required int trackCount,
  Value<String?> author,
  Value<String?> authorId,
  Value<bool?> isPublic,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<bool> isLocal,
  Value<int> rowid,
});
typedef $$PlaylistsTableUpdateCompanionBuilder = PlaylistsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<String> artworkUrl,
  Value<int> trackCount,
  Value<String?> author,
  Value<String?> authorId,
  Value<bool?> isPublic,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<bool> isLocal,
  Value<int> rowid,
});

final class $$PlaylistsTableReferences
    extends BaseReferences<_$AppDatabase, $PlaylistsTable, PlaylistEntity> {
  $$PlaylistsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlaylistTracksTable, List<PlaylistTrackEntity>>
      _playlistTracksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.playlistTracks,
              aliasName: $_aliasNameGenerator(
                  db.playlists.id, db.playlistTracks.playlistId));

  $$PlaylistTracksTableProcessedTableManager get playlistTracksRefs {
    final manager = $$PlaylistTracksTableTableManager($_db, $_db.playlistTracks)
        .filter((f) => f.playlistId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_playlistTracksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlaylistsTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistsTable> {
  $$PlaylistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get trackCount => $composableBuilder(
      column: $table.trackCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPublic => $composableBuilder(
      column: $table.isPublic, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get rawData => $composableBuilder(
          column: $table.rawData,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLocal => $composableBuilder(
      column: $table.isLocal, builder: (column) => ColumnFilters(column));

  Expression<bool> playlistTracksRefs(
      Expression<bool> Function($$PlaylistTracksTableFilterComposer f) f) {
    final $$PlaylistTracksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playlistTracks,
        getReferencedColumn: (t) => t.playlistId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistTracksTableFilterComposer(
              $db: $db,
              $table: $db.playlistTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlaylistsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistsTable> {
  $$PlaylistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get trackCount => $composableBuilder(
      column: $table.trackCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPublic => $composableBuilder(
      column: $table.isPublic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawData => $composableBuilder(
      column: $table.rawData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLocal => $composableBuilder(
      column: $table.isLocal, builder: (column) => ColumnOrderings(column));
}

class $$PlaylistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistsTable> {
  $$PlaylistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => column);

  GeneratedColumn<int> get trackCount => $composableBuilder(
      column: $table.trackCount, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get authorId =>
      $composableBuilder(column: $table.authorId, builder: (column) => column);

  GeneratedColumn<bool> get isPublic =>
      $composableBuilder(column: $table.isPublic, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<bool> get isLocal =>
      $composableBuilder(column: $table.isLocal, builder: (column) => column);

  Expression<T> playlistTracksRefs<T extends Object>(
      Expression<T> Function($$PlaylistTracksTableAnnotationComposer a) f) {
    final $$PlaylistTracksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playlistTracks,
        getReferencedColumn: (t) => t.playlistId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistTracksTableAnnotationComposer(
              $db: $db,
              $table: $db.playlistTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlaylistsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlaylistsTable,
    PlaylistEntity,
    $$PlaylistsTableFilterComposer,
    $$PlaylistsTableOrderingComposer,
    $$PlaylistsTableAnnotationComposer,
    $$PlaylistsTableCreateCompanionBuilder,
    $$PlaylistsTableUpdateCompanionBuilder,
    (PlaylistEntity, $$PlaylistsTableReferences),
    PlaylistEntity,
    PrefetchHooks Function({bool playlistTracksRefs})> {
  $$PlaylistsTableTableManager(_$AppDatabase db, $PlaylistsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> artworkUrl = const Value.absent(),
            Value<int> trackCount = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> authorId = const Value.absent(),
            Value<bool?> isPublic = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<bool> isLocal = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlaylistsCompanion(
            id: id,
            title: title,
            description: description,
            artworkUrl: artworkUrl,
            trackCount: trackCount,
            author: author,
            authorId: authorId,
            isPublic: isPublic,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rawData: rawData,
            cachedAt: cachedAt,
            isLocal: isLocal,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            required String artworkUrl,
            required int trackCount,
            Value<String?> author = const Value.absent(),
            Value<String?> authorId = const Value.absent(),
            Value<bool?> isPublic = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<bool> isLocal = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlaylistsCompanion.insert(
            id: id,
            title: title,
            description: description,
            artworkUrl: artworkUrl,
            trackCount: trackCount,
            author: author,
            authorId: authorId,
            isPublic: isPublic,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rawData: rawData,
            cachedAt: cachedAt,
            isLocal: isLocal,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlaylistsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({playlistTracksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (playlistTracksRefs) db.playlistTracks
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playlistTracksRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PlaylistsTableReferences
                            ._playlistTracksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlaylistsTableReferences(db, table, p0)
                                .playlistTracksRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.playlistId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlaylistsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlaylistsTable,
    PlaylistEntity,
    $$PlaylistsTableFilterComposer,
    $$PlaylistsTableOrderingComposer,
    $$PlaylistsTableAnnotationComposer,
    $$PlaylistsTableCreateCompanionBuilder,
    $$PlaylistsTableUpdateCompanionBuilder,
    (PlaylistEntity, $$PlaylistsTableReferences),
    PlaylistEntity,
    PrefetchHooks Function({bool playlistTracksRefs})>;
typedef $$PlaylistTracksTableCreateCompanionBuilder = PlaylistTracksCompanion
    Function({
  required String playlistId,
  required String trackId,
  required int position,
  Value<DateTime> addedAt,
  Value<int> rowid,
});
typedef $$PlaylistTracksTableUpdateCompanionBuilder = PlaylistTracksCompanion
    Function({
  Value<String> playlistId,
  Value<String> trackId,
  Value<int> position,
  Value<DateTime> addedAt,
  Value<int> rowid,
});

final class $$PlaylistTracksTableReferences extends BaseReferences<
    _$AppDatabase, $PlaylistTracksTable, PlaylistTrackEntity> {
  $$PlaylistTracksTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistsTable _playlistIdTable(_$AppDatabase db) =>
      db.playlists.createAlias(
          $_aliasNameGenerator(db.playlistTracks.playlistId, db.playlists.id));

  $$PlaylistsTableProcessedTableManager get playlistId {
    final manager = $$PlaylistsTableTableManager($_db, $_db.playlists)
        .filter((f) => f.id($_item.playlistId));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TracksTable _trackIdTable(_$AppDatabase db) => db.tracks.createAlias(
      $_aliasNameGenerator(db.playlistTracks.trackId, db.tracks.id));

  $$TracksTableProcessedTableManager get trackId {
    final manager = $$TracksTableTableManager($_db, $_db.tracks)
        .filter((f) => f.id($_item.trackId));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PlaylistTracksTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistTracksTable> {
  $$PlaylistTracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));

  $$PlaylistsTableFilterComposer get playlistId {
    final $$PlaylistsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.playlistId,
        referencedTable: $db.playlists,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistsTableFilterComposer(
              $db: $db,
              $table: $db.playlists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TracksTableFilterComposer get trackId {
    final $$TracksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableFilterComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlaylistTracksTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistTracksTable> {
  $$PlaylistTracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));

  $$PlaylistsTableOrderingComposer get playlistId {
    final $$PlaylistsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.playlistId,
        referencedTable: $db.playlists,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistsTableOrderingComposer(
              $db: $db,
              $table: $db.playlists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TracksTableOrderingComposer get trackId {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableOrderingComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlaylistTracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistTracksTable> {
  $$PlaylistTracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$PlaylistsTableAnnotationComposer get playlistId {
    final $$PlaylistsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.playlistId,
        referencedTable: $db.playlists,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlaylistsTableAnnotationComposer(
              $db: $db,
              $table: $db.playlists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TracksTableAnnotationComposer get trackId {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableAnnotationComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlaylistTracksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlaylistTracksTable,
    PlaylistTrackEntity,
    $$PlaylistTracksTableFilterComposer,
    $$PlaylistTracksTableOrderingComposer,
    $$PlaylistTracksTableAnnotationComposer,
    $$PlaylistTracksTableCreateCompanionBuilder,
    $$PlaylistTracksTableUpdateCompanionBuilder,
    (PlaylistTrackEntity, $$PlaylistTracksTableReferences),
    PlaylistTrackEntity,
    PrefetchHooks Function({bool playlistId, bool trackId})> {
  $$PlaylistTracksTableTableManager(
      _$AppDatabase db, $PlaylistTracksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistTracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistTracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistTracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> playlistId = const Value.absent(),
            Value<String> trackId = const Value.absent(),
            Value<int> position = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlaylistTracksCompanion(
            playlistId: playlistId,
            trackId: trackId,
            position: position,
            addedAt: addedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String playlistId,
            required String trackId,
            required int position,
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlaylistTracksCompanion.insert(
            playlistId: playlistId,
            trackId: trackId,
            position: position,
            addedAt: addedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlaylistTracksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({playlistId = false, trackId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (playlistId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.playlistId,
                    referencedTable:
                        $$PlaylistTracksTableReferences._playlistIdTable(db),
                    referencedColumn:
                        $$PlaylistTracksTableReferences._playlistIdTable(db).id,
                  ) as T;
                }
                if (trackId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.trackId,
                    referencedTable:
                        $$PlaylistTracksTableReferences._trackIdTable(db),
                    referencedColumn:
                        $$PlaylistTracksTableReferences._trackIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PlaylistTracksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlaylistTracksTable,
    PlaylistTrackEntity,
    $$PlaylistTracksTableFilterComposer,
    $$PlaylistTracksTableOrderingComposer,
    $$PlaylistTracksTableAnnotationComposer,
    $$PlaylistTracksTableCreateCompanionBuilder,
    $$PlaylistTracksTableUpdateCompanionBuilder,
    (PlaylistTrackEntity, $$PlaylistTracksTableReferences),
    PlaylistTrackEntity,
    PrefetchHooks Function({bool playlistId, bool trackId})>;
typedef $$ArtistsTableCreateCompanionBuilder = ArtistsCompanion Function({
  required String id,
  required String name,
  required String artworkUrl,
  Value<String?> description,
  Value<int?> subscriberCount,
  Value<List<String>> genres,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});
typedef $$ArtistsTableUpdateCompanionBuilder = ArtistsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> artworkUrl,
  Value<String?> description,
  Value<int?> subscriberCount,
  Value<List<String>> genres,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$ArtistsTableFilterComposer
    extends Composer<_$AppDatabase, $ArtistsTable> {
  $$ArtistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subscriberCount => $composableBuilder(
      column: $table.subscriberCount,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get genres => $composableBuilder(
          column: $table.genres,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get rawData => $composableBuilder(
          column: $table.rawData,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$ArtistsTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtistsTable> {
  $$ArtistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subscriberCount => $composableBuilder(
      column: $table.subscriberCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawData => $composableBuilder(
      column: $table.rawData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$ArtistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtistsTable> {
  $$ArtistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get subscriberCount => $composableBuilder(
      column: $table.subscriberCount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$ArtistsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArtistsTable,
    ArtistEntity,
    $$ArtistsTableFilterComposer,
    $$ArtistsTableOrderingComposer,
    $$ArtistsTableAnnotationComposer,
    $$ArtistsTableCreateCompanionBuilder,
    $$ArtistsTableUpdateCompanionBuilder,
    (ArtistEntity, BaseReferences<_$AppDatabase, $ArtistsTable, ArtistEntity>),
    ArtistEntity,
    PrefetchHooks Function()> {
  $$ArtistsTableTableManager(_$AppDatabase db, $ArtistsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> artworkUrl = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> subscriberCount = const Value.absent(),
            Value<List<String>> genres = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArtistsCompanion(
            id: id,
            name: name,
            artworkUrl: artworkUrl,
            description: description,
            subscriberCount: subscriberCount,
            genres: genres,
            rawData: rawData,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String artworkUrl,
            Value<String?> description = const Value.absent(),
            Value<int?> subscriberCount = const Value.absent(),
            Value<List<String>> genres = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArtistsCompanion.insert(
            id: id,
            name: name,
            artworkUrl: artworkUrl,
            description: description,
            subscriberCount: subscriberCount,
            genres: genres,
            rawData: rawData,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ArtistsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArtistsTable,
    ArtistEntity,
    $$ArtistsTableFilterComposer,
    $$ArtistsTableOrderingComposer,
    $$ArtistsTableAnnotationComposer,
    $$ArtistsTableCreateCompanionBuilder,
    $$ArtistsTableUpdateCompanionBuilder,
    (ArtistEntity, BaseReferences<_$AppDatabase, $ArtistsTable, ArtistEntity>),
    ArtistEntity,
    PrefetchHooks Function()>;
typedef $$AlbumsTableCreateCompanionBuilder = AlbumsCompanion Function({
  required String id,
  required String title,
  required String artist,
  required String artistId,
  required String artworkUrl,
  required int year,
  required int trackCount,
  Value<String?> description,
  Value<List<String>> genres,
  Value<DateTime?> releaseDate,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});
typedef $$AlbumsTableUpdateCompanionBuilder = AlbumsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> artist,
  Value<String> artistId,
  Value<String> artworkUrl,
  Value<int> year,
  Value<int> trackCount,
  Value<String?> description,
  Value<List<String>> genres,
  Value<DateTime?> releaseDate,
  Value<Map<String, dynamic>?> rawData,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$AlbumsTableFilterComposer
    extends Composer<_$AppDatabase, $AlbumsTable> {
  $$AlbumsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artist => $composableBuilder(
      column: $table.artist, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artistId => $composableBuilder(
      column: $table.artistId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get trackCount => $composableBuilder(
      column: $table.trackCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get genres => $composableBuilder(
          column: $table.genres,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get rawData => $composableBuilder(
          column: $table.rawData,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$AlbumsTableOrderingComposer
    extends Composer<_$AppDatabase, $AlbumsTable> {
  $$AlbumsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artist => $composableBuilder(
      column: $table.artist, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artistId => $composableBuilder(
      column: $table.artistId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get trackCount => $composableBuilder(
      column: $table.trackCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawData => $composableBuilder(
      column: $table.rawData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$AlbumsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlbumsTable> {
  $$AlbumsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get artistId =>
      $composableBuilder(column: $table.artistId, builder: (column) => column);

  GeneratedColumn<String> get artworkUrl => $composableBuilder(
      column: $table.artworkUrl, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get trackCount => $composableBuilder(
      column: $table.trackCount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$AlbumsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AlbumsTable,
    AlbumEntity,
    $$AlbumsTableFilterComposer,
    $$AlbumsTableOrderingComposer,
    $$AlbumsTableAnnotationComposer,
    $$AlbumsTableCreateCompanionBuilder,
    $$AlbumsTableUpdateCompanionBuilder,
    (AlbumEntity, BaseReferences<_$AppDatabase, $AlbumsTable, AlbumEntity>),
    AlbumEntity,
    PrefetchHooks Function()> {
  $$AlbumsTableTableManager(_$AppDatabase db, $AlbumsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlbumsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlbumsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlbumsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> artist = const Value.absent(),
            Value<String> artistId = const Value.absent(),
            Value<String> artworkUrl = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<int> trackCount = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<List<String>> genres = const Value.absent(),
            Value<DateTime?> releaseDate = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AlbumsCompanion(
            id: id,
            title: title,
            artist: artist,
            artistId: artistId,
            artworkUrl: artworkUrl,
            year: year,
            trackCount: trackCount,
            description: description,
            genres: genres,
            releaseDate: releaseDate,
            rawData: rawData,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String artist,
            required String artistId,
            required String artworkUrl,
            required int year,
            required int trackCount,
            Value<String?> description = const Value.absent(),
            Value<List<String>> genres = const Value.absent(),
            Value<DateTime?> releaseDate = const Value.absent(),
            Value<Map<String, dynamic>?> rawData = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AlbumsCompanion.insert(
            id: id,
            title: title,
            artist: artist,
            artistId: artistId,
            artworkUrl: artworkUrl,
            year: year,
            trackCount: trackCount,
            description: description,
            genres: genres,
            releaseDate: releaseDate,
            rawData: rawData,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AlbumsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AlbumsTable,
    AlbumEntity,
    $$AlbumsTableFilterComposer,
    $$AlbumsTableOrderingComposer,
    $$AlbumsTableAnnotationComposer,
    $$AlbumsTableCreateCompanionBuilder,
    $$AlbumsTableUpdateCompanionBuilder,
    (AlbumEntity, BaseReferences<_$AppDatabase, $AlbumsTable, AlbumEntity>),
    AlbumEntity,
    PrefetchHooks Function()>;
typedef $$HistoryTableCreateCompanionBuilder = HistoryCompanion Function({
  Value<int> id,
  required String trackId,
  Value<DateTime> playedAt,
  Value<int> progress,
  Value<bool> completed,
});
typedef $$HistoryTableUpdateCompanionBuilder = HistoryCompanion Function({
  Value<int> id,
  Value<String> trackId,
  Value<DateTime> playedAt,
  Value<int> progress,
  Value<bool> completed,
});

final class $$HistoryTableReferences
    extends BaseReferences<_$AppDatabase, $HistoryTable, HistoryEntity> {
  $$HistoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TracksTable _trackIdTable(_$AppDatabase db) => db.tracks
      .createAlias($_aliasNameGenerator(db.history.trackId, db.tracks.id));

  $$TracksTableProcessedTableManager get trackId {
    final manager = $$TracksTableTableManager($_db, $_db.tracks)
        .filter((f) => f.id($_item.trackId));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HistoryTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTable> {
  $$HistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get playedAt => $composableBuilder(
      column: $table.playedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  $$TracksTableFilterComposer get trackId {
    final $$TracksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableFilterComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTable> {
  $$HistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get playedAt => $composableBuilder(
      column: $table.playedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  $$TracksTableOrderingComposer get trackId {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableOrderingComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTable> {
  $$HistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get playedAt =>
      $composableBuilder(column: $table.playedAt, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  $$TracksTableAnnotationComposer get trackId {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableAnnotationComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HistoryTable,
    HistoryEntity,
    $$HistoryTableFilterComposer,
    $$HistoryTableOrderingComposer,
    $$HistoryTableAnnotationComposer,
    $$HistoryTableCreateCompanionBuilder,
    $$HistoryTableUpdateCompanionBuilder,
    (HistoryEntity, $$HistoryTableReferences),
    HistoryEntity,
    PrefetchHooks Function({bool trackId})> {
  $$HistoryTableTableManager(_$AppDatabase db, $HistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> trackId = const Value.absent(),
            Value<DateTime> playedAt = const Value.absent(),
            Value<int> progress = const Value.absent(),
            Value<bool> completed = const Value.absent(),
          }) =>
              HistoryCompanion(
            id: id,
            trackId: trackId,
            playedAt: playedAt,
            progress: progress,
            completed: completed,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String trackId,
            Value<DateTime> playedAt = const Value.absent(),
            Value<int> progress = const Value.absent(),
            Value<bool> completed = const Value.absent(),
          }) =>
              HistoryCompanion.insert(
            id: id,
            trackId: trackId,
            playedAt: playedAt,
            progress: progress,
            completed: completed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HistoryTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({trackId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (trackId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.trackId,
                    referencedTable: $$HistoryTableReferences._trackIdTable(db),
                    referencedColumn:
                        $$HistoryTableReferences._trackIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HistoryTable,
    HistoryEntity,
    $$HistoryTableFilterComposer,
    $$HistoryTableOrderingComposer,
    $$HistoryTableAnnotationComposer,
    $$HistoryTableCreateCompanionBuilder,
    $$HistoryTableUpdateCompanionBuilder,
    (HistoryEntity, $$HistoryTableReferences),
    HistoryEntity,
    PrefetchHooks Function({bool trackId})>;
typedef $$LyricsCacheTableCreateCompanionBuilder = LyricsCacheCompanion
    Function({
  required String trackId,
  Value<String> source,
  Value<String?> rawLrc,
  required List<dynamic> linesJson,
  Value<bool> hasSynced,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});
typedef $$LyricsCacheTableUpdateCompanionBuilder = LyricsCacheCompanion
    Function({
  Value<String> trackId,
  Value<String> source,
  Value<String?> rawLrc,
  Value<List<dynamic>> linesJson,
  Value<bool> hasSynced,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$LyricsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $LyricsCacheTable> {
  $$LyricsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get trackId => $composableBuilder(
      column: $table.trackId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rawLrc => $composableBuilder(
      column: $table.rawLrc, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<dynamic>, List<dynamic>, String>
      get linesJson => $composableBuilder(
          column: $table.linesJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get hasSynced => $composableBuilder(
      column: $table.hasSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$LyricsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $LyricsCacheTable> {
  $$LyricsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get trackId => $composableBuilder(
      column: $table.trackId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawLrc => $composableBuilder(
      column: $table.rawLrc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get linesJson => $composableBuilder(
      column: $table.linesJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasSynced => $composableBuilder(
      column: $table.hasSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$LyricsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $LyricsCacheTable> {
  $$LyricsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get rawLrc =>
      $composableBuilder(column: $table.rawLrc, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<dynamic>, String> get linesJson =>
      $composableBuilder(column: $table.linesJson, builder: (column) => column);

  GeneratedColumn<bool> get hasSynced =>
      $composableBuilder(column: $table.hasSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$LyricsCacheTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LyricsCacheTable,
    LyricsEntity,
    $$LyricsCacheTableFilterComposer,
    $$LyricsCacheTableOrderingComposer,
    $$LyricsCacheTableAnnotationComposer,
    $$LyricsCacheTableCreateCompanionBuilder,
    $$LyricsCacheTableUpdateCompanionBuilder,
    (
      LyricsEntity,
      BaseReferences<_$AppDatabase, $LyricsCacheTable, LyricsEntity>
    ),
    LyricsEntity,
    PrefetchHooks Function()> {
  $$LyricsCacheTableTableManager(_$AppDatabase db, $LyricsCacheTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LyricsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LyricsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LyricsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> trackId = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String?> rawLrc = const Value.absent(),
            Value<List<dynamic>> linesJson = const Value.absent(),
            Value<bool> hasSynced = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LyricsCacheCompanion(
            trackId: trackId,
            source: source,
            rawLrc: rawLrc,
            linesJson: linesJson,
            hasSynced: hasSynced,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String trackId,
            Value<String> source = const Value.absent(),
            Value<String?> rawLrc = const Value.absent(),
            required List<dynamic> linesJson,
            Value<bool> hasSynced = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LyricsCacheCompanion.insert(
            trackId: trackId,
            source: source,
            rawLrc: rawLrc,
            linesJson: linesJson,
            hasSynced: hasSynced,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LyricsCacheTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LyricsCacheTable,
    LyricsEntity,
    $$LyricsCacheTableFilterComposer,
    $$LyricsCacheTableOrderingComposer,
    $$LyricsCacheTableAnnotationComposer,
    $$LyricsCacheTableCreateCompanionBuilder,
    $$LyricsCacheTableUpdateCompanionBuilder,
    (
      LyricsEntity,
      BaseReferences<_$AppDatabase, $LyricsCacheTable, LyricsEntity>
    ),
    LyricsEntity,
    PrefetchHooks Function()>;
typedef $$SearchHistoryTableCreateCompanionBuilder = SearchHistoryCompanion
    Function({
  Value<int> id,
  required String query,
  required String filter,
  Value<DateTime> searchedAt,
});
typedef $$SearchHistoryTableUpdateCompanionBuilder = SearchHistoryCompanion
    Function({
  Value<int> id,
  Value<String> query,
  Value<String> filter,
  Value<DateTime> searchedAt,
});

class $$SearchHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $SearchHistoryTable> {
  $$SearchHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filter => $composableBuilder(
      column: $table.filter, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnFilters(column));
}

class $$SearchHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchHistoryTable> {
  $$SearchHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filter => $composableBuilder(
      column: $table.filter, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnOrderings(column));
}

class $$SearchHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchHistoryTable> {
  $$SearchHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<String> get filter =>
      $composableBuilder(column: $table.filter, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => column);
}

class $$SearchHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryTable,
    SearchHistoryEntity,
    $$SearchHistoryTableFilterComposer,
    $$SearchHistoryTableOrderingComposer,
    $$SearchHistoryTableAnnotationComposer,
    $$SearchHistoryTableCreateCompanionBuilder,
    $$SearchHistoryTableUpdateCompanionBuilder,
    (
      SearchHistoryEntity,
      BaseReferences<_$AppDatabase, $SearchHistoryTable, SearchHistoryEntity>
    ),
    SearchHistoryEntity,
    PrefetchHooks Function()> {
  $$SearchHistoryTableTableManager(_$AppDatabase db, $SearchHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<String> filter = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
          }) =>
              SearchHistoryCompanion(
            id: id,
            query: query,
            filter: filter,
            searchedAt: searchedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String query,
            required String filter,
            Value<DateTime> searchedAt = const Value.absent(),
          }) =>
              SearchHistoryCompanion.insert(
            id: id,
            query: query,
            filter: filter,
            searchedAt: searchedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SearchHistoryTable,
    SearchHistoryEntity,
    $$SearchHistoryTableFilterComposer,
    $$SearchHistoryTableOrderingComposer,
    $$SearchHistoryTableAnnotationComposer,
    $$SearchHistoryTableCreateCompanionBuilder,
    $$SearchHistoryTableUpdateCompanionBuilder,
    (
      SearchHistoryEntity,
      BaseReferences<_$AppDatabase, $SearchHistoryTable, SearchHistoryEntity>
    ),
    SearchHistoryEntity,
    PrefetchHooks Function()>;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required dynamic value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<dynamic> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<dynamic, dynamic, String> get value =>
      $composableBuilder(
          column: $table.value,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumnWithTypeConverter<dynamic, String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    SettingsEntity,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (
      SettingsEntity,
      BaseReferences<_$AppDatabase, $SettingsTable, SettingsEntity>
    ),
    SettingsEntity,
    PrefetchHooks Function()> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<dynamic> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required dynamic value,
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    SettingsEntity,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (
      SettingsEntity,
      BaseReferences<_$AppDatabase, $SettingsTable, SettingsEntity>
    ),
    SettingsEntity,
    PrefetchHooks Function()>;
typedef $$DownloadsTableCreateCompanionBuilder = DownloadsCompanion Function({
  required String id,
  required String trackId,
  required String filePath,
  required int totalBytes,
  required int downloadedBytes,
  Value<String> status,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<String?> error,
  Value<int> rowid,
});
typedef $$DownloadsTableUpdateCompanionBuilder = DownloadsCompanion Function({
  Value<String> id,
  Value<String> trackId,
  Value<String> filePath,
  Value<int> totalBytes,
  Value<int> downloadedBytes,
  Value<String> status,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<String?> error,
  Value<int> rowid,
});

final class $$DownloadsTableReferences
    extends BaseReferences<_$AppDatabase, $DownloadsTable, DownloadEntity> {
  $$DownloadsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TracksTable _trackIdTable(_$AppDatabase db) => db.tracks
      .createAlias($_aliasNameGenerator(db.downloads.trackId, db.tracks.id));

  $$TracksTableProcessedTableManager get trackId {
    final manager = $$TracksTableTableManager($_db, $_db.tracks)
        .filter((f) => f.id($_item.trackId));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DownloadsTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalBytes => $composableBuilder(
      column: $table.totalBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get downloadedBytes => $composableBuilder(
      column: $table.downloadedBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get error => $composableBuilder(
      column: $table.error, builder: (column) => ColumnFilters(column));

  $$TracksTableFilterComposer get trackId {
    final $$TracksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableFilterComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DownloadsTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalBytes => $composableBuilder(
      column: $table.totalBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get downloadedBytes => $composableBuilder(
      column: $table.downloadedBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get error => $composableBuilder(
      column: $table.error, builder: (column) => ColumnOrderings(column));

  $$TracksTableOrderingComposer get trackId {
    final $$TracksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableOrderingComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DownloadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<int> get totalBytes => $composableBuilder(
      column: $table.totalBytes, builder: (column) => column);

  GeneratedColumn<int> get downloadedBytes => $composableBuilder(
      column: $table.downloadedBytes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  $$TracksTableAnnotationComposer get trackId {
    final $$TracksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.tracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TracksTableAnnotationComposer(
              $db: $db,
              $table: $db.tracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DownloadsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DownloadsTable,
    DownloadEntity,
    $$DownloadsTableFilterComposer,
    $$DownloadsTableOrderingComposer,
    $$DownloadsTableAnnotationComposer,
    $$DownloadsTableCreateCompanionBuilder,
    $$DownloadsTableUpdateCompanionBuilder,
    (DownloadEntity, $$DownloadsTableReferences),
    DownloadEntity,
    PrefetchHooks Function({bool trackId})> {
  $$DownloadsTableTableManager(_$AppDatabase db, $DownloadsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> trackId = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<int> totalBytes = const Value.absent(),
            Value<int> downloadedBytes = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<String?> error = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DownloadsCompanion(
            id: id,
            trackId: trackId,
            filePath: filePath,
            totalBytes: totalBytes,
            downloadedBytes: downloadedBytes,
            status: status,
            startedAt: startedAt,
            completedAt: completedAt,
            error: error,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String trackId,
            required String filePath,
            required int totalBytes,
            required int downloadedBytes,
            Value<String> status = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<String?> error = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DownloadsCompanion.insert(
            id: id,
            trackId: trackId,
            filePath: filePath,
            totalBytes: totalBytes,
            downloadedBytes: downloadedBytes,
            status: status,
            startedAt: startedAt,
            completedAt: completedAt,
            error: error,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DownloadsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({trackId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (trackId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.trackId,
                    referencedTable:
                        $$DownloadsTableReferences._trackIdTable(db),
                    referencedColumn:
                        $$DownloadsTableReferences._trackIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DownloadsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DownloadsTable,
    DownloadEntity,
    $$DownloadsTableFilterComposer,
    $$DownloadsTableOrderingComposer,
    $$DownloadsTableAnnotationComposer,
    $$DownloadsTableCreateCompanionBuilder,
    $$DownloadsTableUpdateCompanionBuilder,
    (DownloadEntity, $$DownloadsTableReferences),
    DownloadEntity,
    PrefetchHooks Function({bool trackId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TracksTableTableManager get tracks =>
      $$TracksTableTableManager(_db, _db.tracks);
  $$PlaylistsTableTableManager get playlists =>
      $$PlaylistsTableTableManager(_db, _db.playlists);
  $$PlaylistTracksTableTableManager get playlistTracks =>
      $$PlaylistTracksTableTableManager(_db, _db.playlistTracks);
  $$ArtistsTableTableManager get artists =>
      $$ArtistsTableTableManager(_db, _db.artists);
  $$AlbumsTableTableManager get albums =>
      $$AlbumsTableTableManager(_db, _db.albums);
  $$HistoryTableTableManager get history =>
      $$HistoryTableTableManager(_db, _db.history);
  $$LyricsCacheTableTableManager get lyricsCache =>
      $$LyricsCacheTableTableManager(_db, _db.lyricsCache);
  $$SearchHistoryTableTableManager get searchHistory =>
      $$SearchHistoryTableTableManager(_db, _db.searchHistory);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$DownloadsTableTableManager get downloads =>
      $$DownloadsTableTableManager(_db, _db.downloads);
}
