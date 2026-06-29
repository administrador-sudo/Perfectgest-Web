import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'company_legal.dart';
import 'site_web_image.dart';

/// Largura útil do hero: 50% do bloco, com fallback se constraints forem ilimitadas.
double siteHeroWordmarkWidth(BuildContext context, BoxConstraints constraints) {
  const blockPadding = 52.0; // SiteRaisedBlock padding horizontal (26×2)
  const outerPadding = 48.0; // Padding L/R do HeroSection (24×2)
  final viewport = MediaQuery.sizeOf(context).width;
  final maxBlock = constraints.maxWidth.isFinite && constraints.maxWidth > 0
      ? constraints.maxWidth
      : (viewport - outerPadding - blockPadding).clamp(280.0, viewport);
  return maxBlock * 0.5;
}

/// Imagem PERFECTGESTDEV — 50% da largura do bloco, centrada no topo.
class SiteHeroWordmark extends StatelessWidget {
  const SiteHeroWordmark({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = siteHeroWordmarkWidth(context, constraints);
        final height = width / kSiteHeroWordmarkAspectRatio;

        final image = siteWebOrAssetImage(
          assetPath: kSiteHeroWordmarkAsset,
          webPath: kSiteHeroWordmarkWebPath,
          width: width,
          height: height,
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            if (kDebugMode) {
              debugPrint('SiteHeroWordmark: falha — $error');
            }
            return SizedBox(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.45),
                  ),
                ),
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: height * 0.35,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
              ),
            );
          },
        );

        final child = onTap == null
            ? image
            : Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: image,
                  ),
                ),
              );

        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        );
      },
    );
  }
}
