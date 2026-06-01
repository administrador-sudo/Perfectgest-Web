import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'company_legal.dart';
import 'l10n/app_localizations.dart';

/// Identificação da LTDA no rodapé — razão social e localização.
class CompanyLegalStrip extends StatelessWidget {
  const CompanyLegalStrip({super.key, this.dense = false});

  /// Menos altura (rodapé fixo em Sobre).
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final nameSize = dense ? 11.5 : 12.5;
    final bodySize = dense ? 10.5 : 11.5;
    final gap = dense ? 2.0 : 4.0;
    final bodyStyle = GoogleFonts.inter(
      fontSize: bodySize,
      height: 1.35,
      color: cs.onSurface.withValues(alpha: 0.78),
    );

    return Semantics(
      label: l10n.footerCompanyLegalSemantics,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            kCompanyLegalName,
            style: GoogleFonts.inter(
              fontSize: nameSize,
              fontWeight: FontWeight.w700,
              height: 1.25,
              color: cs.onSurface.withValues(alpha: 0.9),
            ),
          ),
          SizedBox(height: gap),
          Text(
            kCompanyAddressLine,
            style: bodyStyle,
            maxLines: dense ? 2 : 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
