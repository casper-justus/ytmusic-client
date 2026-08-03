library ytmusic_client.features.search.presentation.search_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import '../../../core/data/innertube_client.dart';
import '../../../core/presentation/providers.dart';
import '../../../shared/models/track.dart';
import '../../../shared/widgets/section_list.dart';
import '../../library/presentation/library_screen.dart';

final _logger = Logger('SearchScreen');

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  SearchFilter _selectedFilter = SearchFilter.songs;
  String? _continuationToken;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String query) {
    if (query.trim().isNotEmpty) {
      ref
          .read(searchHistoryProvider.notifier)
          .addSearch(query, _selectedFilter);
      ref.invalidate(searchProvider(SearchParams(
        query: query,
        filter: _selectedFilter,
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text;
    final searchAsync = query.isNotEmpty
        ? ref.watch(searchProvider(SearchParams(
            query: query,
            filter: _selectedFilter,
          )))
        : null;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search songs, artists, albums...',
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.invalidate(searchProvider(SearchParams(
                            query: '',
                            filter: _selectedFilter,
                          )));
                        },
                      )
                    : null,
              ),
              onSubmitted: _onSearchSubmitted,
              textInputAction: TextInputAction.search,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: _buildFilterChips(),
            ),
          ),
          if (query.isEmpty)
            SliverFillRemaining(
              child: _buildSearchSuggestions(),
            )
          else if (searchAsync != null)
            searchAsync.when(
              data: (result) => _buildSearchResults(result),
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 64, color: Theme.of(context).colorScheme.error),
                      const SizedBox(height: 16),
                      Text('Search failed'),
                      const SizedBox(height: 8),
                      Text(error.toString(),
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            )
          else
            const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = [
      (SearchFilter.songs, 'Songs'),
      (SearchFilter.videos, 'Videos'),
      (SearchFilter.albums, 'Albums'),
      (SearchFilter.artists, 'Artists'),
      (SearchFilter.playlists, 'Playlists'),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter.$1;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filter.$2),
              selected: isSelected,
              onSelected: (_) {
                setState(() => _selectedFilter = filter.$1);
                if (_searchController.text.isNotEmpty) {
                  _onSearchSubmitted(_searchController.text);
                }
              },
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSearchSuggestions() {
    final historyAsync = ref.watch(searchHistoryProvider);

    return historyAsync.when(
      data: (history) {
        if (history.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
                const SizedBox(height: 16),
                Text('Search for music',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('Songs, artists, albums, playlists and more',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        )),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent searches',
                      style: Theme.of(context).textTheme.titleLarge),
                  TextButton(
                    onPressed: () =>
                        ref.read(searchHistoryProvider.notifier).clear(),
                    child: const Text('Clear all'),
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: history.length,
              separatorBuilder: (_, __) => Divider(height: 1, indent: 56),
              itemBuilder: (context, index) {
                final item = history[index];
                return ListTile(
                  leading: Icon(Icons.history,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  title: Text(item.query),
                  subtitle: Text(_getFilterLabel(_filterFromName(item.filter))),
                  trailing: IconButton(
                    icon: Icon(Icons.close, size: 18),
                    onPressed: () => ref
                        .read(searchHistoryProvider.notifier)
                        .remove(item.id!),
                  ),
                  onTap: () {
                    _searchController.text = item.query;
                    setState(
                        () => _selectedFilter = _filterFromName(item.filter));
                    _onSearchSubmitted(item.query);
                  },
                );
              },
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildSearchResults(SearchResult result) {
    return SliverList(
      delegate: SliverChildListDelegate([
        if (result.songs.isNotEmpty)
          _buildResultSection('Songs', result.songs, (t) => _buildTrackTile(t)),
        if (result.videos.isNotEmpty)
          _buildResultSection(
              'Videos', result.videos, (v) => _buildVideoTile(v)),
        if (result.albums.isNotEmpty)
          _buildResultSection(
              'Albums', result.albums, (a) => _buildAlbumTile(a)),
        if (result.artists.isNotEmpty)
          _buildResultSection(
              'Artists', result.artists, (a) => _buildArtistTile(a)),
        if (result.playlists.isNotEmpty)
          _buildResultSection(
              'Playlists', result.playlists, (p) => _buildPlaylistTile(p)),
        if (_continuationToken != null)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          ),
      ]),
    );
  }

  Widget _buildResultSection<T>(
      String title, List<T> items, Widget Function(T) builder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length > 5 ? 5 : items.length,
          separatorBuilder: (_, __) => Divider(height: 1, indent: 56),
          itemBuilder: (context, index) => builder(items[index]),
        ),
        if (items.length > 5)
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {},
              child: Text('View all ${items.length} $title'),
            ),
          ),
      ],
    );
  }

  Widget _buildTrackTile(Track track) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(track.artworkUrl,
            width: 48, height: 48, fit: BoxFit.cover),
      ),
      title: Text(track.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle:
          Text(track.artist, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(value: 'play', child: Text('Play')),
          const PopupMenuItem(value: 'add_queue', child: Text('Add to queue')),
          const PopupMenuItem(value: 'download', child: Text('Download')),
        ],
      ),
      onTap: () => _playTrack(track),
    );
  }

  Widget _buildVideoTile(Video video) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(video.artworkUrl,
            width: 48, height: 48, fit: BoxFit.cover),
      ),
      title: Text(video.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(video.channelTitle,
          maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () {},
    );
  }

  Widget _buildAlbumTile(Album album) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(album.artworkUrl,
            width: 48, height: 48, fit: BoxFit.cover),
      ),
      title: Text(album.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle:
          Text(album.artist, maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () => context.go('/album/${album.id}'),
    );
  }

  Widget _buildArtistTile(Artist artist) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(artist.artworkUrl),
        radius: 24,
      ),
      title: Text(artist.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text('${artist.subscriberCount?.toString() ?? ''} subscribers'),
      onTap: () => context.go('/artist/${artist.id}'),
    );
  }

  Widget _buildPlaylistTile(Playlist playlist) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(playlist.artworkUrl,
            width: 48, height: 48, fit: BoxFit.cover),
      ),
      title: Text(playlist.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text('${playlist.trackCount} songs',
          maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () => context.go('/playlist/${playlist.id}'),
    );
  }

  void _playTrack(Track track) {
    ref.read(queueControllerProvider).playTrack(track);
    context.go('/player');
  }

  String _getFilterLabel(SearchFilter filter) {
    switch (filter) {
      case SearchFilter.songs:
        return 'Songs';
      case SearchFilter.videos:
        return 'Videos';
      case SearchFilter.albums:
        return 'Albums';
      case SearchFilter.artists:
        return 'Artists';
      case SearchFilter.playlists:
        return 'Playlists';
    }
  }

  SearchFilter _filterFromName(String name) {
    return SearchFilter.values.firstWhere(
      (f) => f.name == name,
      orElse: () => SearchFilter.songs,
    );
  }
}
