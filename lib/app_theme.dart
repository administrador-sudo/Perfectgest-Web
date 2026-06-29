import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'brand_palette.dart';
import 'company_legal.dart';

const String kWhatsAppDigits = '5551989045442';

/// Alias histórico — contacto único alinhado a suporte e verificação empresarial.
const String kEmailSac = kCompanyContactEmail;

/// Tema **escuro metálico** (carvão, ouro, prata — logo PerfectGestDev).
ThemeData buildPerfectProDarkTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: BrandPalette.buildDarkScheme(),
    scaffoldBackgroundColor: Colors.transparent,
  );

  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: BrandPalette.silverLight,
      displayColor: BrandPalette.silverLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: BrandPalette.charcoalDeep.withValues(alpha: 0.92),
      foregroundColor: BrandPalette.silverLight,
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: BrandPalette.charcoalDeep.withValues(alpha: 0.96),
      indicatorColor: BrandPalette.gold.withValues(alpha: 0.22),
      labelTextStyle: WidgetStatePropertyAll(
        GoogleFonts.inter(fontSize: 11, color: BrandPalette.silverMid),
      ),
    ),
  );
}

/// Tema **claro suave** (cinza prata + ouro legível — sem teal).
ThemeData buildPerfectProLightTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: BrandPalette.buildLightScheme(),
    scaffoldBackgroundColor: BrandPalette.lightScaffold,
  );

  return base.copyWith(
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: BrandPalette.lightOnSurface,
      displayColor: BrandPalette.lightOnSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: BrandPalette.lightSurface.withValues(alpha: 0.96),
      foregroundColor: BrandPalette.lightOnSurface,
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: BrandPalette.lightSurface.withValues(alpha: 0.98),
      indicatorColor: BrandPalette.goldDim.withValues(alpha: 0.18),
      labelTextStyle: WidgetStatePropertyAll(
        GoogleFonts.inter(fontSize: 11, color: BrandPalette.silverDark),
      ),
    ),
  );
}
