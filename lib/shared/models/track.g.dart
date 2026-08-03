// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map<String, dynamic> json) => _$TrackImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      artistId: json['artistId'] as String,
      album: json['album'] as String?,
      albumId: json['albumId'] as String?,
      duration: (json['duration'] as num).toInt(),
      artworkUrl: json['artworkUrl'] as String,
      audioStreamUrl: json['audioStreamUrl'] as String?,
      itag: (json['itag'] as num?)?.toInt(),
      bitrate: (json['bitrate'] as num?)?.toInt(),
      lyricsId: json['lyricsId'] as String?,
      isExplicit: json['isExplicit'] as bool?,
      isAvailable: json['isAvailable'] as bool? ?? false,
      availableCountries: (json['availableCountries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'album': instance.album,
      'albumId': instance.albumId,
      'duration': instance.duration,
      'artworkUrl': instance.artworkUrl,
      'audioStreamUrl': instance.audioStreamUrl,
      'itag': instance.itag,
      'bitrate': instance.bitrate,
      'lyricsId': instance.lyricsId,
      'isExplicit': instance.isExplicit,
      'isAvailable': instance.isAvailable,
      'availableCountries': instance.availableCountries,
      'rawData': instance.rawData,
    };

_$PlaylistImpl _$$PlaylistImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      artworkUrl: json['artworkUrl'] as String,
      trackCount: (json['trackCount'] as num).toInt(),
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      author: json['author'] as String?,
      authorId: json['authorId'] as String?,
      isPublic: json['isPublic'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PlaylistImplToJson(_$PlaylistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'artworkUrl': instance.artworkUrl,
      'trackCount': instance.trackCount,
      'tracks': instance.tracks,
      'author': instance.author,
      'authorId': instance.authorId,
      'isPublic': instance.isPublic,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rawData': instance.rawData,
    };

_$ArtistImpl _$$ArtistImplFromJson(Map<String, dynamic> json) => _$ArtistImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      artworkUrl: json['artworkUrl'] as String,
      description: json['description'] as String?,
      subscriberCount: (json['subscriberCount'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      albums: (json['albums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topTracks: (json['topTracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ArtistImplToJson(_$ArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artworkUrl': instance.artworkUrl,
      'description': instance.description,
      'subscriberCount': instance.subscriberCount,
      'genres': instance.genres,
      'albums': instance.albums,
      'topTracks': instance.topTracks,
      'rawData': instance.rawData,
    };

_$AlbumImpl _$$AlbumImplFromJson(Map<String, dynamic> json) => _$AlbumImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      artistId: json['artistId'] as String,
      artworkUrl: json['artworkUrl'] as String,
      year: (json['year'] as num).toInt(),
      trackCount: (json['trackCount'] as num).toInt(),
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AlbumImplToJson(_$AlbumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'artworkUrl': instance.artworkUrl,
      'year': instance.year,
      'trackCount': instance.trackCount,
      'tracks': instance.tracks,
      'description': instance.description,
      'genres': instance.genres,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'rawData': instance.rawData,
    };

_$QueueStateImpl _$$QueueStateImplFromJson(Map<String, dynamic> json) =>
    _$QueueStateImpl(
      currentTrack:
          Track.fromJson(json['currentTrack'] as Map<String, dynamic>),
      queueList: (json['queueList'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      index: (json['index'] as num?)?.toInt() ?? 0,
      isRadioActive: json['isRadioActive'] as bool? ?? false,
      continuationToken: json['continuationToken'] as String?,
      mode: $enumDecodeNullable(_$PlaybackModeEnumMap, json['mode']) ??
          PlaybackMode.sequential,
      currentPosition: (json['currentPosition'] as num?)?.toDouble() ?? 0.0,
      bufferedPosition: json['bufferedPosition'] == null
          ? Duration.zero
          : Duration(microseconds: (json['bufferedPosition'] as num).toInt()),
    );

Map<String, dynamic> _$$QueueStateImplToJson(_$QueueStateImpl instance) =>
    <String, dynamic>{
      'currentTrack': instance.currentTrack,
      'queueList': instance.queueList,
      'index': instance.index,
      'isRadioActive': instance.isRadioActive,
      'continuationToken': instance.continuationToken,
      'mode': _$PlaybackModeEnumMap[instance.mode]!,
      'currentPosition': instance.currentPosition,
      'bufferedPosition': instance.bufferedPosition.inMicroseconds,
    };

const _$PlaybackModeEnumMap = {
  PlaybackMode.sequential: 'sequential',
  PlaybackMode.shuffle: 'shuffle',
  PlaybackMode.repeatOne: 'repeatOne',
  PlaybackMode.repeatAll: 'repeatAll',
};

_$LyricsImpl _$$LyricsImplFromJson(Map<String, dynamic> json) => _$LyricsImpl(
      trackId: json['trackId'] as String,
      source: $enumDecode(_$LyricsSourceEnumMap, json['source']),
      lines: (json['lines'] as List<dynamic>?)
              ?.map((e) => LyricsLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasSynced: json['hasSynced'] as bool?,
      rawLrc: json['rawLrc'] as String?,
    );

Map<String, dynamic> _$$LyricsImplToJson(_$LyricsImpl instance) =>
    <String, dynamic>{
      'trackId': instance.trackId,
      'source': _$LyricsSourceEnumMap[instance.source]!,
      'lines': instance.lines,
      'hasSynced': instance.hasSynced,
      'rawLrc': instance.rawLrc,
    };

const _$LyricsSourceEnumMap = {
  LyricsSource.innerTube: 'innerTube',
  LyricsSource.lrclib: 'lrclib',
  LyricsSource.none: 'none',
};

_$LyricsLineImpl _$$LyricsLineImplFromJson(Map<String, dynamic> json) =>
    _$LyricsLineImpl(
      time: Duration(microseconds: (json['time'] as num).toInt()),
      text: json['text'] as String,
      words: (json['words'] as List<dynamic>?)
              ?.map((e) => WordTimestamp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LyricsLineImplToJson(_$LyricsLineImpl instance) =>
    <String, dynamic>{
      'time': instance.time.inMicroseconds,
      'text': instance.text,
      'words': instance.words,
    };

_$WordTimestampImpl _$$WordTimestampImplFromJson(Map<String, dynamic> json) =>
    _$WordTimestampImpl(
      start: Duration(microseconds: (json['start'] as num).toInt()),
      end: Duration(microseconds: (json['end'] as num).toInt()),
      word: json['word'] as String,
    );

Map<String, dynamic> _$$WordTimestampImplToJson(_$WordTimestampImpl instance) =>
    <String, dynamic>{
      'start': instance.start.inMicroseconds,
      'end': instance.end.inMicroseconds,
      'word': instance.word,
    };

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      query: json['query'] as String,
      songs: (json['songs'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playlists: (json['playlists'] as List<dynamic>?)
              ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      albums: (json['albums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      continuationToken: json['continuationToken'] as String?,
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'songs': instance.songs,
      'playlists': instance.playlists,
      'artists': instance.artists,
      'albums': instance.albums,
      'videos': instance.videos,
      'continuationToken': instance.continuationToken,
    };

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      channelTitle: json['channelTitle'] as String,
      channelId: json['channelId'] as String,
      duration: (json['duration'] as num).toInt(),
      artworkUrl: json['artworkUrl'] as String,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      isLive: json['isLive'] as bool?,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'channelTitle': instance.channelTitle,
      'channelId': instance.channelId,
      'duration': instance.duration,
      'artworkUrl': instance.artworkUrl,
      'viewCount': instance.viewCount,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'isLive': instance.isLive,
      'rawData': instance.rawData,
    };

_$HomeSectionImpl _$$HomeSectionImplFromJson(Map<String, dynamic> json) =>
    _$HomeSectionImpl(
      title: json['title'] as String,
      type: $enumDecode(_$HomeSectionTypeEnumMap, json['type']),
      items: json['items'] as List<dynamic>,
      navigationEndpoint: json['navigationEndpoint'] as String?,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$HomeSectionImplToJson(_$HomeSectionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': _$HomeSectionTypeEnumMap[instance.type]!,
      'items': instance.items,
      'navigationEndpoint': instance.navigationEndpoint,
      'rawData': instance.rawData,
    };

const _$HomeSectionTypeEnumMap = {
  HomeSectionType.quickPicks: 'quickPicks',
  HomeSectionType.recommendedAlbums: 'recommendedAlbums',
  HomeSectionType.moods: 'moods',
  HomeSectionType.genres: 'genres',
  HomeSectionType.newReleases: 'newReleases',
  HomeSectionType.libraryPlaylists: 'libraryPlaylists',
  HomeSectionType.recentlyPlayed: 'recentlyPlayed',
  HomeSectionType.mixedForYou: 'mixedForYou',
};

_$MoodCategoryImpl _$$MoodCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MoodCategoryImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      artworkUrl: json['artworkUrl'] as String,
      description: json['description'] as String?,
      playlists: (json['playlists'] as List<dynamic>?)
              ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MoodCategoryImplToJson(_$MoodCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artworkUrl': instance.artworkUrl,
      'description': instance.description,
      'playlists': instance.playlists,
      'rawData': instance.rawData,
    };

_$AudioStreamImpl _$$AudioStreamImplFromJson(Map<String, dynamic> json) =>
    _$AudioStreamImpl(
      url: json['url'] as String,
      itag: (json['itag'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      bitrate: (json['bitrate'] as num).toInt(),
      container: json['container'] as String,
      codec: json['codec'] as String,
      signature: json['signature'] as String?,
      poToken: json['poToken'] as String?,
      cpn: json['cpn'] as String?,
      isEncrypted: json['isEncrypted'] as bool? ?? false,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AudioStreamImplToJson(_$AudioStreamImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'itag': instance.itag,
      'mimeType': instance.mimeType,
      'bitrate': instance.bitrate,
      'container': instance.container,
      'codec': instance.codec,
      'signature': instance.signature,
      'poToken': instance.poToken,
      'cpn': instance.cpn,
      'isEncrypted': instance.isEncrypted,
      'rawData': instance.rawData,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      email: json['email'] as String?,
      subscriptionTypes: (json['subscriptionTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'subscriptionTypes': instance.subscriptionTypes,
      'rawData': instance.rawData,
    };
