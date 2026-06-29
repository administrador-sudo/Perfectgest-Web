import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'metallic_style.dart';
import 'site_brand_logo.dart';
import 'site_surface.dart';

/// Tema metálico activo apenas no modo escuro.
bool useMetallicPresentation(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

/// Fundo cinza escudo + conteúdo.
class SiteBackgroundShell extends StatelessWidget {
  const SiteBackgroundShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const SiteShieldBackground(),
        child,
      ],
    );
  }
}

@Deprecated('Use SiteBackgroundShell')
class MetallicSiteShell extends StatelessWidget {
  const MetallicSiteShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => SiteBackgroundShell(child: child);
}

/// Painel de secção: polido (escuro) ou cartão clássico (claro).
class SiteSectionPanel extends StatelessWidget {
  const SiteSectionPanel({
    super.key,
    required this.child,
    this.radius = 18,
    this.padding = const EdgeInsets.all(22),
  });

  final Widget child;
  final double radius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: siteRaisedPanelDecoration(context, radius: radius),
      child: child,
    );
  }
}

enum MetallicAccent { silver, gold, copper }

MetallicAccent metallicAccentFor(String key) =>
    MetallicAccent.values[key.hashCode.abs() % MetallicAccent.values.length];

Widget siteSectionTitle(
  BuildContext context,
  String title, {
  String? accentKey,
  double fontSize = 22,
}) {
  if (useMetallicPresentation(context)) {
    switch (metallicAccentFor(accentKey ?? title)) {
      case MetallicAccent.silver:
        return metallicChromeText(title, fontSize: fontSize, lift: 2.8);
      case MetallicAccent.gold:
        return metallicGoldText(title, fontSize: fontSize, lift: 2.8);
      case MetallicAccent.copper:
        return metallicCopperText(title, fontSize: fontSize, lift: 2.8);
    }
  }
  return Text(
    title,
    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: fontSize,
          color: Theme.of(context).colorScheme.onSurface,
        ),
  );
}

TextStyle siteBodyTextStyle(
  BuildContext context, {
  double fontSize = 15,
  double height = 1.5,
}) {
  if (useMetallicPresentation(context)) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      height: height,
      color: MetallicPalette.silverLight.withValues(alpha: 0.92),
      shadows: metallicRaisedTextShadows(lift: 0.6),
    );
  }
  final cs = Theme.of(context).colorScheme;
  return GoogleFonts.inter(
    fontSize: fontSize,
    height: height,
    color: cs.onSurface.withValues(alpha: 0.85),
  );
}

/// Logo + marca no hero (brasão canónico PerfectGestDev).
Widget siteHeroBrandTitle(
  BuildContext context, {
  required bool compact,
}) {
  final logoHeight = compact ? 96.0 : 128.0;
  return SiteBrandLogo(height: logoHeight, fullLogo: true);
}

Widget sitePrimaryActionButton({
  required BuildContext context,
  required String label,
  required VoidCallback onPressed,
  IconData? icon,
}) {
  if (useMetallicPresentation(context)) {
    return metallicPolishedButton(label: label, onPressed: onPressed);
  }
  final cs = Theme.of(context).colorScheme;
  if (icon != null) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
  return FilledButton(
    style: FilledButton.styleFrom(
      backgroundColor: cs.primary,
      foregroundColor: cs.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
    ),
    onPressed: onPressed,
    child: Text(label),
  );
}

Color siteHeaderBackground(BuildContext context) {
  final base = sitePageBackgroundColor(context);
  return base.withValues(alpha: 0.94);
}

Color siteHeaderBorderColor(BuildContext context) {
  if (useMetallicPresentation(context)) {
    return MetallicPalette.gold.withValues(alpha: 0.38);
  }
  return Theme.of(context).colorScheme.primary.withValues(alpha: 0.35);
}

Color siteHeaderNavLabelColor(BuildContext context) {
  if (useMetallicPresentation(context)) {
    return MetallicPalette.silverLight.withValues(alpha: 0.92);
  }
  return Theme.of(context).colorScheme.onSurface;
}

Color siteAppBarBackground(BuildContext context) {
  return sitePageBackgroundColor(context).withValues(alpha: 0.96);
}

Color? siteScaffoldBackground(BuildContext context) {
  return sitePageBackgroundColor(context);
}
