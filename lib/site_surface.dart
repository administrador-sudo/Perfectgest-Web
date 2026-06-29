import 'package:flutter/material.dart';

import 'brand_palette.dart';
import 'metallic_style.dart';

/// Cinza escovado do escudo / placa metálica do logo.
Color sitePageBackgroundColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? BrandPalette.shieldGray : BrandPalette.shieldGrayLight;
}

Color siteRaisedPanelColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark ? BrandPalette.shieldGrayPanel : BrandPalette.shieldGrayPanelLight;
}

/// Fundo uniforme cinza escudo (substitui radial ouro no corpo do site).
class SiteShieldBackground extends StatelessWidget {
  const SiteShieldBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: sitePageBackgroundColor(context),
        gradient: isDark
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  BrandPalette.shieldGrayHighlight,
                  BrandPalette.shieldGray,
                  BrandPalette.shieldGrayDark,
                ],
                stops: [0.0, 0.45, 1.0],
              )
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  BrandPalette.shieldGrayPanelLight,
                  BrandPalette.shieldGrayLight,
                ],
              ),
      ),
      child: isDark ? const MetallicBrushedOverlay(density: 0.35) : const SizedBox.shrink(),
    );
  }
}

/// Sombra dourada + profundidade 3D para cartões/blocos.
List<BoxShadow> siteRaisedGoldShadows({
  double lift = 1.0,
  double goldIntensity = 1.0,
}) {
  final g = goldIntensity.clamp(0.0, 1.5);
  final l = lift.clamp(0.0, 2.0);
  return [
    BoxShadow(
      color: BrandPalette.gold.withValues(alpha: 0.38 * g),
      blurRadius: 22 * l,
      spreadRadius: 0.5,
      offset: Offset(0, 10 * l),
    ),
    BoxShadow(
      color: BrandPalette.goldWarm.withValues(alpha: 0.28 * g),
      blurRadius: 14 * l,
      spreadRadius: -1,
      offset: Offset(0, 5 * l),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.55),
      blurRadius: 18 * l,
      spreadRadius: -2,
      offset: Offset(0, 8 * l),
    ),
    BoxShadow(
      color: BrandPalette.silverPeak.withValues(alpha: 0.06),
      blurRadius: 2,
      offset: const Offset(0, -1),
    ),
  ];
}

BoxDecoration siteRaisedPanelDecoration(
  BuildContext context, {
  double radius = 18,
  double lift = 1.0,
  double goldIntensity = 1.0,
  Color? borderColor,
}) {
  final cs = Theme.of(context).colorScheme;
  return BoxDecoration(
    color: siteRaisedPanelColor(context),
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: borderColor ?? cs.outline.withValues(alpha: 0.35),
      width: 1,
    ),
    boxShadow: siteRaisedGoldShadows(lift: lift, goldIntensity: goldIntensity),
  );
}

/// Bloco elevado reutilizável (hero, secções).
class SiteRaisedBlock extends StatelessWidget {
  const SiteRaisedBlock({
    super.key,
    required this.child,
    this.radius = 20,
    this.padding = const EdgeInsets.all(26),
    this.lift = 1.0,
    this.goldIntensity = 1.0,
    this.borderColor,
  });

  final Widget child;
  final double radius;
  final EdgeInsets padding;
  final double lift;
  final double goldIntensity;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: siteRaisedPanelDecoration(
        context,
        radius: radius,
        lift: lift,
        goldIntensity: goldIntensity,
        borderColor: borderColor,
      ),
      child: child,
    );
  }
}
