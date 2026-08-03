library ytmusic_client.features.album.presentation.album_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import '../../../core/presentation/providers.dart';
import '../../../shared/models/track.dart';

final _logger = Logger('AlbumScreen');

class AlbumScreen extends ConsumerStatefulWidget {
  final String browseId;

  const AlbumScreen({super.key, required this.browseId});

  @override
  ConsumerState<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends ConsumerState<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    final albumAsync = ref.watch(albumProvider(widget.browseId));

    return Scaffold(
      body: albumAsync.when(
        data: (album) => CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 320,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      album.artworkUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        child: const Center(child: Icon(Icons.album, size: 80)),
                      ),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              album.artist,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${album.year} • ${album.trackCount} songs • ${_formatDuration(album.tracks.fold(0, (sum, t) => sum + t.duration))}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pinned: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  onPressed: () => _shuffleAlbum(album),
                  tooltip: 'Shuffle play',
                ),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () => _downloadAlbum(album),
                  tooltip: 'Download',
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return _buildPlayControls(album);
                  }
                  final trackIndex = index - 1;
                  if (trackIndex < album.tracks.length) {
                    return _buildTrackTile(
                        album.tracks[trackIndex], trackIndex, album.tracks);
                  }
                  return null;
                },
                childCount: album.tracks.length + 1,
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline,
                  size: 64, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: 16),
              Text('Failed to load album'),
              const SizedBox(height: 8),
              Text(error.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayControls(Album album) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          FilledButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('Play'),
            onPressed: () => _playAlbum(album),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.shuffle),
            label: const Text('Shuffle'),
            onPressed: () => _shuffleAlbum(album),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addToPlaylist(album),
            tooltip: 'Add to playlist',
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _downloadAlbum(album),
            tooltip: 'Download',
          ),
        ],
      ),
    );
  }

  Widget _buildTrackTile(Track track, int index, List<Track> tracks) {
    return ListTile(
      leading: Text(
        '${index + 1}',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
      title: Text(track.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: track.artist.isNotEmpty ? Text(track.artist) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _formatDuration(track.duration),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'play', child: Text('Play')),
              const PopupMenuItem(
                  value: 'add_queue', child: Text('Add to queue')),
              const PopupMenuItem(value: 'download', child: Text('Download')),
              const PopupMenuItem(value: 'share', child: Text('Share')),
            ],
            onSelected: (value) => _handleTrackAction(value, track),
          ),
        ],
      ),
      onTap: () => _playTrack(track, tracks, index),
    );
  }

  void _playAlbum(Album album) {
    ref.read(queueControllerProvider).playQueue(album.tracks);
    context.go('/player');
  }

  void _shuffleAlbum(Album album) {
    final tracks = List<Track>.from(album.tracks)..shuffle();
    ref.read(queueControllerProvider).playQueue(tracks);
    context.go('/player');
  }

  void _playTrack(Track track, List<Track> queue, int index) {
    ref.read(queueControllerProvider).playQueue(queue, startIndex: index);
    context.go('/player');
  }

  void _handleTrackAction(String action, Track track) {
    switch (action) {
      case 'play':
        ref.read(queueControllerProvider).playTrack(track);
        context.go('/player');
        break;
      case 'add_queue':
        ref.read(queueControllerProvider).playTrack(track);
        break;
      case 'download':
        _downloadTrack(track);
        break;
      case 'share':
        _shareTrack(track);
        break;
    }
  }

  void _addToPlaylist(Album album) {
    // Show playlist selection dialog
  }

  void _downloadAlbum(Album album) {
    // Add all tracks to download queue
  }

  void _downloadTrack(Track track) {
    // Add track to download queue
  }

  void _shareTrack(Track track) {
    // Share track
  }

  String _formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final secs = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m ${secs}s';
  }
}
