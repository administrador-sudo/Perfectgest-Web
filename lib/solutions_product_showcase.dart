import 'package:flutter/material.dart';

import 'metallic_site_shell.dart';

/// Tipografia e layout estilo Microsoft Fluent para cada app na secção Soluções.
class SolutionsProductShowcase extends StatelessWidget {
  const SolutionsProductShowcase({
    super.key,
    required this.appName,
    required this.platformLabel,
    required this.tagline,
    required this.description,
    required this.devices,
    required this.actions,
  });

  final String appName;
  final String platformLabel;
  final String tagline;
  final String description;
  final Widget devices;
  final Widget actions;

  static const double _wideBreakpoint = 840;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < _wideBreakpoint;
        final textBlock = Semantics(
          label: '$appName. $platformLabel. $tagline',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              siteMetallicGoldText(
                context,
                appName,
                fontSize: compact ? 24 : 28,
                fontWeight: FontWeight.w600,
                height: 1.15,
                letterSpacing: -0.4,
                fallbackColor: cs.onSurface,
              ),
              const SizedBox(height: 4),
              siteMetallicGoldText(
                context,
                platformLabel,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.3,
                letterSpacing: 0.2,
                compact: true,
                fallbackColor: cs.onSurface.withValues(alpha: 0.62),
              ),
              const SizedBox(height: 8),
              siteMetallicGoldText(
                context,
                tagline,
                fontSize: compact ? 16 : 18,
                height: 1.35,
                compact: tagline.length > 40,
                fallbackColor: cs.primary,
              ),
              const SizedBox(height: 14),
              siteMetallicGoldText(
                context,
                description,
                fontSize: 15,
                height: 1.55,
                compact: true,
                fallbackColor: cs.onSurface.withValues(alpha: 0.78),
              ),
              const SizedBox(height: 20),
              actions,
            ],
          ),
        );

        return DecoratedBox(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.65)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(compact ? 20 : 28, compact ? 22 : 28, compact ? 20 : 28, compact ? 22 : 28),
            child: compact
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textBlock,
                      const SizedBox(height: 24),
                      devices,
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: textBlock),
                      const SizedBox(width: 32),
                      Expanded(flex: 6, child: devices),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
