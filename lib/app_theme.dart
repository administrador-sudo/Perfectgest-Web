import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String kWhatsAppDigits = '5551989045442';
const String kEmailSac = 'sac.perfectgest@gmail.com';

ThemeData buildPerfectProDarkTheme() {
  const seed = Color(0xFF00E5FF);
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
      surface: const Color(0xFF1B1B1B),
      surfaceContainerHighest: const Color(0xFF252525),
      outline: const Color(0x4400E5FF),
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
  );

  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
  );
}

ThemeData buildPerfectProLightTheme() {
  const seed = Color(0xFF00B4C8);
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
      primary: const Color(0xFF00838F),
      onPrimary: Colors.white,
      secondary: const Color(0xFF00ACC1),
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: const Color(0xFF0D3A40),
      surfaceContainerHighest: const Color(0xFFE3F4F6),
      outline: const Color(0xFF9AD4DC),
      outlineVariant: const Color(0xFFC8EBF0),
    ),
    scaffoldBackgroundColor: const Color(0xFFF0FAFC),
  );

  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
  );
}
