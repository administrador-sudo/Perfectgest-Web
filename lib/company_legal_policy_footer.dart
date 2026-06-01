import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'company_legal.dart';
import 'l10n/site_returns_policy_texts.dart';

/// Identificação completa da LTDA no fim de páginas legais (ex.: política de devolução).
class CompanyLegalPolicyFooter extends StatelessWidget {
  const CompanyLegalPolicyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final st = SiteReturnsPolicyTexts.of(context);
    final bodyStyle = GoogleFonts.inter(
      fontSize: 11.5,
      height: 1.4,
      color: cs.onSurface.withValues(alpha: 0.72),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kCompanyLegalName,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: cs.onSurface.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 4),
        Text('${st.footerCnpjLabel} $kCompanyCnpj', style: bodyStyle),
        const SizedBox(height: 2),
        Text('${st.footerContactLabel} $kCompanyContactPhone', style: bodyStyle),
        const SizedBox(height: 2),
        Text(kCompanyAddressLine, style: bodyStyle),
      ],
    );
  }
}
