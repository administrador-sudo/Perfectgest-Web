import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

/// Logo PerfectGest conforme tema claro/escuro.
class SiteBrandLogo extends StatelessWidget {
  const SiteBrandLogo({super.key, this.height = 40, this.width = 40});

  final double height;
  final double width;

  static const String assetLight = 'imagens/logo_perfectgest_light.png';
  static const String assetDark = 'imagens/logo_perfectgest_dark.png';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final asset = isDark ? assetDark : assetLight;
    final fallback = isDark ? assetLight : assetDark;
    final l10n = AppLocalizations.of(context);

    return Semantics(
      image: true,
      label: l10n.siteBrandLogoSemantics,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          asset,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            fallback,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.shield_rounded, color: cs.primary, size: height * 0.72),
          ),
        ),
      ),
    );
  }
}
