// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get artistId => throw _privateConstructorUsedError;
  String? get album => throw _privateConstructorUsedError;
  String? get albumId => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;
  String? get audioStreamUrl => throw _privateConstructorUsedError;
  int? get itag => throw _privateConstructorUsedError;
  int? get bitrate => throw _privateConstructorUsedError;
  String? get lyricsId => throw _privateConstructorUsedError;
  bool? get isExplicit => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  List<String> get availableCountries => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String artistId,
      String? album,
      String? albumId,
      int duration,
      String artworkUrl,
      String? audioStreamUrl,
      int? itag,
      int? bitrate,
      String? lyricsId,
      bool? isExplicit,
      bool isAvailable,
      List<String> availableCountries,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? artistId = null,
    Object? album = freezed,
    Object? albumId = freezed,
    Object? duration = null,
    Object? artworkUrl = null,
    Object? audioStreamUrl = freezed,
    Object? itag = freezed,
    Object? bitrate = freezed,
    Object? lyricsId = freezed,
    Object? isExplicit = freezed,
    Object? isAvailable = null,
    Object? availableCountries = null,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String?,
      albumId: freezed == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      audioStreamUrl: freezed == audioStreamUrl
          ? _value.audioStreamUrl
          : audioStreamUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      itag: freezed == itag
          ? _value.itag
          : itag // ignore: cast_nullable_to_non_nullable
              as int?,
      bitrate: freezed == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int?,
      lyricsId: freezed == lyricsId
          ? _value.lyricsId
          : lyricsId // ignore: cast_nullable_to_non_nullable
              as String?,
      isExplicit: freezed == isExplicit
          ? _value.isExplicit
          : isExplicit // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      availableCountries: null == availableCountries
          ? _value.availableCountries
          : availableCountries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackImplCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$TrackImplCopyWith(
          _$TrackImpl value, $Res Function(_$TrackImpl) then) =
      __$$TrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String artistId,
      String? album,
      String? albumId,
      int duration,
      String artworkUrl,
      String? audioStreamUrl,
      int? itag,
      int? bitrate,
      String? lyricsId,
      bool? isExplicit,
      bool isAvailable,
      List<String> availableCountries,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$TrackImplCopyWithImpl<$Res>
    extends _$TrackCopyWithImpl<$Res, _$TrackImpl>
    implements _$$TrackImplCopyWith<$Res> {
  __$$TrackImplCopyWithImpl(
      _$TrackImpl _value, $Res Function(_$TrackImpl) _then)
      : super(_value, _then);

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? artistId = null,
    Object? album = freezed,
    Object? albumId = freezed,
    Object? duration = null,
    Object? artworkUrl = null,
    Object? audioStreamUrl = freezed,
    Object? itag = freezed,
    Object? bitrate = freezed,
    Object? lyricsId = freezed,
    Object? isExplicit = freezed,
    Object? isAvailable = null,
    Object? availableCountries = null,
    Object? rawData = freezed,
  }) {
    return _then(_$TrackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      album: freezed == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as String?,
      albumId: freezed == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      audioStreamUrl: freezed == audioStreamUrl
          ? _value.audioStreamUrl
          : audioStreamUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      itag: freezed == itag
          ? _value.itag
          : itag // ignore: cast_nullable_to_non_nullable
              as int?,
      bitrate: freezed == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int?,
      lyricsId: freezed == lyricsId
          ? _value.lyricsId
          : lyricsId // ignore: cast_nullable_to_non_nullable
              as String?,
      isExplicit: freezed == isExplicit
          ? _value.isExplicit
          : isExplicit // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      availableCountries: null == availableCountries
          ? _value._availableCountries
          : availableCountries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl implements _Track {
  const _$TrackImpl(
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
      this.isExplicit,
      this.isAvailable = false,
      final List<String> availableCountries = const [],
      final Map<String, dynamic>? rawData})
      : _availableCountries = availableCountries,
        _rawData = rawData;

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String artist;
  @override
  final String artistId;
  @override
  final String? album;
  @override
  final String? albumId;
  @override
  final int duration;
  @override
  final String artworkUrl;
  @override
  final String? audioStreamUrl;
  @override
  final int? itag;
  @override
  final int? bitrate;
  @override
  final String? lyricsId;
  @override
  final bool? isExplicit;
  @override
  @JsonKey()
  final bool isAvailable;
  final List<String> _availableCountries;
  @override
  @JsonKey()
  List<String> get availableCountries {
    if (_availableCountries is EqualUnmodifiableListView)
      return _availableCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCountries);
  }

  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Track(id: $id, title: $title, artist: $artist, artistId: $artistId, album: $album, albumId: $albumId, duration: $duration, artworkUrl: $artworkUrl, audioStreamUrl: $audioStreamUrl, itag: $itag, bitrate: $bitrate, lyricsId: $lyricsId, isExplicit: $isExplicit, isAvailable: $isAvailable, availableCountries: $availableCountries, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl) &&
            (identical(other.audioStreamUrl, audioStreamUrl) ||
                other.audioStreamUrl == audioStreamUrl) &&
            (identical(other.itag, itag) || other.itag == itag) &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.lyricsId, lyricsId) ||
                other.lyricsId == lyricsId) &&
            (identical(other.isExplicit, isExplicit) ||
                other.isExplicit == isExplicit) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality()
                .equals(other._availableCountries, _availableCountries) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      const DeepCollectionEquality().hash(_availableCountries),
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      __$$TrackImplCopyWithImpl<_$TrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackImplToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track(
      {required final String id,
      required final String title,
      required final String artist,
      required final String artistId,
      final String? album,
      final String? albumId,
      required final int duration,
      required final String artworkUrl,
      final String? audioStreamUrl,
      final int? itag,
      final int? bitrate,
      final String? lyricsId,
      final bool? isExplicit,
      final bool isAvailable,
      final List<String> availableCountries,
      final Map<String, dynamic>? rawData}) = _$TrackImpl;

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get artist;
  @override
  String get artistId;
  @override
  String? get album;
  @override
  String? get albumId;
  @override
  int get duration;
  @override
  String get artworkUrl;
  @override
  String? get audioStreamUrl;
  @override
  int? get itag;
  @override
  int? get bitrate;
  @override
  String? get lyricsId;
  @override
  bool? get isExplicit;
  @override
  bool get isAvailable;
  @override
  List<String> get availableCountries;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return _Playlist.fromJson(json);
}

/// @nodoc
mixin _$Playlist {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;
  int get trackCount => throw _privateConstructorUsedError;
  List<Track> get tracks => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get authorId => throw _privateConstructorUsedError;
  bool? get isPublic => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this Playlist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistCopyWith<Playlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) then) =
      _$PlaylistCopyWithImpl<$Res, Playlist>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String artworkUrl,
      int trackCount,
      List<Track> tracks,
      String? author,
      String? authorId,
      bool? isPublic,
      DateTime? createdAt,
      DateTime? updatedAt,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res, $Val extends Playlist>
    implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? artworkUrl = null,
    Object? trackCount = null,
    Object? tracks = null,
    Object? author = freezed,
    Object? authorId = freezed,
    Object? isPublic = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      trackCount: null == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistImplCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$$PlaylistImplCopyWith(
          _$PlaylistImpl value, $Res Function(_$PlaylistImpl) then) =
      __$$PlaylistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String artworkUrl,
      int trackCount,
      List<Track> tracks,
      String? author,
      String? authorId,
      bool? isPublic,
      DateTime? createdAt,
      DateTime? updatedAt,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$PlaylistImplCopyWithImpl<$Res>
    extends _$PlaylistCopyWithImpl<$Res, _$PlaylistImpl>
    implements _$$PlaylistImplCopyWith<$Res> {
  __$$PlaylistImplCopyWithImpl(
      _$PlaylistImpl _value, $Res Function(_$PlaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? artworkUrl = null,
    Object? trackCount = null,
    Object? tracks = null,
    Object? author = freezed,
    Object? authorId = freezed,
    Object? isPublic = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_$PlaylistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      trackCount: null == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublic: freezed == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistImpl implements _Playlist {
  const _$PlaylistImpl(
      {required this.id,
      required this.title,
      this.description,
      required this.artworkUrl,
      required this.trackCount,
      final List<Track> tracks = const [],
      this.author,
      this.authorId,
      this.isPublic,
      this.createdAt,
      this.updatedAt,
      final Map<String, dynamic>? rawData})
      : _tracks = tracks,
        _rawData = rawData;

  factory _$PlaylistImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String artworkUrl;
  @override
  final int trackCount;
  final List<Track> _tracks;
  @override
  @JsonKey()
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  final String? author;
  @override
  final String? authorId;
  @override
  final bool? isPublic;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Playlist(id: $id, title: $title, description: $description, artworkUrl: $artworkUrl, trackCount: $trackCount, tracks: $tracks, author: $author, authorId: $authorId, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl) &&
            (identical(other.trackCount, trackCount) ||
                other.trackCount == trackCount) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      artworkUrl,
      trackCount,
      const DeepCollectionEquality().hash(_tracks),
      author,
      authorId,
      isPublic,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      __$$PlaylistImplCopyWithImpl<_$PlaylistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistImplToJson(
      this,
    );
  }
}

abstract class _Playlist implements Playlist {
  const factory _Playlist(
      {required final String id,
      required final String title,
      final String? description,
      required final String artworkUrl,
      required final int trackCount,
      final List<Track> tracks,
      final String? author,
      final String? authorId,
      final bool? isPublic,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final Map<String, dynamic>? rawData}) = _$PlaylistImpl;

  factory _Playlist.fromJson(Map<String, dynamic> json) =
      _$PlaylistImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get artworkUrl;
  @override
  int get trackCount;
  @override
  List<Track> get tracks;
  @override
  String? get author;
  @override
  String? get authorId;
  @override
  bool? get isPublic;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get subscriberCount => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  List<Album> get albums => throw _privateConstructorUsedError;
  List<Track> get topTracks => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call(
      {String id,
      String name,
      String artworkUrl,
      String? description,
      int? subscriberCount,
      List<String> genres,
      List<Album> albums,
      List<Track> topTracks,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res, $Val extends Artist>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artworkUrl = null,
    Object? description = freezed,
    Object? subscriberCount = freezed,
    Object? genres = null,
    Object? albums = null,
    Object? topTracks = null,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      topTracks: null == topTracks
          ? _value.topTracks
          : topTracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistImplCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$ArtistImplCopyWith(
          _$ArtistImpl value, $Res Function(_$ArtistImpl) then) =
      __$$ArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String artworkUrl,
      String? description,
      int? subscriberCount,
      List<String> genres,
      List<Album> albums,
      List<Track> topTracks,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$ArtistImplCopyWithImpl<$Res>
    extends _$ArtistCopyWithImpl<$Res, _$ArtistImpl>
    implements _$$ArtistImplCopyWith<$Res> {
  __$$ArtistImplCopyWithImpl(
      _$ArtistImpl _value, $Res Function(_$ArtistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artworkUrl = null,
    Object? description = freezed,
    Object? subscriberCount = freezed,
    Object? genres = null,
    Object? albums = null,
    Object? topTracks = null,
    Object? rawData = freezed,
  }) {
    return _then(_$ArtistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriberCount: freezed == subscriberCount
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      topTracks: null == topTracks
          ? _value._topTracks
          : topTracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistImpl implements _Artist {
  const _$ArtistImpl(
      {required this.id,
      required this.name,
      required this.artworkUrl,
      this.description,
      this.subscriberCount,
      final List<String> genres = const [],
      final List<Album> albums = const [],
      final List<Track> topTracks = const [],
      final Map<String, dynamic>? rawData})
      : _genres = genres,
        _albums = albums,
        _topTracks = topTracks,
        _rawData = rawData;

  factory _$ArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String artworkUrl;
  @override
  final String? description;
  @override
  final int? subscriberCount;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<Album> _albums;
  @override
  @JsonKey()
  List<Album> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  final List<Track> _topTracks;
  @override
  @JsonKey()
  List<Track> get topTracks {
    if (_topTracks is EqualUnmodifiableListView) return _topTracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topTracks);
  }

  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, artworkUrl: $artworkUrl, description: $description, subscriberCount: $subscriberCount, genres: $genres, albums: $albums, topTracks: $topTracks, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subscriberCount, subscriberCount) ||
                other.subscriberCount == subscriberCount) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            const DeepCollectionEquality()
                .equals(other._topTracks, _topTracks) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      artworkUrl,
      description,
      subscriberCount,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_albums),
      const DeepCollectionEquality().hash(_topTracks),
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      __$$ArtistImplCopyWithImpl<_$ArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistImplToJson(
      this,
    );
  }
}

abstract class _Artist implements Artist {
  const factory _Artist(
      {required final String id,
      required final String name,
      required final String artworkUrl,
      final String? description,
      final int? subscriberCount,
      final List<String> genres,
      final List<Album> albums,
      final List<Track> topTracks,
      final Map<String, dynamic>? rawData}) = _$ArtistImpl;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$ArtistImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get artworkUrl;
  @override
  String? get description;
  @override
  int? get subscriberCount;
  @override
  List<String> get genres;
  @override
  List<Album> get albums;
  @override
  List<Track> get topTracks;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get artistId => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get trackCount => throw _privateConstructorUsedError;
  List<Track> get tracks => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this Album to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String artistId,
      String artworkUrl,
      int year,
      int trackCount,
      List<Track> tracks,
      String? description,
      List<String> genres,
      DateTime? releaseDate,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? artistId = null,
    Object? artworkUrl = null,
    Object? year = null,
    Object? trackCount = null,
    Object? tracks = null,
    Object? description = freezed,
    Object? genres = null,
    Object? releaseDate = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      trackCount: null == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumImplCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$AlbumImplCopyWith(
          _$AlbumImpl value, $Res Function(_$AlbumImpl) then) =
      __$$AlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String artist,
      String artistId,
      String artworkUrl,
      int year,
      int trackCount,
      List<Track> tracks,
      String? description,
      List<String> genres,
      DateTime? releaseDate,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$AlbumImplCopyWithImpl<$Res>
    extends _$AlbumCopyWithImpl<$Res, _$AlbumImpl>
    implements _$$AlbumImplCopyWith<$Res> {
  __$$AlbumImplCopyWithImpl(
      _$AlbumImpl _value, $Res Function(_$AlbumImpl) _then)
      : super(_value, _then);

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = null,
    Object? artistId = null,
    Object? artworkUrl = null,
    Object? year = null,
    Object? trackCount = null,
    Object? tracks = null,
    Object? description = freezed,
    Object? genres = null,
    Object? releaseDate = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_$AlbumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      trackCount: null == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumImpl implements _Album {
  const _$AlbumImpl(
      {required this.id,
      required this.title,
      required this.artist,
      required this.artistId,
      required this.artworkUrl,
      required this.year,
      required this.trackCount,
      final List<Track> tracks = const [],
      this.description,
      final List<String> genres = const [],
      this.releaseDate,
      final Map<String, dynamic>? rawData})
      : _tracks = tracks,
        _genres = genres,
        _rawData = rawData;

  factory _$AlbumImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String artist;
  @override
  final String artistId;
  @override
  final String artworkUrl;
  @override
  final int year;
  @override
  final int trackCount;
  final List<Track> _tracks;
  @override
  @JsonKey()
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  final String? description;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final DateTime? releaseDate;
  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Album(id: $id, title: $title, artist: $artist, artistId: $artistId, artworkUrl: $artworkUrl, year: $year, trackCount: $trackCount, tracks: $tracks, description: $description, genres: $genres, releaseDate: $releaseDate, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.trackCount, trackCount) ||
                other.trackCount == trackCount) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      artist,
      artistId,
      artworkUrl,
      year,
      trackCount,
      const DeepCollectionEquality().hash(_tracks),
      description,
      const DeepCollectionEquality().hash(_genres),
      releaseDate,
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      __$$AlbumImplCopyWithImpl<_$AlbumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumImplToJson(
      this,
    );
  }
}

abstract class _Album implements Album {
  const factory _Album(
      {required final String id,
      required final String title,
      required final String artist,
      required final String artistId,
      required final String artworkUrl,
      required final int year,
      required final int trackCount,
      final List<Track> tracks,
      final String? description,
      final List<String> genres,
      final DateTime? releaseDate,
      final Map<String, dynamic>? rawData}) = _$AlbumImpl;

  factory _Album.fromJson(Map<String, dynamic> json) = _$AlbumImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get artist;
  @override
  String get artistId;
  @override
  String get artworkUrl;
  @override
  int get year;
  @override
  int get trackCount;
  @override
  List<Track> get tracks;
  @override
  String? get description;
  @override
  List<String> get genres;
  @override
  DateTime? get releaseDate;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueueState _$QueueStateFromJson(Map<String, dynamic> json) {
  return _QueueState.fromJson(json);
}

/// @nodoc
mixin _$QueueState {
  Track get currentTrack => throw _privateConstructorUsedError;
  List<Track> get queueList => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  bool get isRadioActive => throw _privateConstructorUsedError;
  String? get continuationToken => throw _privateConstructorUsedError;
  PlaybackMode get mode => throw _privateConstructorUsedError;
  double get currentPosition => throw _privateConstructorUsedError;
  Duration get bufferedPosition => throw _privateConstructorUsedError;

  /// Serializes this QueueState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueStateCopyWith<QueueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueStateCopyWith<$Res> {
  factory $QueueStateCopyWith(
          QueueState value, $Res Function(QueueState) then) =
      _$QueueStateCopyWithImpl<$Res, QueueState>;
  @useResult
  $Res call(
      {Track currentTrack,
      List<Track> queueList,
      int index,
      bool isRadioActive,
      String? continuationToken,
      PlaybackMode mode,
      double currentPosition,
      Duration bufferedPosition});

  $TrackCopyWith<$Res> get currentTrack;
}

/// @nodoc
class _$QueueStateCopyWithImpl<$Res, $Val extends QueueState>
    implements $QueueStateCopyWith<$Res> {
  _$QueueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrack = null,
    Object? queueList = null,
    Object? index = null,
    Object? isRadioActive = null,
    Object? continuationToken = freezed,
    Object? mode = null,
    Object? currentPosition = null,
    Object? bufferedPosition = null,
  }) {
    return _then(_value.copyWith(
      currentTrack: null == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as Track,
      queueList: null == queueList
          ? _value.queueList
          : queueList // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isRadioActive: null == isRadioActive
          ? _value.isRadioActive
          : isRadioActive // ignore: cast_nullable_to_non_nullable
              as bool,
      continuationToken: freezed == continuationToken
          ? _value.continuationToken
          : continuationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PlaybackMode,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as double,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrackCopyWith<$Res> get currentTrack {
    return $TrackCopyWith<$Res>(_value.currentTrack, (value) {
      return _then(_value.copyWith(currentTrack: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QueueStateImplCopyWith<$Res>
    implements $QueueStateCopyWith<$Res> {
  factory _$$QueueStateImplCopyWith(
          _$QueueStateImpl value, $Res Function(_$QueueStateImpl) then) =
      __$$QueueStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Track currentTrack,
      List<Track> queueList,
      int index,
      bool isRadioActive,
      String? continuationToken,
      PlaybackMode mode,
      double currentPosition,
      Duration bufferedPosition});

  @override
  $TrackCopyWith<$Res> get currentTrack;
}

/// @nodoc
class __$$QueueStateImplCopyWithImpl<$Res>
    extends _$QueueStateCopyWithImpl<$Res, _$QueueStateImpl>
    implements _$$QueueStateImplCopyWith<$Res> {
  __$$QueueStateImplCopyWithImpl(
      _$QueueStateImpl _value, $Res Function(_$QueueStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrack = null,
    Object? queueList = null,
    Object? index = null,
    Object? isRadioActive = null,
    Object? continuationToken = freezed,
    Object? mode = null,
    Object? currentPosition = null,
    Object? bufferedPosition = null,
  }) {
    return _then(_$QueueStateImpl(
      currentTrack: null == currentTrack
          ? _value.currentTrack
          : currentTrack // ignore: cast_nullable_to_non_nullable
              as Track,
      queueList: null == queueList
          ? _value._queueList
          : queueList // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isRadioActive: null == isRadioActive
          ? _value.isRadioActive
          : isRadioActive // ignore: cast_nullable_to_non_nullable
              as bool,
      continuationToken: freezed == continuationToken
          ? _value.continuationToken
          : continuationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PlaybackMode,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as double,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueStateImpl implements _QueueState {
  const _$QueueStateImpl(
      {required this.currentTrack,
      final List<Track> queueList = const [],
      this.index = 0,
      this.isRadioActive = false,
      this.continuationToken,
      this.mode = PlaybackMode.sequential,
      this.currentPosition = 0.0,
      this.bufferedPosition = Duration.zero})
      : _queueList = queueList;

  factory _$QueueStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueStateImplFromJson(json);

  @override
  final Track currentTrack;
  final List<Track> _queueList;
  @override
  @JsonKey()
  List<Track> get queueList {
    if (_queueList is EqualUnmodifiableListView) return _queueList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queueList);
  }

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final bool isRadioActive;
  @override
  final String? continuationToken;
  @override
  @JsonKey()
  final PlaybackMode mode;
  @override
  @JsonKey()
  final double currentPosition;
  @override
  @JsonKey()
  final Duration bufferedPosition;

  @override
  String toString() {
    return 'QueueState(currentTrack: $currentTrack, queueList: $queueList, index: $index, isRadioActive: $isRadioActive, continuationToken: $continuationToken, mode: $mode, currentPosition: $currentPosition, bufferedPosition: $bufferedPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueStateImpl &&
            (identical(other.currentTrack, currentTrack) ||
                other.currentTrack == currentTrack) &&
            const DeepCollectionEquality()
                .equals(other._queueList, _queueList) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isRadioActive, isRadioActive) ||
                other.isRadioActive == isRadioActive) &&
            (identical(other.continuationToken, continuationToken) ||
                other.continuationToken == continuationToken) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.bufferedPosition, bufferedPosition) ||
                other.bufferedPosition == bufferedPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTrack,
      const DeepCollectionEquality().hash(_queueList),
      index,
      isRadioActive,
      continuationToken,
      mode,
      currentPosition,
      bufferedPosition);

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueStateImplCopyWith<_$QueueStateImpl> get copyWith =>
      __$$QueueStateImplCopyWithImpl<_$QueueStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueStateImplToJson(
      this,
    );
  }
}

abstract class _QueueState implements QueueState {
  const factory _QueueState(
      {required final Track currentTrack,
      final List<Track> queueList,
      final int index,
      final bool isRadioActive,
      final String? continuationToken,
      final PlaybackMode mode,
      final double currentPosition,
      final Duration bufferedPosition}) = _$QueueStateImpl;

  factory _QueueState.fromJson(Map<String, dynamic> json) =
      _$QueueStateImpl.fromJson;

  @override
  Track get currentTrack;
  @override
  List<Track> get queueList;
  @override
  int get index;
  @override
  bool get isRadioActive;
  @override
  String? get continuationToken;
  @override
  PlaybackMode get mode;
  @override
  double get currentPosition;
  @override
  Duration get bufferedPosition;

  /// Create a copy of QueueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueStateImplCopyWith<_$QueueStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lyrics _$LyricsFromJson(Map<String, dynamic> json) {
  return _Lyrics.fromJson(json);
}

/// @nodoc
mixin _$Lyrics {
  String get trackId => throw _privateConstructorUsedError;
  LyricsSource get source => throw _privateConstructorUsedError;
  List<LyricsLine> get lines => throw _privateConstructorUsedError;
  bool? get hasSynced => throw _privateConstructorUsedError;
  String? get rawLrc => throw _privateConstructorUsedError;

  /// Serializes this Lyrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lyrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricsCopyWith<Lyrics> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsCopyWith<$Res> {
  factory $LyricsCopyWith(Lyrics value, $Res Function(Lyrics) then) =
      _$LyricsCopyWithImpl<$Res, Lyrics>;
  @useResult
  $Res call(
      {String trackId,
      LyricsSource source,
      List<LyricsLine> lines,
      bool? hasSynced,
      String? rawLrc});
}

/// @nodoc
class _$LyricsCopyWithImpl<$Res, $Val extends Lyrics>
    implements $LyricsCopyWith<$Res> {
  _$LyricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lyrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackId = null,
    Object? source = null,
    Object? lines = null,
    Object? hasSynced = freezed,
    Object? rawLrc = freezed,
  }) {
    return _then(_value.copyWith(
      trackId: null == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as LyricsSource,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<LyricsLine>,
      hasSynced: freezed == hasSynced
          ? _value.hasSynced
          : hasSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      rawLrc: freezed == rawLrc
          ? _value.rawLrc
          : rawLrc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricsImplCopyWith<$Res> implements $LyricsCopyWith<$Res> {
  factory _$$LyricsImplCopyWith(
          _$LyricsImpl value, $Res Function(_$LyricsImpl) then) =
      __$$LyricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String trackId,
      LyricsSource source,
      List<LyricsLine> lines,
      bool? hasSynced,
      String? rawLrc});
}

/// @nodoc
class __$$LyricsImplCopyWithImpl<$Res>
    extends _$LyricsCopyWithImpl<$Res, _$LyricsImpl>
    implements _$$LyricsImplCopyWith<$Res> {
  __$$LyricsImplCopyWithImpl(
      _$LyricsImpl _value, $Res Function(_$LyricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lyrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackId = null,
    Object? source = null,
    Object? lines = null,
    Object? hasSynced = freezed,
    Object? rawLrc = freezed,
  }) {
    return _then(_$LyricsImpl(
      trackId: null == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as LyricsSource,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<LyricsLine>,
      hasSynced: freezed == hasSynced
          ? _value.hasSynced
          : hasSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      rawLrc: freezed == rawLrc
          ? _value.rawLrc
          : rawLrc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricsImpl implements _Lyrics {
  const _$LyricsImpl(
      {required this.trackId,
      required this.source,
      final List<LyricsLine> lines = const [],
      this.hasSynced,
      this.rawLrc})
      : _lines = lines;

  factory _$LyricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricsImplFromJson(json);

  @override
  final String trackId;
  @override
  final LyricsSource source;
  final List<LyricsLine> _lines;
  @override
  @JsonKey()
  List<LyricsLine> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  final bool? hasSynced;
  @override
  final String? rawLrc;

  @override
  String toString() {
    return 'Lyrics(trackId: $trackId, source: $source, lines: $lines, hasSynced: $hasSynced, rawLrc: $rawLrc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricsImpl &&
            (identical(other.trackId, trackId) || other.trackId == trackId) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.hasSynced, hasSynced) ||
                other.hasSynced == hasSynced) &&
            (identical(other.rawLrc, rawLrc) || other.rawLrc == rawLrc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, trackId, source,
      const DeepCollectionEquality().hash(_lines), hasSynced, rawLrc);

  /// Create a copy of Lyrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricsImplCopyWith<_$LyricsImpl> get copyWith =>
      __$$LyricsImplCopyWithImpl<_$LyricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricsImplToJson(
      this,
    );
  }
}

abstract class _Lyrics implements Lyrics {
  const factory _Lyrics(
      {required final String trackId,
      required final LyricsSource source,
      final List<LyricsLine> lines,
      final bool? hasSynced,
      final String? rawLrc}) = _$LyricsImpl;

  factory _Lyrics.fromJson(Map<String, dynamic> json) = _$LyricsImpl.fromJson;

  @override
  String get trackId;
  @override
  LyricsSource get source;
  @override
  List<LyricsLine> get lines;
  @override
  bool? get hasSynced;
  @override
  String? get rawLrc;

  /// Create a copy of Lyrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricsImplCopyWith<_$LyricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LyricsLine _$LyricsLineFromJson(Map<String, dynamic> json) {
  return _LyricsLine.fromJson(json);
}

/// @nodoc
mixin _$LyricsLine {
  Duration get time => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<WordTimestamp> get words => throw _privateConstructorUsedError;

  /// Serializes this LyricsLine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LyricsLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricsLineCopyWith<LyricsLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsLineCopyWith<$Res> {
  factory $LyricsLineCopyWith(
          LyricsLine value, $Res Function(LyricsLine) then) =
      _$LyricsLineCopyWithImpl<$Res, LyricsLine>;
  @useResult
  $Res call({Duration time, String text, List<WordTimestamp> words});
}

/// @nodoc
class _$LyricsLineCopyWithImpl<$Res, $Val extends LyricsLine>
    implements $LyricsLineCopyWith<$Res> {
  _$LyricsLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricsLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? text = null,
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<WordTimestamp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricsLineImplCopyWith<$Res>
    implements $LyricsLineCopyWith<$Res> {
  factory _$$LyricsLineImplCopyWith(
          _$LyricsLineImpl value, $Res Function(_$LyricsLineImpl) then) =
      __$$LyricsLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration time, String text, List<WordTimestamp> words});
}

/// @nodoc
class __$$LyricsLineImplCopyWithImpl<$Res>
    extends _$LyricsLineCopyWithImpl<$Res, _$LyricsLineImpl>
    implements _$$LyricsLineImplCopyWith<$Res> {
  __$$LyricsLineImplCopyWithImpl(
      _$LyricsLineImpl _value, $Res Function(_$LyricsLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? text = null,
    Object? words = null,
  }) {
    return _then(_$LyricsLineImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<WordTimestamp>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricsLineImpl implements _LyricsLine {
  const _$LyricsLineImpl(
      {required this.time,
      required this.text,
      final List<WordTimestamp> words = const []})
      : _words = words;

  factory _$LyricsLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricsLineImplFromJson(json);

  @override
  final Duration time;
  @override
  final String text;
  final List<WordTimestamp> _words;
  @override
  @JsonKey()
  List<WordTimestamp> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'LyricsLine(time: $time, text: $text, words: $words)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricsLineImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, time, text, const DeepCollectionEquality().hash(_words));

  /// Create a copy of LyricsLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricsLineImplCopyWith<_$LyricsLineImpl> get copyWith =>
      __$$LyricsLineImplCopyWithImpl<_$LyricsLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricsLineImplToJson(
      this,
    );
  }
}

abstract class _LyricsLine implements LyricsLine {
  const factory _LyricsLine(
      {required final Duration time,
      required final String text,
      final List<WordTimestamp> words}) = _$LyricsLineImpl;

  factory _LyricsLine.fromJson(Map<String, dynamic> json) =
      _$LyricsLineImpl.fromJson;

  @override
  Duration get time;
  @override
  String get text;
  @override
  List<WordTimestamp> get words;

  /// Create a copy of LyricsLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricsLineImplCopyWith<_$LyricsLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordTimestamp _$WordTimestampFromJson(Map<String, dynamic> json) {
  return _WordTimestamp.fromJson(json);
}

/// @nodoc
mixin _$WordTimestamp {
  Duration get start => throw _privateConstructorUsedError;
  Duration get end => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;

  /// Serializes this WordTimestamp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordTimestampCopyWith<WordTimestamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordTimestampCopyWith<$Res> {
  factory $WordTimestampCopyWith(
          WordTimestamp value, $Res Function(WordTimestamp) then) =
      _$WordTimestampCopyWithImpl<$Res, WordTimestamp>;
  @useResult
  $Res call({Duration start, Duration end, String word});
}

/// @nodoc
class _$WordTimestampCopyWithImpl<$Res, $Val extends WordTimestamp>
    implements $WordTimestampCopyWith<$Res> {
  _$WordTimestampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Duration,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Duration,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordTimestampImplCopyWith<$Res>
    implements $WordTimestampCopyWith<$Res> {
  factory _$$WordTimestampImplCopyWith(
          _$WordTimestampImpl value, $Res Function(_$WordTimestampImpl) then) =
      __$$WordTimestampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration start, Duration end, String word});
}

/// @nodoc
class __$$WordTimestampImplCopyWithImpl<$Res>
    extends _$WordTimestampCopyWithImpl<$Res, _$WordTimestampImpl>
    implements _$$WordTimestampImplCopyWith<$Res> {
  __$$WordTimestampImplCopyWithImpl(
      _$WordTimestampImpl _value, $Res Function(_$WordTimestampImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? word = null,
  }) {
    return _then(_$WordTimestampImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Duration,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Duration,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordTimestampImpl implements _WordTimestamp {
  const _$WordTimestampImpl(
      {required this.start, required this.end, required this.word});

  factory _$WordTimestampImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordTimestampImplFromJson(json);

  @override
  final Duration start;
  @override
  final Duration end;
  @override
  final String word;

  @override
  String toString() {
    return 'WordTimestamp(start: $start, end: $end, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordTimestampImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, word);

  /// Create a copy of WordTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordTimestampImplCopyWith<_$WordTimestampImpl> get copyWith =>
      __$$WordTimestampImplCopyWithImpl<_$WordTimestampImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordTimestampImplToJson(
      this,
    );
  }
}

abstract class _WordTimestamp implements WordTimestamp {
  const factory _WordTimestamp(
      {required final Duration start,
      required final Duration end,
      required final String word}) = _$WordTimestampImpl;

  factory _WordTimestamp.fromJson(Map<String, dynamic> json) =
      _$WordTimestampImpl.fromJson;

  @override
  Duration get start;
  @override
  Duration get end;
  @override
  String get word;

  /// Create a copy of WordTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordTimestampImplCopyWith<_$WordTimestampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  String get query => throw _privateConstructorUsedError;
  List<Track> get songs => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;
  List<Artist> get artists => throw _privateConstructorUsedError;
  List<Album> get albums => throw _privateConstructorUsedError;
  List<Video> get videos => throw _privateConstructorUsedError;
  String? get continuationToken => throw _privateConstructorUsedError;

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call(
      {String query,
      List<Track> songs,
      List<Playlist> playlists,
      List<Artist> artists,
      List<Album> albums,
      List<Video> videos,
      String? continuationToken});
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? songs = null,
    Object? playlists = null,
    Object? artists = null,
    Object? albums = null,
    Object? videos = null,
    Object? continuationToken = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      continuationToken: freezed == continuationToken
          ? _value.continuationToken
          : continuationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      List<Track> songs,
      List<Playlist> playlists,
      List<Artist> artists,
      List<Album> albums,
      List<Video> videos,
      String? continuationToken});
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? songs = null,
    Object? playlists = null,
    Object? artists = null,
    Object? albums = null,
    Object? videos = null,
    Object? continuationToken = freezed,
  }) {
    return _then(_$SearchResultImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      continuationToken: freezed == continuationToken
          ? _value.continuationToken
          : continuationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl(
      {required this.query,
      final List<Track> songs = const [],
      final List<Playlist> playlists = const [],
      final List<Artist> artists = const [],
      final List<Album> albums = const [],
      final List<Video> videos = const [],
      this.continuationToken})
      : _songs = songs,
        _playlists = playlists,
        _artists = artists,
        _albums = albums,
        _videos = videos;

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

  @override
  final String query;
  final List<Track> _songs;
  @override
  @JsonKey()
  List<Track> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  final List<Playlist> _playlists;
  @override
  @JsonKey()
  List<Playlist> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  final List<Artist> _artists;
  @override
  @JsonKey()
  List<Artist> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<Album> _albums;
  @override
  @JsonKey()
  List<Album> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  final List<Video> _videos;
  @override
  @JsonKey()
  List<Video> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  final String? continuationToken;

  @override
  String toString() {
    return 'SearchResult(query: $query, songs: $songs, playlists: $playlists, artists: $artists, albums: $albums, videos: $videos, continuationToken: $continuationToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.continuationToken, continuationToken) ||
                other.continuationToken == continuationToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_songs),
      const DeepCollectionEquality().hash(_playlists),
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_albums),
      const DeepCollectionEquality().hash(_videos),
      continuationToken);

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(
      this,
    );
  }
}

abstract class _SearchResult implements SearchResult {
  const factory _SearchResult(
      {required final String query,
      final List<Track> songs,
      final List<Playlist> playlists,
      final List<Artist> artists,
      final List<Album> albums,
      final List<Video> videos,
      final String? continuationToken}) = _$SearchResultImpl;

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override
  String get query;
  @override
  List<Track> get songs;
  @override
  List<Playlist> get playlists;
  @override
  List<Artist> get artists;
  @override
  List<Album> get albums;
  @override
  List<Video> get videos;
  @override
  String? get continuationToken;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Video _$VideoFromJson(Map<String, dynamic> json) {
  return _Video.fromJson(json);
}

/// @nodoc
mixin _$Video {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get channelTitle => throw _privateConstructorUsedError;
  String get channelId => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  bool? get isLive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this Video to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoCopyWith<Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) then) =
      _$VideoCopyWithImpl<$Res, Video>;
  @useResult
  $Res call(
      {String id,
      String title,
      String channelTitle,
      String channelId,
      int duration,
      String artworkUrl,
      int? viewCount,
      DateTime? publishedAt,
      bool? isLive,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$VideoCopyWithImpl<$Res, $Val extends Video>
    implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? channelTitle = null,
    Object? channelId = null,
    Object? duration = null,
    Object? artworkUrl = null,
    Object? viewCount = freezed,
    Object? publishedAt = freezed,
    Object? isLive = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      channelTitle: null == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoImplCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$$VideoImplCopyWith(
          _$VideoImpl value, $Res Function(_$VideoImpl) then) =
      __$$VideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String channelTitle,
      String channelId,
      int duration,
      String artworkUrl,
      int? viewCount,
      DateTime? publishedAt,
      bool? isLive,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$VideoImplCopyWithImpl<$Res>
    extends _$VideoCopyWithImpl<$Res, _$VideoImpl>
    implements _$$VideoImplCopyWith<$Res> {
  __$$VideoImplCopyWithImpl(
      _$VideoImpl _value, $Res Function(_$VideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? channelTitle = null,
    Object? channelId = null,
    Object? duration = null,
    Object? artworkUrl = null,
    Object? viewCount = freezed,
    Object? publishedAt = freezed,
    Object? isLive = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_$VideoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      channelTitle: null == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoImpl implements _Video {
  const _$VideoImpl(
      {required this.id,
      required this.title,
      required this.channelTitle,
      required this.channelId,
      required this.duration,
      required this.artworkUrl,
      this.viewCount,
      this.publishedAt,
      this.isLive,
      final Map<String, dynamic>? rawData})
      : _rawData = rawData;

  factory _$VideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String channelTitle;
  @override
  final String channelId;
  @override
  final int duration;
  @override
  final String artworkUrl;
  @override
  final int? viewCount;
  @override
  final DateTime? publishedAt;
  @override
  final bool? isLive;
  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Video(id: $id, title: $title, channelTitle: $channelTitle, channelId: $channelId, duration: $duration, artworkUrl: $artworkUrl, viewCount: $viewCount, publishedAt: $publishedAt, isLive: $isLive, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.channelTitle, channelTitle) ||
                other.channelTitle == channelTitle) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      channelTitle,
      channelId,
      duration,
      artworkUrl,
      viewCount,
      publishedAt,
      isLive,
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoImplCopyWith<_$VideoImpl> get copyWith =>
      __$$VideoImplCopyWithImpl<_$VideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoImplToJson(
      this,
    );
  }
}

abstract class _Video implements Video {
  const factory _Video(
      {required final String id,
      required final String title,
      required final String channelTitle,
      required final String channelId,
      required final int duration,
      required final String artworkUrl,
      final int? viewCount,
      final DateTime? publishedAt,
      final bool? isLive,
      final Map<String, dynamic>? rawData}) = _$VideoImpl;

  factory _Video.fromJson(Map<String, dynamic> json) = _$VideoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get channelTitle;
  @override
  String get channelId;
  @override
  int get duration;
  @override
  String get artworkUrl;
  @override
  int? get viewCount;
  @override
  DateTime? get publishedAt;
  @override
  bool? get isLive;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoImplCopyWith<_$VideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) {
  return _HomeSection.fromJson(json);
}

/// @nodoc
mixin _$HomeSection {
  String get title => throw _privateConstructorUsedError;
  HomeSectionType get type => throw _privateConstructorUsedError;
  List<dynamic> get items => throw _privateConstructorUsedError;
  String? get navigationEndpoint => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this HomeSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeSectionCopyWith<HomeSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSectionCopyWith<$Res> {
  factory $HomeSectionCopyWith(
          HomeSection value, $Res Function(HomeSection) then) =
      _$HomeSectionCopyWithImpl<$Res, HomeSection>;
  @useResult
  $Res call(
      {String title,
      HomeSectionType type,
      List<dynamic> items,
      String? navigationEndpoint,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$HomeSectionCopyWithImpl<$Res, $Val extends HomeSection>
    implements $HomeSectionCopyWith<$Res> {
  _$HomeSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? items = null,
    Object? navigationEndpoint = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeSectionType,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeSectionImplCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory _$$HomeSectionImplCopyWith(
          _$HomeSectionImpl value, $Res Function(_$HomeSectionImpl) then) =
      __$$HomeSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      HomeSectionType type,
      List<dynamic> items,
      String? navigationEndpoint,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$HomeSectionImplCopyWithImpl<$Res>
    extends _$HomeSectionCopyWithImpl<$Res, _$HomeSectionImpl>
    implements _$$HomeSectionImplCopyWith<$Res> {
  __$$HomeSectionImplCopyWithImpl(
      _$HomeSectionImpl _value, $Res Function(_$HomeSectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? items = null,
    Object? navigationEndpoint = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_$HomeSectionImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeSectionType,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      navigationEndpoint: freezed == navigationEndpoint
          ? _value.navigationEndpoint
          : navigationEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeSectionImpl implements _HomeSection {
  const _$HomeSectionImpl(
      {required this.title,
      required this.type,
      required final List<dynamic> items,
      this.navigationEndpoint,
      final Map<String, dynamic>? rawData})
      : _items = items,
        _rawData = rawData;

  factory _$HomeSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeSectionImplFromJson(json);

  @override
  final String title;
  @override
  final HomeSectionType type;
  final List<dynamic> _items;
  @override
  List<dynamic> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? navigationEndpoint;
  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'HomeSection(title: $title, type: $type, items: $items, navigationEndpoint: $navigationEndpoint, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSectionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.navigationEndpoint, navigationEndpoint) ||
                other.navigationEndpoint == navigationEndpoint) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      type,
      const DeepCollectionEquality().hash(_items),
      navigationEndpoint,
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSectionImplCopyWith<_$HomeSectionImpl> get copyWith =>
      __$$HomeSectionImplCopyWithImpl<_$HomeSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeSectionImplToJson(
      this,
    );
  }
}

abstract class _HomeSection implements HomeSection {
  const factory _HomeSection(
      {required final String title,
      required final HomeSectionType type,
      required final List<dynamic> items,
      final String? navigationEndpoint,
      final Map<String, dynamic>? rawData}) = _$HomeSectionImpl;

  factory _HomeSection.fromJson(Map<String, dynamic> json) =
      _$HomeSectionImpl.fromJson;

  @override
  String get title;
  @override
  HomeSectionType get type;
  @override
  List<dynamic> get items;
  @override
  String? get navigationEndpoint;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeSectionImplCopyWith<_$HomeSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MoodCategory _$MoodCategoryFromJson(Map<String, dynamic> json) {
  return _MoodCategory.fromJson(json);
}

/// @nodoc
mixin _$MoodCategory {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this MoodCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodCategoryCopyWith<MoodCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodCategoryCopyWith<$Res> {
  factory $MoodCategoryCopyWith(
          MoodCategory value, $Res Function(MoodCategory) then) =
      _$MoodCategoryCopyWithImpl<$Res, MoodCategory>;
  @useResult
  $Res call(
      {String id,
      String title,
      String artworkUrl,
      String? description,
      List<Playlist> playlists,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$MoodCategoryCopyWithImpl<$Res, $Val extends MoodCategory>
    implements $MoodCategoryCopyWith<$Res> {
  _$MoodCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artworkUrl = null,
    Object? description = freezed,
    Object? playlists = null,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodCategoryImplCopyWith<$Res>
    implements $MoodCategoryCopyWith<$Res> {
  factory _$$MoodCategoryImplCopyWith(
          _$MoodCategoryImpl value, $Res Function(_$MoodCategoryImpl) then) =
      __$$MoodCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String artworkUrl,
      String? description,
      List<Playlist> playlists,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$MoodCategoryImplCopyWithImpl<$Res>
    extends _$MoodCategoryCopyWithImpl<$Res, _$MoodCategoryImpl>
    implements _$$MoodCategoryImplCopyWith<$Res> {
  __$$MoodCategoryImplCopyWithImpl(
      _$MoodCategoryImpl _value, $Res Function(_$MoodCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artworkUrl = null,
    Object? description = freezed,
    Object? playlists = null,
    Object? rawData = freezed,
  }) {
    return _then(_$MoodCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoodCategoryImpl implements _MoodCategory {
  const _$MoodCategoryImpl(
      {required this.id,
      required this.title,
      required this.artworkUrl,
      this.description,
      final List<Playlist> playlists = const [],
      final Map<String, dynamic>? rawData})
      : _playlists = playlists,
        _rawData = rawData;

  factory _$MoodCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String artworkUrl;
  @override
  final String? description;
  final List<Playlist> _playlists;
  @override
  @JsonKey()
  List<Playlist> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MoodCategory(id: $id, title: $title, artworkUrl: $artworkUrl, description: $description, playlists: $playlists, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      artworkUrl,
      description,
      const DeepCollectionEquality().hash(_playlists),
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of MoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodCategoryImplCopyWith<_$MoodCategoryImpl> get copyWith =>
      __$$MoodCategoryImplCopyWithImpl<_$MoodCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodCategoryImplToJson(
      this,
    );
  }
}

abstract class _MoodCategory implements MoodCategory {
  const factory _MoodCategory(
      {required final String id,
      required final String title,
      required final String artworkUrl,
      final String? description,
      final List<Playlist> playlists,
      final Map<String, dynamic>? rawData}) = _$MoodCategoryImpl;

  factory _MoodCategory.fromJson(Map<String, dynamic> json) =
      _$MoodCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get artworkUrl;
  @override
  String? get description;
  @override
  List<Playlist> get playlists;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of MoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodCategoryImplCopyWith<_$MoodCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioStream _$AudioStreamFromJson(Map<String, dynamic> json) {
  return _AudioStream.fromJson(json);
}

/// @nodoc
mixin _$AudioStream {
  String get url => throw _privateConstructorUsedError;
  int get itag => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get bitrate => throw _privateConstructorUsedError;
  String get container => throw _privateConstructorUsedError;
  String get codec => throw _privateConstructorUsedError;
  String? get signature => throw _privateConstructorUsedError;
  String? get poToken => throw _privateConstructorUsedError;
  String? get cpn => throw _privateConstructorUsedError;
  bool get isEncrypted => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this AudioStream to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioStreamCopyWith<AudioStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStreamCopyWith<$Res> {
  factory $AudioStreamCopyWith(
          AudioStream value, $Res Function(AudioStream) then) =
      _$AudioStreamCopyWithImpl<$Res, AudioStream>;
  @useResult
  $Res call(
      {String url,
      int itag,
      String mimeType,
      int bitrate,
      String container,
      String codec,
      String? signature,
      String? poToken,
      String? cpn,
      bool isEncrypted,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$AudioStreamCopyWithImpl<$Res, $Val extends AudioStream>
    implements $AudioStreamCopyWith<$Res> {
  _$AudioStreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioStream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? itag = null,
    Object? mimeType = null,
    Object? bitrate = null,
    Object? container = null,
    Object? codec = null,
    Object? signature = freezed,
    Object? poToken = freezed,
    Object? cpn = freezed,
    Object? isEncrypted = null,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      itag: null == itag
          ? _value.itag
          : itag // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      container: null == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as String,
      codec: null == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      poToken: freezed == poToken
          ? _value.poToken
          : poToken // ignore: cast_nullable_to_non_nullable
              as String?,
      cpn: freezed == cpn
          ? _value.cpn
          : cpn // ignore: cast_nullable_to_non_nullable
              as String?,
      isEncrypted: null == isEncrypted
          ? _value.isEncrypted
          : isEncrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioStreamImplCopyWith<$Res>
    implements $AudioStreamCopyWith<$Res> {
  factory _$$AudioStreamImplCopyWith(
          _$AudioStreamImpl value, $Res Function(_$AudioStreamImpl) then) =
      __$$AudioStreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      int itag,
      String mimeType,
      int bitrate,
      String container,
      String codec,
      String? signature,
      String? poToken,
      String? cpn,
      bool isEncrypted,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$AudioStreamImplCopyWithImpl<$Res>
    extends _$AudioStreamCopyWithImpl<$Res, _$AudioStreamImpl>
    implements _$$AudioStreamImplCopyWith<$Res> {
  __$$AudioStreamImplCopyWithImpl(
      _$AudioStreamImpl _value, $Res Function(_$AudioStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioStream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? itag = null,
    Object? mimeType = null,
    Object? bitrate = null,
    Object? container = null,
    Object? codec = null,
    Object? signature = freezed,
    Object? poToken = freezed,
    Object? cpn = freezed,
    Object? isEncrypted = null,
    Object? rawData = freezed,
  }) {
    return _then(_$AudioStreamImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      itag: null == itag
          ? _value.itag
          : itag // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      container: null == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as String,
      codec: null == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      poToken: freezed == poToken
          ? _value.poToken
          : poToken // ignore: cast_nullable_to_non_nullable
              as String?,
      cpn: freezed == cpn
          ? _value.cpn
          : cpn // ignore: cast_nullable_to_non_nullable
              as String?,
      isEncrypted: null == isEncrypted
          ? _value.isEncrypted
          : isEncrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioStreamImpl implements _AudioStream {
  const _$AudioStreamImpl(
      {required this.url,
      required this.itag,
      required this.mimeType,
      required this.bitrate,
      required this.container,
      required this.codec,
      this.signature,
      this.poToken,
      this.cpn,
      this.isEncrypted = false,
      final Map<String, dynamic>? rawData})
      : _rawData = rawData;

  factory _$AudioStreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioStreamImplFromJson(json);

  @override
  final String url;
  @override
  final int itag;
  @override
  final String mimeType;
  @override
  final int bitrate;
  @override
  final String container;
  @override
  final String codec;
  @override
  final String? signature;
  @override
  final String? poToken;
  @override
  final String? cpn;
  @override
  @JsonKey()
  final bool isEncrypted;
  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AudioStream(url: $url, itag: $itag, mimeType: $mimeType, bitrate: $bitrate, container: $container, codec: $codec, signature: $signature, poToken: $poToken, cpn: $cpn, isEncrypted: $isEncrypted, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioStreamImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.itag, itag) || other.itag == itag) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.container, container) ||
                other.container == container) &&
            (identical(other.codec, codec) || other.codec == codec) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.poToken, poToken) || other.poToken == poToken) &&
            (identical(other.cpn, cpn) || other.cpn == cpn) &&
            (identical(other.isEncrypted, isEncrypted) ||
                other.isEncrypted == isEncrypted) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      itag,
      mimeType,
      bitrate,
      container,
      codec,
      signature,
      poToken,
      cpn,
      isEncrypted,
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of AudioStream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioStreamImplCopyWith<_$AudioStreamImpl> get copyWith =>
      __$$AudioStreamImplCopyWithImpl<_$AudioStreamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioStreamImplToJson(
      this,
    );
  }
}

abstract class _AudioStream implements AudioStream {
  const factory _AudioStream(
      {required final String url,
      required final int itag,
      required final String mimeType,
      required final int bitrate,
      required final String container,
      required final String codec,
      final String? signature,
      final String? poToken,
      final String? cpn,
      final bool isEncrypted,
      final Map<String, dynamic>? rawData}) = _$AudioStreamImpl;

  factory _AudioStream.fromJson(Map<String, dynamic> json) =
      _$AudioStreamImpl.fromJson;

  @override
  String get url;
  @override
  int get itag;
  @override
  String get mimeType;
  @override
  int get bitrate;
  @override
  String get container;
  @override
  String get codec;
  @override
  String? get signature;
  @override
  String? get poToken;
  @override
  String? get cpn;
  @override
  bool get isEncrypted;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of AudioStream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioStreamImplCopyWith<_$AudioStreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<String> get subscriptionTypes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rawData => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String id,
      String name,
      String avatarUrl,
      String? email,
      List<String> subscriptionTypes,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
    Object? email = freezed,
    Object? subscriptionTypes = null,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionTypes: null == subscriptionTypes
          ? _value.subscriptionTypes
          : subscriptionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String avatarUrl,
      String? email,
      List<String> subscriptionTypes,
      Map<String, dynamic>? rawData});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
    Object? email = freezed,
    Object? subscriptionTypes = null,
    Object? rawData = freezed,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionTypes: null == subscriptionTypes
          ? _value._subscriptionTypes
          : subscriptionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rawData: freezed == rawData
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.id,
      required this.name,
      required this.avatarUrl,
      this.email,
      final List<String> subscriptionTypes = const [],
      final Map<String, dynamic>? rawData})
      : _subscriptionTypes = subscriptionTypes,
        _rawData = rawData;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatarUrl;
  @override
  final String? email;
  final List<String> _subscriptionTypes;
  @override
  @JsonKey()
  List<String> get subscriptionTypes {
    if (_subscriptionTypes is EqualUnmodifiableListView)
      return _subscriptionTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptionTypes);
  }

  final Map<String, dynamic>? _rawData;
  @override
  Map<String, dynamic>? get rawData {
    final value = _rawData;
    if (value == null) return null;
    if (_rawData is EqualUnmodifiableMapView) return _rawData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, avatarUrl: $avatarUrl, email: $email, subscriptionTypes: $subscriptionTypes, rawData: $rawData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._subscriptionTypes, _subscriptionTypes) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatarUrl,
      email,
      const DeepCollectionEquality().hash(_subscriptionTypes),
      const DeepCollectionEquality().hash(_rawData));

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String id,
      required final String name,
      required final String avatarUrl,
      final String? email,
      final List<String> subscriptionTypes,
      final Map<String, dynamic>? rawData}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get avatarUrl;
  @override
  String? get email;
  @override
  List<String> get subscriptionTypes;
  @override
  Map<String, dynamic>? get rawData;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
