// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      artistId: json['artistId'] as String,
      album: json['album'] as String?,
      albumId: json['albumId'] as String?,
      duration: json['duration'] as int,
      artworkUrl: json['artworkUrl'] as String,
      audioStreamUrl: json['audioStreamUrl'] as String?,
      itag: json['itag'] as int?,
      bitrate: json['bitrate'] as int?,
      lyricsId: json['lyricsId'] as String?,
      isExplicit: json['isExplicit'] as bool?,
      isAvailable: json['isAvailable'] as bool? ?? false,
      availableCountries: (json['availableCountries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
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

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      artworkUrl: json['artworkUrl'] as String,
      trackCount: json['trackCount'] as int,
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'artworkUrl': instance.artworkUrl,
      'trackCount': instance.trackCount,
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'author': instance.author,
      'authorId': instance.authorId,
      'isPublic': instance.isPublic,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rawData': instance.rawData,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: json['id'] as String,
      name: json['name'] as String,
      artworkUrl: json['artworkUrl'] as String,
      description: json['description'] as String?,
      subscriberCount: json['subscriberCount'] as int?,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      albums: (json['albums'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      topTracks: (json['topTracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artworkUrl': instance.artworkUrl,
      'description': instance.description,
      'subscriberCount': instance.subscriberCount,
      'genres': instance.genres,
      'albums': instance.albums.map((e) => e.toJson()).toList(),
      'topTracks': instance.topTracks.map((e) => e.toJson()).toList(),
      'rawData': instance.rawData,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      artistId: json['artistId'] as String,
      artworkUrl: json['artworkUrl'] as String,
      year: json['year'] as int,
      trackCount: json['trackCount'] as int,
      tracks: (json['tracks'] as List<dynamic>?)
              ??.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      description: json['description'] as String?,
      genres: (json['genres'] as List<dynamic>?)
              ??.map((e) => e as String)
              .toList() ??
          [],
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'artworkUrl': instance.artworkUrl,
      'year': instance.year,
      'trackCount': instance.trackCount,
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'genres': instance.genres,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'rawData': instance.rawData,
    };

QueueState _$QueueStateFromJson(Map<String, dynamic> json) => QueueState(
      currentTrack: Track.fromJson(json['currentTrack'] as Map<String, dynamic>),
      queueList: (json['queueList'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      index: json['index'] as int? ?? 0,
      isRadioActive: json['isRadioActive'] as bool? ?? false,
      continuationToken: json['continuationToken'] as String?,
      mode: PlaybackMode.values.byName(json['mode'] as String? ?? 'sequential'),
      currentPosition: (json['currentPosition'] as num?)?.toDouble() ?? 0.0,
      bufferedPosition: json['bufferedPosition'] == null
          ? Duration.zero
          : Duration(milliseconds: json['bufferedPosition'] as int),
    );

Map<String, dynamic> _$QueueStateToJson(QueueState instance) => <String, dynamic>{
      'currentTrack': instance.currentTrack.toJson(),
      'queueList': instance.queueList.map((e) => e.toJson()).toList(),
      'index': instance.index,
      'isRadioActive': instance.isRadioActive,
      'continuationToken': instance.continuationToken,
      'mode': instance.mode.name,
      'currentPosition': instance.currentPosition,
      'bufferedPosition': instance.bufferedPosition.inMilliseconds,
    };

Lyrics _$LyricsFromJson(Map<String, dynamic> json) => Lyrics(
      trackId: json['trackId'] as String,
      source: LyricsSource.values.byName(json['source'] as String? ?? 'none'),
      lines: (json['lines'] as List<dynamic>?)
              ?.map((e) => LyricsLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hasSynced: json['hasSynced'] as bool?,
      rawLrc: json['rawLrc'] as String?,
    );

Map<String, dynamic> _$LyricsToJson(Lyrics instance) => <String, dynamic>{
      'trackId': instance.trackId,
      'source': instance.source.name,
      'lines': instance.lines.map((e) => e.toJson()).toList(),
      'hasSynced': instance.hasSynced,
      'rawLrc': instance.rawLrc,
    };

LyricsLine _$LyricsLineFromJson(Map<String, dynamic> json) => LyricsLine(
      time: Duration(milliseconds: json['time'] as int),
      text: json['text'] as String,
      words: (json['words'] as List<dynamic>?)
              ?.map((e) => WordTimestamp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LyricsLineToJson(LyricsLine instance) => <String, dynamic>{
      'time': instance.time.inMilliseconds,
      'text': instance.text,
      'words': instance.words.map((e) => e.toJson()).toList(),
    };

WordTimestamp _$WordTimestampFromJson(Map<String, dynamic> json) => WordTimestamp(
      start: Duration(milliseconds: json['start'] as int),
      end: Duration(milliseconds: json['end'] as int),
      word: json['word'] as String,
    );

Map<String, dynamic> _$WordTimestampToJson(WordTimestamp instance) => <String, dynamic>{
      'start': instance.start.inMilliseconds,
      'end': instance.end.inMilliseconds,
      'word': instance.word,
    };

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      query: json['query'] as String,
      songs: (json['songs'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      playlists: (json['playlists'] as List<dynamic>?)
              ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      albums: (json['albums'] as List<dynamic>?)
              ??.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      videos: (json['videos'] as List<dynamic>?)
              ??.map((e) => Video.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      continuationToken: json['continuationToken'] as String?,
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) => <String, dynamic>{
      'query': instance.query,
      'songs': instance.songs.map((e) => e.toJson()).toList(),
      'playlists': instance.playlists.map((e) => e.toJson()).toList(),
      'artists': instance.artists.map((e) => e.toJson()).toList(),
      'albums': instance.albums.map((e) => e.toJson()).toList(),
      'videos': instance.videos.map((e) => e.toJson()).toList(),
      'continuationToken': instance.continuationToken,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      id: json['id'] as String,
      title: json['title'] as String,
      channelTitle: json['channelTitle'] as String,
      channelId: json['channelId'] as String,
      duration: json['duration'] as int,
      artworkUrl: json['artworkUrl'] as String,
      viewCount: json['viewCount'] as int?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      isLive: json['isLive'] as bool?,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
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

HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) => HomeSection(
      title: json['title'] as String,
      type: HomeSectionType.values.byName(json['type'] as String),
      items: json['items'] as List<dynamic>,
      navigationEndpoint: json['navigationEndpoint'] as String?,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$HomeSectionToJson(HomeSection instance) => <String, dynamic>{
      'title': instance.title,
      'type': instance.type.name,
      'items': instance.items,
      'navigationEndpoint': instance.navigationEndpoint,
      'rawData': instance.rawData,
    };

MoodCategory _$MoodCategoryFromJson(Map<String, dynamic> json) => MoodCategory(
      id: json['id'] as String,
      title: json['title'] as String,
      artworkUrl: json['artworkUrl'] as String,
      description: json['description'] as String?,
      playlists: (json['playlists'] as List<dynamic>?)
              ??.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MoodCategoryToJson(MoodCategory instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artworkUrl': instance.artworkUrl,
      'description': instance.description,
      'playlists': instance.playlists.map((e) => e.toJson()).toList(),
      'rawData': instance.rawData,
    };

AudioStream _$AudioStreamFromJson(Map<String, dynamic> json) => AudioStream(
      url: json['url'] as String,
      itag: json['itag'] as int,
      mimeType: json['mimeType'] as String,
      bitrate: json['bitrate'] as int,
      container: json['container'] as String,
      codec: json['codec'] as String,
      signature: json['signature'] as String?,
      poToken: json['poToken'] as String?,
      cpn: json['cpn'] as String?,
      isEncrypted: json['isEncrypted'] as bool? ?? false,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AudioStreamToJson(AudioStream instance) => <String, dynamic>{
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

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      email: json['email'] as String?,
      subscriptionTypes: (json['subscriptionTypes'] as List<dynamic>?)
              ??.map((e) => e as String)
              .toList() ??
          [],
      rawData: json['rawData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'subscriptionTypes': instance.subscriptionTypes,
      'rawData': instance.rawData,
    };