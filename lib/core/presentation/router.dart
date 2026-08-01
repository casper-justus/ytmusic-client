library ytmusic_client.core.presentation.router;

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/library/presentation/library_screen.dart';
import '../../features/artist/presentation/artist_screen.dart';
import '../../features/album/presentation/album_screen.dart';
import '../../features/playlist/presentation/playlist_screen.dart';
import '../../features/player/presentation/player_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../shared/widgets/mini_player.dart';

final _logger = Logger('AppRouter');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithMiniPlayer(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: '/library',
            name: 'library',
            builder: (context, state) => const LibraryScreen(),
          ),
          GoRoute(
            path: '/artist/:artistId',
            name: 'artist',
            builder: (context, state) => ArtistScreen(
              artistId: state.pathParameters['artistId']!,
            ),
          ),
          GoRoute(
            path: '/album/:browseId',
            name: 'album',
            builder: (context, state) => AlbumScreen(
              browseId: state.pathParameters['browseId']!,
            ),
          ),
          GoRoute(
            path: '/playlist/:playlistId',
            name: 'playlist',
            builder: (context, state) => PlaylistScreen(
              playlistId: state.pathParameters['playlistId']!,
            ),
          ),
          GoRoute(
            path: '/player',
            name: 'player',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const PlayerScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.uri}'),
      ),
    ),
  );
});

class ScaffoldWithMiniPlayer extends StatelessWidget {
  final Widget child;
  
  const ScaffoldWithMiniPlayer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          const MiniPlayer(),
        ],
      ),
    );
  }
}