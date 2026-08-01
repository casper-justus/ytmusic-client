library ytmusic_client.features.artist.presentation.artist_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import '../../../core/presentation/providers.dart';
import '../../../shared/models/track.dart';
import '../../../shared/widgets/section_list.dart';

final _logger = Logger('ArtistScreen');

class ArtistScreen extends ConsumerStatefulWidget {
  final String artistId;

  const ArtistScreen({super.key, required this.artistId});

  @override
  ConsumerState<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends ConsumerState<ArtistScreen> {
  final ScrollController _scrollController = ScrollController();
  String? _continuationToken;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        _continuationToken != null) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    // Load more tracks/albums
  }

  @override
  Widget build(BuildContext context) {
    final artistAsync = ref.watch(artistProvider(widget.artistId));

    return Scaffold(
      body: artistAsync.when(
        data: (artist) => CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      artist.artworkUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        child: const Center(child: Icon(Icons.person, size: 80)),
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
                              artist.name,
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (artist.subscriberCount != null)
                              Text(
                                '${_formatCount(artist.subscriberCount!)} subscribers',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
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
                  onPressed: () => _shuffleArtist(artist),
                  tooltip: 'Shuffle play',
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (artist.topTracks.isNotEmpty) ...[
                    _buildSectionHeader('Popular songs'),
                    SectionList(
                      items: artist.topTracks.take(10).toList(),
                      itemBuilder: (context, track, index) => _buildTrackCard(track),
                    ),
                  ],
                  if (artist.albums.isNotEmpty) ...[
                    _buildSectionHeader('Albums'),
                    SectionList(
                      items: artist.albums.take(10).toList(),
                      itemWidth: 140,
                      itemBuilder: (context, album, index) => _buildAlbumCard(album),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: 16),
              Text('Failed to load artist'),
              const SizedBox(height: 8),
              Text(error.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _buildTrackCard(Track track) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  track.artworkUrl,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.8),
                  radius: 16,
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow, size: 16, color: Colors.white),
                    onPressed: () => _playTrack(track),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(track.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(track.artist, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAlbumCard(Album album) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            album.artworkUrl,
            width: 140,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(album.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(album.artist, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12)),
        Text('${album.year} • ${album.trackCount} songs', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 11)),
      ],
    );
  }

  void _playTrack(Track track) {
    ref.read(queueControllerProvider).playTrack(track);
    context.go('/player');
  }

  void _shuffleArtist(Artist artist) {
    if (artist.topTracks.isNotEmpty) {
      final tracks = List<Track>.from(artist.topTracks)..shuffle();
      ref.read(queueControllerProvider).playQueue(tracks, isRadio: true);
      context.go('/player');
    }
  }

  String _formatCount(int count) {
    if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
    return count.toString();
  }
}