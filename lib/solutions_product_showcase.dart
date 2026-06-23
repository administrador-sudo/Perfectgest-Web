import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  TextStyle _appNameStyle(BuildContext context, {required bool compact}) {
    final cs = Theme.of(context).colorScheme;
    return GoogleFonts.inter(
      fontSize: compact ? 24 : 28,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      height: 1.15,
      color: cs.onSurface,
    );
  }

  TextStyle _platformLabelStyle(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      height: 1.3,
      color: cs.onSurface.withValues(alpha: 0.62),
    );
  }

  TextStyle _taglineStyle(BuildContext context, {required bool compact}) {
    final cs = Theme.of(context).colorScheme;
    return GoogleFonts.inter(
      fontSize: compact ? 16 : 18,
      fontWeight: FontWeight.w400,
      height: 1.35,
      color: cs.primary,
    );
  }

  TextStyle _bodyStyle(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.55,
      color: cs.onSurface.withValues(alpha: 0.78),
    );
  }

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
              Text(appName, style: _appNameStyle(context, compact: compact)),
              const SizedBox(height: 4),
              Text(platformLabel, style: _platformLabelStyle(context)),
              const SizedBox(height: 8),
              Text(tagline, style: _taglineStyle(context, compact: compact)),
              const SizedBox(height: 14),
              Text(description, style: _bodyStyle(context)),
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
