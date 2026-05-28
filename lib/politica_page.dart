import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_theme.dart';
import 'metallic_site_shell.dart';
import 'site_language_menu.dart';
import 'l10n/app_localizations.dart';
import 'l10n/site_policy_privacy_texts.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'tecnologias_page.dart';
import 'web_cookie_consent_stub.dart' if (dart.library.html) 'web_cookie_consent_web.dart' as cookie_consent;

/// Política própria PerfectGest: privacidade, dados, cookies e termos (alinhado a boas práticas Google para sites e medição).
class PoliticaPrivacidadePage extends StatefulWidget {
  const PoliticaPrivacidadePage({super.key, this.onToggleTheme});

  final VoidCallback? onToggleTheme;

  @override
  State<PoliticaPrivacidadePage> createState() => _PoliticaPrivacidadePageState();
}

class _PoliticaPrivacidadePageState extends State<PoliticaPrivacidadePage> {
  @override
  void initState() {
    super.initState();
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
    final st = SitePolicyPrivacyTexts.of(context);
    return Semantics(
      label: st.semanticsLabel,
      child: Scaffold(
        backgroundColor: siteScaffoldBackground(context),
        appBar: sitePolicyAppBar(
          context,
          title: st.appBarTitle,
          onToggleTheme: widget.onToggleTheme,
          onBack: () => Navigator.of(context).pop(),
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
                        style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700, color: cs.primary, letterSpacing: 0.4),
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
                        style: GoogleFonts.inter(fontSize: 13, height: 1.45, color: cs.onSurface.withValues(alpha: 0.72)),
                      ),
                      const SizedBox(height: 22),
                      _PoliticaSection(
                        title: st.section1Title,
                        body: st.section1Body,
                      ),
                      _PoliticaSection(
                        title: st.section2Title,
                        body: st.section2Body,
                      ),
                      _PoliticaSection(
                        title: st.section3Title,
                        body: st.section3Body,
                      ),
                      _PoliticaSection(
                        title: st.section4Title,
                        body: st.section4Body,
                        links: [
                          _PoliticaLink(l10n.footerLinkGooglePrivacy, url: 'https://policies.google.com/privacy'),
                          _PoliticaLink(l10n.footerLinkGoogleCookies, url: 'https://policies.google.com/technologies/cookies'),
                          _PoliticaLink(
                            l10n.portBtnPartners,
                            onTap: () {
                              Navigator.of(context).push<void>(
                                MaterialPageRoute<void>(builder: (_) => const TecnologiasPage()),
                              );
                            },
                          ),
                        ],
                      ),
                      _PoliticaSection(
                        title: st.section5Title,
                        body: st.section5Body,
                      ),
                      _PoliticaSection(
                        title: st.section6Title,
                        body: st.section6Body(kEmailSac),
                      ),
                      _PoliticaSection(
                        title: st.section7Title,
                        body: st.section7Body,
                      ),
                      const SizedBox(height: 20),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: cs.primaryContainer.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: cs.outline.withValues(alpha: 0.45)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(w < 400 ? 14 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                st.cookieMeasurementTitle,
                                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: cs.onSurface),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                st.cookieMeasurementBody,
                                style: GoogleFonts.inter(fontSize: 12.5, height: 1.45, color: cs.onSurface.withValues(alpha: 0.8)),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: w < 480 ? double.infinity : null,
                                child: FilledButton.icon(
                                  onPressed: () {
                                    cookie_consent.grantAnalyticsMeasurementConsent();
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(st.snackPreferenceSavedOnce),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.check_circle_outline, size: 20),
                                  label: Text(
                                    w < 360 ? st.acceptMeasurementShort : st.acceptMeasurementLong,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        l10n.aboutFooterCopyright(DateTime.now().year),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 12, color: cs.onSurface.withValues(alpha: 0.65)),
                      ),
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

class _PoliticaLink {
  _PoliticaLink(this.label, {this.url, this.onTap})
      : assert(url != null || onTap != null, 'Informe url ou ação interna.');
  final String label;
  final String? url;
  final VoidCallback? onTap;
}

class _PoliticaSection extends StatelessWidget {
  const _PoliticaSection({required this.title, required this.body, this.links = const []});

  final String title;
  final String body;
  final List<_PoliticaLink> links;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final mqW = MediaQuery.sizeOf(context).width;
    final padH = mqW < 400 ? 12.0 : 16.0;
    final stackLinks = mqW < 440;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Semantics(
        container: true,
        label: title,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: cs.outline.withValues(alpha: 0.4)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(padH, 16, padH, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: mqW < 360 ? 15 : 16,
                    fontWeight: FontWeight.w700,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  body,
                  style: GoogleFonts.inter(
                    fontSize: mqW < 360 ? 13 : 14,
                    height: 1.55,
                    color: cs.onSurface.withValues(alpha: 0.88),
                  ),
                ),
                if (links.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  if (stackLinks)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 0; i < links.length; i++) ...[
                          if (i > 0) const SizedBox(height: 4),
                          TextButton(
                            style: TextButton.styleFrom(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              final onTap = links[i].onTap;
                              final url = links[i].url;
                              if (onTap != null) {
                                onTap();
                                return;
                              }
                              if (url == null) return;
                              launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                                webOnlyWindowName: kIsWeb ? '_blank' : null,
                              );
                            },
                            child: Text(
                              links[i].label,
                              style: GoogleFonts.inter(fontSize: mqW < 360 ? 12.5 : 13),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ],
                    )
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: links
                          .map(
                            (l) => TextButton(
                              onPressed: () {
                                final onTap = l.onTap;
                                final url = l.url;
                                if (onTap != null) {
                                  onTap();
                                  return;
                                }
                                if (url == null) return;
                                launchUrl(
                                  Uri.parse(url),
                                  mode: LaunchMode.externalApplication,
                                  webOnlyWindowName: kIsWeb ? '_blank' : null,
                                );
                              },
                              child: Text(l.label, style: GoogleFonts.inter(fontSize: 13)),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
