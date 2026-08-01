library ytmusic_client.core.presentation.theme;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ThemeProvider');

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class AppTheme {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ColorScheme lightScheme;
  final ColorScheme darkScheme;
  final Color? seedColor;

  AppTheme({
    required this.lightTheme,
    required this.darkTheme,
    required this.lightScheme,
    required this.darkScheme,
    this.seedColor,
  });

  static AppTheme defaultTheme() {
    final seed = const Color(0xFFDB4437); // YouTube red
    final lightScheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);
    final darkScheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark);
    
    return AppTheme(
      lightTheme: _buildTheme(lightScheme),
      darkTheme: _buildTheme(darkScheme),
      lightScheme: lightScheme,
      darkScheme: darkScheme,
      seedColor: seed,
    );
  }

  static ThemeData _buildTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerHighest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        indicatorColor: scheme.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: scheme.primary, fontWeight: FontWeight.w600);
          }
          return TextStyle(color: scheme.onSurfaceVariant);
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: scheme.primary,
        inactiveTrackColor: scheme.primaryContainer,
        thumbColor: scheme.primary,
        overlayColor: scheme.primary.withValues(alpha: 0.12),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.primaryContainer,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerHighest,
        selectedColor: scheme.primaryContainer,
        labelStyle: TextStyle(color: scheme.onSurface),
        secondaryLabelStyle: TextStyle(color: scheme.onPrimaryContainer),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
      ),
    );
  }

  AppTheme copyWith({Color? seedColor}) {
    if (seedColor == null || seedColor == this.seedColor) return this;
    
    final lightScheme = ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light);
    final darkScheme = ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark);
    
    return AppTheme(
      lightTheme: _buildTheme(lightScheme),
      darkTheme: _buildTheme(darkScheme),
      lightScheme: lightScheme,
      darkScheme: darkScheme,
      seedColor: seedColor,
    );
  }
}

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme.defaultTheme());

  Future<void> updateSeedColor(Color color) async {
    state = state.copyWith(seedColor: color);
  }

  Future<void> extractFromImage(String imageUrl) async {
    try {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
      );
      
      final vibrant = paletteGenerator.vibrantColor?.color ??
                      paletteGenerator.dominantColor?.color ??
                      paletteGenerator.mutedColor?.color;
      
      if (vibrant != null) {
        await updateSeedColor(vibrant);
      }
    } catch (e) {
      _logger.warning('Failed to extract color from image: $e');
    }
  }

  void resetToDefault() {
    state = AppTheme.defaultTheme();
  }
}

extension ColorExtension on Color {
  Color withAlpha(int alpha) {
    return Color.fromRGBO(red, green, blue, alpha / 255);
  }
}