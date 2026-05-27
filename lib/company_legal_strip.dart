import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'company_legal.dart';
import 'l10n/app_localizations.dart';

/// Identificação da LTDA (Play Console) — sem links de políticas do app.
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
    final linkStyle = bodyStyle.copyWith(
      color: cs.primary,
      decoration: TextDecoration.underline,
      decorationColor: cs.primary.withValues(alpha: 0.55),
    );

    final metaParts = <Widget>[
      if (kCompanyCnpj.isNotEmpty)
        Text('${l10n.footerCompanyCnpjLabel} $kCompanyCnpj', style: bodyStyle),
      if (kCompanyDuns.isNotEmpty)
        Text('${l10n.footerCompanyDunsLabel} $kCompanyDuns', style: bodyStyle),
      Semantics(
        link: true,
        label: kCompanyContactEmail,
        child: InkWell(
          onTap: () => launchUrl(
            Uri.parse('mailto:$kCompanyContactEmail'),
            mode: LaunchMode.externalApplication,
          ),
          child: Text(kCompanyContactEmail, style: linkStyle),
        ),
      ),
    ];

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
          if (metaParts.isNotEmpty) ...[
            SizedBox(height: gap),
            Wrap(
              spacing: dense ? 6 : 10,
              runSpacing: dense ? 2 : 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (var i = 0; i < metaParts.length; i++) ...[
                  if (i > 0)
                    Text(
                      '·',
                      style: bodyStyle.copyWith(
                        color: cs.onSurface.withValues(alpha: 0.45),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  metaParts[i],
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
