import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_theme.dart';
import 'company_legal_policy_footer.dart';
import 'metallic_site_shell.dart';
import 'site_language_menu.dart';
import 'l10n/app_localizations.dart';
import 'l10n/site_returns_policy_texts.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
/// Política de devolução/reembolso (site vitrine) — alinhada ao Merchant Center.
class PoliticaDevolucaoPage extends StatefulWidget {
  const PoliticaDevolucaoPage({super.key, this.onToggleTheme});

  final VoidCallback? onToggleTheme;

  @override
  State<PoliticaDevolucaoPage> createState() => _PoliticaDevolucaoPageState();
}

class _PoliticaDevolucaoPageState extends State<PoliticaDevolucaoPage> {
  @override
  void initState() {
    super.initState();
    // Reutiliza meta tags da página institucional de política.
    seo_meta.applyPoliticaSeoMetaTags();
  }

  @override
  void dispose() {
    seo_meta.restoreGlobalSeoMetaTags();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    final l10n = AppLocalizations.of(context);
    final st = SiteReturnsPolicyTexts.of(context);
    return Semantics(
      label: st.semanticsLabel,
      child: Scaffold(
        backgroundColor: siteScaffoldBackground(context),
        appBar: sitePolicyAppBar(
          context,
          title: st.appBarTitle,
          onToggleTheme: widget.onToggleTheme,
        ),
        body: SiteBackgroundShell(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bodyW = constraints.hasBoundedWidth && constraints.maxWidth.isFinite
                  ? constraints.maxWidth
                  : MediaQuery.sizeOf(context).width;
              final maxW = (bodyW < 720 ? bodyW : 720.0).clamp(200.0, 720.0);
              return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(padH, 16, padH, 28),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxW),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        st.brandLabel,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: cs.primary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        st.docHeadline,
                        style: GoogleFonts.inter(
                          fontSize: w < 400 ? 18 : 22,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                          color: cs.onSurface,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        st.introContactLine(kEmailSac),
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          height: 1.45,
                          color: cs.onSurface.withValues(alpha: 0.72),
                        ),
                      ),
                      const SizedBox(height: 22),
                      _PolicySection(title: st.section1Title, body: st.section1Body),
                      _PolicySection(title: st.section2Title, body: st.section2Body),
                      _PolicySection(title: st.section3Title, body: st.section3Body),
                      _PolicySection(
                        title: st.section4Title,
                        body: st.section4Body,
                        links: [
                          _PolicyLink(
                            label: kEmailSac,
                            onTap: () => launchUrl(
                              Uri.parse('mailto:$kEmailSac'),
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const CompanyLegalPolicyFooter(),
                      const SizedBox(height: 28),
                      Text(
                        l10n.aboutFooterCopyright(DateTime.now().year),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: cs.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      if (kIsWeb) const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            );
            },
          ),
        ),
      ),
    );
  }
}

class _PolicySection extends StatelessWidget {
  const _PolicySection({required this.title, required this.body, this.links});

  final String title;
  final String body;
  final List<_PolicyLink>? links;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outline.withValues(alpha: 0.45)),
        ),
        child: Padding(
          padding: EdgeInsets.all(w < 400 ? 14 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                body,
                style: GoogleFonts.inter(
                  fontSize: 13.5,
                  height: 1.55,
                  color: cs.onSurface.withValues(alpha: 0.8),
                ),
              ),
              if (links != null && links!.isNotEmpty) ...[
                const SizedBox(height: 10),
                Wrap(spacing: 10, runSpacing: 6, children: links!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _PolicyLink extends StatelessWidget {
  const _PolicyLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
    );
  }
}

