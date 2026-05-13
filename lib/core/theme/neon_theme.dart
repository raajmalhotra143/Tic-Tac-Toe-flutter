import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeonColors {
  static const Color primary = Color(0xFF00E5FF);
  static const Color backgroundDark = Color(0xFF0A161E);
  static const Color backgroundLight = Color(0xFFF5F8F8);
  static const Color cardDark = Color(0x1A00E5FF); // primary/10
  static const Color borderDark = Color(0x3300E5FF); // primary/20
  static const Color surfaceDark = Color(0xFF0C2227);
}

extension NeonEffects on BoxDecoration {
  static BoxDecoration neonBox({
    Color color = NeonColors.primary,
    double blurRadius = 15.0,
    double spreadRadius = 1.0,
    double borderRadius = 12.0,
    bool filled = false,
  }) {
    return BoxDecoration(
      color: filled ? color.withValues(alpha: 0.1) : Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      boxShadow: [
        BoxShadow(
          color: color.withValues(alpha: 0.2),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
      ],
    );
  }

  static BoxDecoration glassPanel({
    double borderRadius = 12.0,
  }) {
    return BoxDecoration(
      color: const Color(0x990A161E), // rgba(10, 22, 30, 0.6)
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: NeonColors.primary.withValues(alpha: 0.2), width: 1),
    );
  }
}

class NeonTheme {
  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.spaceGrotesk(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: -1.5,
    ),
    displayMedium: GoogleFonts.spaceGrotesk(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.spaceGrotesk(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.spaceGrotesk(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.spaceGrotesk(
      fontSize: 16,
      color: Colors.white.withValues(alpha: 0.9),
    ),
    bodyMedium: GoogleFonts.spaceGrotesk(
      fontSize: 14,
      color: Colors.white.withValues(alpha: 0.7),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: NeonColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: NeonColors.primary,
      surface: NeonColors.backgroundDark,
      onSurface: Colors.white,
    ),
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: _textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: NeonColors.backgroundDark,
        backgroundColor: NeonColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        elevation: 0,
      ),
    ),
  );
}
