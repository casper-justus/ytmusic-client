import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:media_kit/media_kit.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'core/presentation/providers.dart';
import 'core/presentation/router.dart';
import 'core/presentation/theme.dart';
import 'core/domain/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize MediaKit
  MediaKit.ensureInitialized();
  
  // Initialize Just Audio Background
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ytmusic.playback',
    androidNotificationChannelName: 'YTMusic Playback',
    androidNotificationOngoing: true,
  );
  
  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  
  // Run app with ProviderScope
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const YTMusicApp(),
    ),
  );
}

class YTMusicApp extends ConsumerWidget {
  const YTMusicApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeProvider);
    
    return MaterialApp.router(
      title: 'YTMusic',
      debugShowCheckedModeBanner: false,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}