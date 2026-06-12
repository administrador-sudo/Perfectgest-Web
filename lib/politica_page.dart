import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'metallic_site_shell.dart';
import 'site_language_menu.dart';
import 'l10n/app_localizations.dart';
import 'l10n/site_policy_privacy_texts.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'web_cookie_consent_stub.dart' if (dart.library.html) 'web_cookie_consent_web.dart' as cookie_consent;

/// Política própria Perfect Gest Dev: privacidade, dados, cookies e termos do site.
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
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  FilledButton.icon(
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
                                  OutlinedButton(
                                    onPressed: () {
                                      cookie_consent.denyAnalyticsMeasurementConsent();
                                      if (!context.mounted) return;
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(l10n.cookieBtnDeny),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    child: Text(l10n.cookieBtnDeny),
                                  ),
                                ],
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

class _PoliticaSection extends StatelessWidget {
  const _PoliticaSection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final mqW = MediaQuery.sizeOf(context).width;
    final padH = mqW < 400 ? 12.0 : 16.0;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
