import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'company_legal.dart';
import 'l10n/app_localizations.dart';

/// Identificação da LTDA no rodapé (home e Sobre) — alinhado à verificação Play Console.
class CompanyLegalStrip extends StatelessWidget {
  const CompanyLegalStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final bodyStyle = GoogleFonts.inter(
      fontSize: 12,
      height: 1.45,
      color: cs.onSurface.withValues(alpha: 0.78),
    );

    return Semantics(
      label: l10n.footerCompanyLegalSemantics,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            kCompanyLegalName,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              height: 1.35,
              color: cs.onSurface.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 6),
          Text(kCompanyAddressLine, textAlign: TextAlign.center, style: bodyStyle),
          if (kCompanyCnpj.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              '${l10n.footerCompanyCnpjLabel} $kCompanyCnpj',
              textAlign: TextAlign.center,
              style: bodyStyle,
            ),
          ],
          if (kCompanyDuns.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              '${l10n.footerCompanyDunsLabel} $kCompanyDuns',
              textAlign: TextAlign.center,
              style: bodyStyle,
            ),
          ],
          const SizedBox(height: 4),
          Text(
            '${l10n.footerCompanyContactLabel} $kCompanyContactEmail',
            textAlign: TextAlign.center,
            style: bodyStyle,
          ),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              TextButton(
                onPressed: () => launchUrl(
                  Uri.parse('mailto:$kCompanyContactEmail'),
                  mode: LaunchMode.externalApplication,
                ),
                child: Text(l10n.footerCompanyEmailBtn, style: GoogleFonts.inter(fontSize: 12.5)),
              ),
              TextButton(
                onPressed: () => launchUrl(
                  Uri.parse(kCompanyFaqUrl),
                  mode: LaunchMode.externalApplication,
                  webOnlyWindowName: '_blank',
                ),
                child: Text(l10n.footerLinkAppFaq, style: GoogleFonts.inter(fontSize: 12.5)),
              ),
              TextButton(
                onPressed: () => launchUrl(
                  Uri.parse(kCompanyPrivacyUrl),
                  mode: LaunchMode.externalApplication,
                  webOnlyWindowName: '_blank',
                ),
                child: Text(l10n.footerLinkAppPrivacy, style: GoogleFonts.inter(fontSize: 12.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
