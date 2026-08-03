library ytmusic_client.features.playlist.presentation.playlist_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import '../../../core/presentation/providers.dart';
import '../../../shared/models/track.dart';

final _logger = Logger('PlaylistScreen');

class PlaylistScreen extends ConsumerStatefulWidget {
  final String playlistId;

  const PlaylistScreen({super.key, required this.playlistId});

  @override
  ConsumerState<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends ConsumerState<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    final playlistAsync = ref.watch(playlistProvider(widget.playlistId));

    return Scaffold(
      body: playlistAsync.when(
        data: (playlist) => CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      playlist.artworkUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        child: const Center(
                            child: Icon(Icons.queue_music, size: 80)),
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
                              playlist.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            if (playlist.author != null)
                              Text(
                                'By ${playlist.author}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white70),
                              ),
                            const SizedBox(height: 4),
                            Text(
                              '${playlist.trackCount} songs • ${_formatTotalDuration(playlist.tracks)}',
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
                  onPressed: () => _shufflePlaylist(playlist),
                  tooltip: 'Shuffle play',
                ),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () => _downloadPlaylist(playlist),
                  tooltip: 'Download',
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: 'edit', child: Text('Edit playlist')),
                    const PopupMenuItem(value: 'share', child: Text('Share')),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                  onSelected: (value) => _handlePlaylistAction(value, playlist),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return _buildPlayControls(playlist);
                  }
                  final trackIndex = index - 1;
                  if (trackIndex < playlist.tracks.length) {
                    return _buildTrackTile(playlist.tracks[trackIndex],
                        trackIndex, playlist.tracks);
                  }
                  return null;
                },
                childCount: playlist.tracks.length + 1,
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
              Text('Failed to load playlist'),
              const SizedBox(height: 8),
              Text(error.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayControls(Playlist playlist) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          FilledButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('Play'),
            onPressed: () => _playPlaylist(playlist),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.shuffle),
            label: const Text('Shuffle'),
            onPressed: () => _shufflePlaylist(playlist),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addToPlaylist(playlist),
            tooltip: 'Add to playlist',
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editPlaylist(playlist),
            tooltip: 'Edit',
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
              const PopupMenuItem(
                  value: 'remove', child: Text('Remove from playlist')),
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

  void _playPlaylist(Playlist playlist) {
    ref.read(queueControllerProvider).playQueue(playlist.tracks);
    context.go('/player');
  }

  void _shufflePlaylist(Playlist playlist) {
    final tracks = List<Track>.from(playlist.tracks)..shuffle();
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
      case 'remove':
        _removeFromPlaylist(track);
        break;
      case 'download':
        _downloadTrack(track);
        break;
      case 'share':
        _shareTrack(track);
        break;
    }
  }

  void _handlePlaylistAction(String action, Playlist playlist) {
    switch (action) {
      case 'edit':
        _editPlaylist(playlist);
        break;
      case 'share':
        _sharePlaylist(playlist);
        break;
      case 'delete':
        _deletePlaylist(playlist);
        break;
    }
  }

  void _addToPlaylist(Playlist playlist) {
    // Show dialog to add tracks
  }

  void _editPlaylist(Playlist playlist) {
    // Show edit dialog
  }

  void _sharePlaylist(Playlist playlist) {
    // Share playlist
  }

  void _deletePlaylist(Playlist playlist) {
    // Confirm and delete
  }

  void _downloadPlaylist(Playlist playlist) {
    // Download all tracks
  }

  void _downloadTrack(Track track) {
    // Download single track
  }

  void _shareTrack(Track track) {
    // Share track
  }

  void _removeFromPlaylist(Track track) {
    // Remove from playlist
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes}:${secs.toString().padLeft(2, '0')}';
  }

  String _formatTotalDuration(List<Track> tracks) {
    final totalSeconds = tracks.fold(0, (sum, t) => sum + t.duration);
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}
