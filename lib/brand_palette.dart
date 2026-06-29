import 'package:flutter/material.dart';

/// Paleta canónica — extraída do logo PerfectGestDev (prata, ouro, carvão).
abstract final class BrandPalette {
  // Carvão / fundos
  static const charcoal = Color(0xFF121212);
  static const charcoalDeep = Color(0xFF030303);
  static const panel = Color(0xFF181818);
  static const panelHighlight = Color(0xFF2C2C2C);

  /// Cinza escovado do escudo / placa metálica (fundo do site).
  static const shieldGray = Color(0xFF3D3D3D);
  static const shieldGrayDark = Color(0xFF323232);
  static const shieldGrayHighlight = Color(0xFF454545);
  static const shieldGrayPanel = Color(0xFF4A4A4A);
  static const shieldGrayLight = Color(0xFFE8E8E8);
  static const shieldGrayPanelLight = Color(0xFFF5F5F5);

  // Prata / chrome
  static const silverPeak = Color(0xFFFFFFFF);
  static const silverLight = Color(0xFFF0F0F0);
  static const silverMid = Color(0xFFA8A8A8);
  static const silverDark = Color(0xFF707070);

  // Ouro / cobre (logo 3D)
  static const gold = Color(0xFFFFD54F);
  static const goldWarm = Color(0xFFD4AF37);
  static const goldDim = Color(0xFF9A7B2F);
  static const goldReadableLight = Color(0xFF7A5F1A);

  static const copper = Color(0xFFCD7F32);
  static const copperBright = Color(0xFFE8A85C);

  // Ambiente (radial fundo)
  static const goldAmbient = Color(0xFF6B4E12);
  static const goldAmbientDeep = Color(0xFF1A1408);

  // Modo claro suave
  static const lightScaffold = Color(0xFFF4F4F5);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceHigh = Color(0xFFECECEC);
  static const lightOnSurface = Color(0xFF1A1A1A);

  // Shell estático (HTML)
  static const shellThemeColor = '#121212';
  static const shellGoldAccent = '#D4AF37';
  static const shellSilverText = '#E8F0F0';

  /// Cores para animação cíclica do hero (prata ↔ ouro).
  static const List<Color> heroGlowCycle = [
    silverPeak,
    silverLight,
    gold,
    goldWarm,
  ];

  /// Interpola cor de glow do hero com fase [0, 1).
  static Color heroGlowAt(double phase) {
    final t = phase.clamp(0.0, 1.0) * heroGlowCycle.length;
    final index = t.floor() % heroGlowCycle.length;
    final next = (index + 1) % heroGlowCycle.length;
    final local = t - t.floor();
    return Color.lerp(heroGlowCycle[index], heroGlowCycle[next], local)!;
  }

  /// Gradiente rotativo prata → ouro para ShaderMask do hero.
  static LinearGradient heroTitleGradient({double angle = 0}) {
    return LinearGradient(
      colors: const [
        silverPeak,
        silverMid,
        gold,
        goldWarm,
        silverLight,
      ],
      stops: const [0.0, 0.28, 0.52, 0.78, 1.0],
      transform: GradientRotation(angle),
    );
  }

  static const LinearGradient chromeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFE8E8E8),
      Color(0xFF707070),
      Color(0xFF252525),
      Color(0xFFF0F0F0),
      Color(0xFFB8B8B8),
    ],
    stops: [0.0, 0.12, 0.42, 0.62, 0.82, 1.0],
  );

  static const LinearGradient goldGlowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x66FFD54F),
      Color(0x22D4AF37),
      Colors.transparent,
    ],
    stops: [0.0, 0.35, 1.0],
  );

  static ColorScheme buildDarkScheme() {
    return const ColorScheme.dark(
      primary: goldWarm,
      onPrimary: charcoalDeep,
      secondary: copper,
      onSecondary: silverLight,
      surface: shieldGrayPanel,
      onSurface: silverLight,
      surfaceContainerHighest: shieldGrayHighlight,
      outline: Color(0x66FFD54F),
      outlineVariant: Color(0x44B0B0B0),
    );
  }

  static ColorScheme buildLightScheme() {
    return const ColorScheme.light(
      primary: goldReadableLight,
      onPrimary: lightSurface,
      secondary: goldDim,
      onSecondary: lightOnSurface,
      surface: shieldGrayPanelLight,
      onSurface: lightOnSurface,
      surfaceContainerHighest: shieldGrayLight,
      outline: Color(0xFFB8B8B8),
      outlineVariant: Color(0xFFD4D4D4),
    );
  }
}
