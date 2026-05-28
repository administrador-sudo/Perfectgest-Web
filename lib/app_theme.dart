import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'metallic_style.dart';

const String kWhatsAppDigits = '5551989045442';
const String kEmailSac = 'sac.perfectgest@gmail.com';

/// Tema **escuro metálico** (carvão, ouro, prata, cobre).
ThemeData buildPerfectProDarkTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: MetallicPalette.goldWarm,
      onPrimary: MetallicPalette.charcoalDeep,
      secondary: MetallicPalette.copper,
      onSecondary: MetallicPalette.silverLight,
      surface: MetallicPalette.panel,
      onSurface: MetallicPalette.silverLight,
      surfaceContainerHighest: MetallicPalette.panelHighlight,
      outline: Color(0x66FFD54F),
      outlineVariant: Color(0x44B0B0B0),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );

  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: MetallicPalette.silverLight,
      displayColor: MetallicPalette.silverLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: MetallicPalette.charcoalDeep.withValues(alpha: 0.92),
      foregroundColor: MetallicPalette.silverLight,
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: MetallicPalette.charcoalDeep.withValues(alpha: 0.96),
      indicatorColor: MetallicPalette.gold.withValues(alpha: 0.22),
      labelTextStyle: WidgetStatePropertyAll(
        GoogleFonts.inter(fontSize: 11, color: MetallicPalette.silverMid),
      ),
    ),
  );
}

/// Tema **claro tradicional** (fundo claro, primária teal/ciano).
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
    navigationBarTheme: const NavigationBarThemeData(),
  );
}
