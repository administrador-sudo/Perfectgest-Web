import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/clinica_iii_legal_texts.dart';
import 'metallic_site_shell.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_language_menu.dart';
import 'site_public_urls.dart';

enum ClinicaIiiLegalPageKind { privacy, terms, healthLgpd }

class ClinicaIiiPrivacyPolicyPage extends StatelessWidget {
  const ClinicaIiiPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _ClinicaIiiLegalPage(
      kind: ClinicaIiiLegalPageKind.privacy,
    );
  }
}

class ClinicaIiiTermsPage extends StatelessWidget {
  const ClinicaIiiTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _ClinicaIiiLegalPage(
      kind: ClinicaIiiLegalPageKind.terms,
    );
  }
}

class ClinicaIiiHealthLgpdPage extends StatelessWidget {
  const ClinicaIiiHealthLgpdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _ClinicaIiiLegalPage(
      kind: ClinicaIiiLegalPageKind.healthLgpd,
    );
  }
}

class _ClinicaIiiLegalPage extends StatelessWidget {
  const _ClinicaIiiLegalPage({required this.kind});

  final ClinicaIiiLegalPageKind kind;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    final lt = ClinicaIiiLegalTexts.of(context);

    final pageTitle = switch (kind) {
      ClinicaIiiLegalPageKind.privacy => lt.privacyTitle,
      ClinicaIiiLegalPageKind.terms => lt.termsTitle,
      ClinicaIiiLegalPageKind.healthLgpd => lt.healthLgpdTitle,
    };
    final sections = switch (kind) {
      ClinicaIiiLegalPageKind.privacy => lt.privacySections,
      ClinicaIiiLegalPageKind.terms => lt.termsSections,
      ClinicaIiiLegalPageKind.healthLgpd => lt.healthLgpdSections,
    };

    final scaffold = Scaffold(
      backgroundColor: siteScaffoldBackground(context),
      appBar: _clinicaIiiLegalAppBar(context, title: pageTitle),
      body: SiteBackgroundShell(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(padH, 16, padH, 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  siteSectionTitle(context, pageTitle, fontSize: w < 400 ? 18 : 22),
                  const SizedBox(height: 8),
                  Text(
                    lt.lastUpdated,
                    style: siteBodyTextStyle(context, fontSize: 13),
                  ),
                  const SizedBox(height: 14),
                  SiteSectionPanel(
                    radius: 14,
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: Text(
                      lt.legalHeaderBody,
                      style: siteBodyTextStyle(context, fontSize: 13.5, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (final s in sections)
                    _ClinicaLegalSection(heading: s.heading, body: s.body),
                  const SizedBox(height: 24),
                  Divider(color: cs.outline.withValues(alpha: 0.6)),
                  const SizedBox(height: 12),
                  _ClinicaIiiFooterLinks(current: kind, lt: lt),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (kIsWeb) return _WebCanonicalRouteScope(child: scaffold);
    return scaffold;
  }
}

PreferredSizeWidget _clinicaIiiLegalAppBar(
  BuildContext context, {
  required String title,
}) {
  final cs = Theme.of(context).colorScheme;
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: siteAppBarBackground(context),
    surfaceTintColor: Colors.transparent,
    title: Text(
      title,
      style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: cs.onSurface),
    ),
    actions: const [SiteLanguageMenuButton()],
  );
}

class _ClinicaIiiFooterLinks extends StatelessWidget {
  const _ClinicaIiiFooterLinks({required this.current, required this.lt});

  final ClinicaIiiLegalPageKind current;
  final ClinicaIiiLegalTexts lt;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final links = <Widget>[];

    void addLink(String label, String path, ClinicaIiiLegalPageKind target) {
      if (current == target) {
        links.add(Text(label, style: siteBodyTextStyle(context, fontSize: 13)));
        return;
      }
      links.add(
        TextButton(
          onPressed: () {
            if (kIsWeb) {
              Navigator.of(context).pushNamed(path);
              return;
            }
            Navigator.of(context).pushReplacementNamed(path);
          },
          child: Text(label, style: GoogleFonts.inter(fontSize: 13)),
        ),
      );
    }

    addLink(lt.footerPrivacy, kClinicaIIIPrivacyPolicyPath, ClinicaIiiLegalPageKind.privacy);
    links.add(Text(' · ', style: TextStyle(color: cs.onSurface.withValues(alpha: 0.5))));
    addLink(lt.footerTerms, kClinicaIIITermsPath, ClinicaIiiLegalPageKind.terms);
    links.add(Text(' · ', style: TextStyle(color: cs.onSurface.withValues(alpha: 0.5))));
    addLink(lt.footerHealthLgpd, kClinicaIIIHealthLgpdPath, ClinicaIiiLegalPageKind.healthLgpd);

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: links,
      ),
    );
  }
}

class _ClinicaLegalSection extends StatelessWidget {
  const _ClinicaLegalSection({required this.heading, required this.body});

  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: SiteSectionPanel(
        radius: 14,
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            siteSectionTitle(context, heading, fontSize: 15),
            const SizedBox(height: 6),
            Text(body, style: siteBodyTextStyle(context, fontSize: 13.5, height: 1.5)),
          ],
        ),
      ),
    );
  }
}

class _WebCanonicalRouteScope extends StatefulWidget {
  const _WebCanonicalRouteScope({required this.child});

  final Widget child;

  @override
  State<_WebCanonicalRouteScope> createState() => _WebCanonicalRouteScopeState();
}

class _WebCanonicalRouteScopeState extends State<_WebCanonicalRouteScope> {
  @override
  void initState() {
    super.initState();
    seo_meta.syncCanonicalToCurrentUrl();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      seo_meta.syncCanonicalToCurrentUrl();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
