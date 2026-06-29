import 'package:flutter/material.dart';

import 'company_legal.dart';
import 'l10n/app_localizations.dart';

/// Brasão PerfectGestDev — emblema (pequeno) ou logo completo (grande).
class SiteBrandLogo extends StatelessWidget {
  const SiteBrandLogo({
    super.key,
    this.height = 40,
    this.width,
    this.fullLogo = false,
  });

  final double height;
  final double? width;
  final bool fullLogo;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final asset = fullLogo ? kSiteBrandLogoAsset : kSiteBrandEmblemAsset;
    final fallback = fullLogo ? kSiteBrandEmblemAsset : kSiteBrandLogoAsset;

    return Semantics(
      image: true,
      label: l10n.siteBrandLogoSemantics,
      child: SizedBox(
        height: height,
        width: width ?? (fullLogo ? null : height),
        child: Image.asset(
          asset,
          height: height,
          width: width,
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
          filterQuality: FilterQuality.medium,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            fallback,
            height: height,
            width: width,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.shield_rounded, color: cs.primary, size: height * 0.72),
          ),
        ),
      ),
    );
  }
}
