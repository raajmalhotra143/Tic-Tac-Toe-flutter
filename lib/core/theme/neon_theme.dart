import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeonColors {
  static const Color deepCharcoal = Color(0xFF0A0A0A);
  static const Color neonCyan = Color(0xFF00FFFF);
  static const Color neonMagenta = Color(0xFFFF00FF);
  static const Color neonLime = Color(0xFF39FF14);
  static const Color bgMid = Color(0xFF121212);
  static const Color bgCard = Color(0xFF1E1E1E);
}

extension NeonEffects on BoxDecoration {
  static BoxDecoration neonBox({
    required Color color,
    double blurRadius = 15.0,
    double spreadRadius = 1.0,
    double borderRadius = 12.0,
  }) {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: color, width: 2),
      boxShadow: [
        BoxShadow(
          color: color.withValues(alpha: 0.5),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.2),
          blurRadius: blurRadius * 2,
          spreadRadius: spreadRadius * 0.5,
        ),
      ],
    );
  }
}

class NeonTheme {
  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.orbitron(
      fontSize: 48,
      fontWeight: FontWeight.w900,
      color: NeonColors.neonCyan,
      letterSpacing: 2,
    ),
    displayMedium: GoogleFonts.orbitron(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: NeonColors.neonMagenta,
    ),
    headlineLarge: GoogleFonts.rajdhani(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.rajdhani(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      letterSpacing: 1.2,
    ),
    bodyLarge: GoogleFonts.rajdhani(
      fontSize: 16,
      color: Colors.white.withValues(alpha: 0.9),
    ),
    bodyMedium: GoogleFonts.rajdhani(
      fontSize: 14,
      color: Colors.white.withValues(alpha: 0.7),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: NeonColors.deepCharcoal,
    colorScheme: const ColorScheme.dark(
      primary: NeonColors.neonCyan,
      secondary: NeonColors.neonMagenta,
      surface: NeonColors.bgMid,
      error: Colors.redAccent,
    ),
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: _textTheme.titleLarge?.copyWith(
        color: NeonColors.neonCyan,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: NeonColors.neonCyan,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.orbitron(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        elevation: 10,
        shadowColor: NeonColors.neonCyan.withValues(alpha: 0.6),
      ),
    ),
  );
}
