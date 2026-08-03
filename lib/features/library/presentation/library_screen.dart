library ytmusic_client.features.library.presentation.library_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' hide Column;
import '../../../core/presentation/providers.dart';
import '../../../core/data/database.dart';
import '../../../core/data/innertube_client.dart';
import '../../../shared/models/track.dart';

final _logger = Logger('LibraryScreen');

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Library'),
            floating: true,
            snap: true,
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: 'Playlists'),
                Tab(text: 'Songs'),
                Tab(text: 'Albums'),
                Tab(text: 'Artists'),
                Tab(text: 'Downloads'),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _showCreatePlaylistDialog,
                tooltip: 'Create playlist',
              ),
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {},
                tooltip: 'Sort',
              ),
            ],
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPlaylistsTab(),
                _buildSongsTab(),
                _buildAlbumsTab(),
                _buildArtistsTab(),
                _buildDownloadsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistsTab() {
    final playlistsAsync = ref.watch(localPlaylistsProvider);

    return playlistsAsync.when(
      data: (playlists) {
        if (playlists.isEmpty) {
          return _buildEmptyState(
            icon: Icons.queue_music,
            title: 'No playlists yet',
            subtitle: 'Create your first playlist',
            actionText: 'Create playlist',
            onAction: _showCreatePlaylistDialog,
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: playlists.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final playlist = playlists[index];
            return _buildPlaylistCard(playlist);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => _buildEmptyState(
        icon: Icons.error_outline,
        title: 'Failed to load playlists',
        subtitle: 'Pull to refresh',
      ),
    );
  }

  Widget _buildSongsTab() {
    final tracksAsync = ref.watch(localTracksProvider);

    return tracksAsync.when(
      data: (tracks) {
        if (tracks.isEmpty) {
          return _buildEmptyState(
            icon: Icons.music_note,
            title: 'No songs in library',
            subtitle: 'Add songs from search or playlists',
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: tracks.length,
          separatorBuilder: (_, __) => Divider(height: 1, indent: 56),
          itemBuilder: (context, index) {
            final track = tracks[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(track.artworkUrl,
                    width: 48, height: 48, fit: BoxFit.cover),
              ),
              title: Text(track.title,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Text(track.artist,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'play', child: Text('Play')),
                  const PopupMenuItem(
                      value: 'add_queue', child: Text('Add to queue')),
                  const PopupMenuItem(
                      value: 'remove', child: Text('Remove from library')),
                ],
              ),
              onTap: () => _playTrack(Track.fromEntity(track)),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => _buildEmptyState(
          icon: Icons.error_outline, title: 'Failed to load songs'),
    );
  }

  Widget _buildAlbumsTab() {
    return _buildEmptyState(
      icon: Icons.album,
      title: 'Albums',
      subtitle: 'Albums you added will appear here',
    );
  }

  Widget _buildArtistsTab() {
    return _buildEmptyState(
      icon: Icons.person,
      title: 'Artists',
      subtitle: 'Artists you subscribed to will appear here',
    );
  }

  Widget _buildDownloadsTab() {
    final downloadsAsync = ref.watch(downloadsProvider);

    return downloadsAsync.when(
      data: (downloads) {
        if (downloads.isEmpty) {
          return _buildEmptyState(
            icon: Icons.download,
            title: 'No downloads',
            subtitle: 'Downloaded music for offline listening',
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: downloads.length,
          separatorBuilder: (_, __) => Divider(height: 1, indent: 56),
          itemBuilder: (context, index) {
            final download = downloads[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: 48,
                  height: 48,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Icon(Icons.music_note),
                ),
              ),
              title: Text('Track ${download.trackId}'),
              subtitle: Text(
                  '${download.status} • ${_formatBytes(download.downloadedBytes)}/${_formatBytes(download.totalBytes)}'),
              trailing: download.status == 'completed'
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const CircularProgressIndicator(),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => _buildEmptyState(
          icon: Icons.error_outline, title: 'Failed to load downloads'),
    );
  }

  Widget _buildPlaylistCard(PlaylistEntity playlist) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            playlist.artworkUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 56,
              height: 56,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: const Icon(Icons.queue_music),
            ),
          ),
        ),
        title:
            Text(playlist.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('${playlist.trackCount} songs',
            maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'play', child: Text('Play')),
            const PopupMenuItem(value: 'shuffle', child: Text('Shuffle play')),
            const PopupMenuItem(value: 'edit', child: Text('Edit')),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
          onSelected: (value) => _handlePlaylistAction(value, playlist),
        ),
        onTap: () => context.go('/playlist/${playlist.id}'),
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    String? subtitle,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 80,
                color: Theme.of(context).colorScheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center),
            ],
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.add),
                label: Text(actionText),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showCreatePlaylistDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Playlist'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Playlist name'),
          autofocus: true,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                _createPlaylist(controller.text.trim());
                Navigator.pop(context);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Future<void> _createPlaylist(String title) async {
    final db = ref.read(databaseProvider);
    await db.cachePlaylist(PlaylistsCompanion(
      id: Value(DateTime.now().millisecondsSinceEpoch.toString()),
      title: Value(title),
      artworkUrl: Value(''),
      trackCount: Value(0),
      isLocal: Value(true),
    ));
  }

  void _handlePlaylistAction(String action, PlaylistEntity playlist) {
    switch (action) {
      case 'play':
        // Load playlist tracks and play
        break;
      case 'shuffle':
        break;
      case 'edit':
        break;
      case 'delete':
        _deletePlaylist(playlist.id);
        break;
    }
  }

  Future<void> _deletePlaylist(String id) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.playlists)..where((p) => p.id.equals(id))).go();
  }

  void _playTrack(Track track) {
    ref.read(queueControllerProvider).playTrack(track);
    context.go('/player');
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

// Providers for local data
final localPlaylistsProvider =
    FutureProvider<List<PlaylistEntity>>((ref) async {
  final db = ref.read(databaseProvider);
  return db.getAllPlaylists();
});

final localTracksProvider = FutureProvider<List<TrackEntity>>((ref) async {
  final db = ref.read(databaseProvider);
  return db.getAllTracks();
});

final downloadsProvider = FutureProvider<List<DownloadEntity>>((ref) async {
  final db = ref.read(databaseProvider);
  return db.getDownloads();
});

final searchHistoryProvider = StateNotifierProvider<SearchHistoryNotifier,
    AsyncValue<List<SearchHistoryEntity>>>((ref) {
  return SearchHistoryNotifier(ref.read(databaseProvider));
});

class SearchHistoryNotifier
    extends StateNotifier<AsyncValue<List<SearchHistoryEntity>>> {
  final AppDatabase _db;

  SearchHistoryNotifier(this._db) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final history = await _db.getSearchHistory(limit: 20);
      state = AsyncValue.data(history);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addSearch(String query, SearchFilter filter) async {
    await _db.addSearchHistory(query, filter.name);
    await load();
  }

  Future<void> remove(int id) async {
    await (_db.delete(_db.searchHistory)..where((s) => s.id.equals(id))).go();
    await load();
  }

  Future<void> clear() async {
    await _db.delete(_db.searchHistory).go();
    await load();
  }
}
