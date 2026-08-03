library ytmusic_client.features.home.presentation.home_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import '../../../core/presentation/providers.dart';
import '../../../shared/models/track.dart';
import '../../../shared/widgets/section_list.dart';

final _logger = Logger('HomeScreen');

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  String? _continuationToken;
  bool _isLoadingMore = false;

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
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _continuationToken != null) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);
    try {
      // In a real implementation, we'd fetch more sections
      // For now, just invalidate to trigger refresh
      ref.invalidate(homeFeedProvider(_continuationToken));
    } finally {
      setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeFeedAsync = ref.watch(homeFeedProvider(null));

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: const Text('Home'),
            floating: true,
            snap: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.cast),
                onPressed: () {},
                tooltip: 'Cast',
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => context.go('/search'),
                tooltip: 'Search',
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'settings') context.go('/settings');
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                      value: 'settings', child: Text('Settings')),
                ],
              ),
            ],
          ),
          homeFeedAsync.when(
            data: (sections) => SliverList.separated(
              itemCount: sections.length + (_isLoadingMore ? 1 : 0),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index >= sections.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _buildSection(context, sections[index]);
              },
            ),
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
                    Text('Failed to load home feed'),
                    const SizedBox(height: 8),
                    Text(error.toString(),
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.invalidate(homeFeedProvider(null)),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, HomeSection section) {
    if (section.items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                section.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              if (section.navigationEndpoint != null)
                TextButton(
                  onPressed: () {},
                  child: const Text('View all'),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SectionList(
          items: section.items,
          itemBuilder: (context, item, index) => _buildItemCard(context, item),
        ),
      ],
    );
  }

  Widget _buildItemCard(BuildContext context, dynamic item) {
    // This would parse the actual item structure from InnerTube
    // For now, return a placeholder
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Icon(Icons.music_note)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Item Title',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'Artist Name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
