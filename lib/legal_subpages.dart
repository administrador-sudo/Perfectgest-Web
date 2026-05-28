import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'l10n/play_store_app_legal_texts.dart';
import 'metallic_site_shell.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_language_menu.dart';

class PoliticaPrivacidadePerfectGestIPage extends StatelessWidget {
  const PoliticaPrivacidadePerfectGestIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    final selfUri = kIsWeb ? Uri.base : null;
    final lt = PlayStoreAppLegalTexts.of(context);
    final pageTitle = lt.privacyPolicyPerfectGestITitle;
    final scaffold = Scaffold(
      backgroundColor: siteScaffoldBackground(context),
      appBar: sitePolicyAppBar(context, title: pageTitle),
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
                  const SizedBox(height: 12),
                  Text(
                    lt.lastUpdatedMay2026,
                    style: siteBodyTextStyle(context, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  for (final s in lt.privacyPolicySections)
                    _LegalSection(heading: s.heading, body: s.body),
                  const SizedBox(height: 32),
                  Divider(color: cs.outline.withValues(alpha: 0.6)),
                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: selfUri == null
                          ? null
                          : () {
                              launchUrl(
                                selfUri,
                                mode: LaunchMode.platformDefault,
                                webOnlyWindowName: kIsWeb ? '_self' : null,
                              );
                            },
                      child: Text(pageTitle, textAlign: TextAlign.center),
                    ),
                  ),
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

class PoliticaExclusaoDadosPerfectGestIPage extends StatelessWidget {
  const PoliticaExclusaoDadosPerfectGestIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    final selfUri = kIsWeb ? Uri.base : null;
    final lt = PlayStoreAppLegalTexts.of(context);
    final pageTitle = lt.dataDeletionPolicyPerfectGestITitle;
    final scaffold = Scaffold(
      backgroundColor: siteScaffoldBackground(context),
      appBar: sitePolicyAppBar(context, title: pageTitle),
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
                  const SizedBox(height: 12),
                  Text(
                    lt.lastUpdatedMay2026,
                    style: siteBodyTextStyle(context, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  for (final s in lt.dataDeletionPolicySections)
                    _LegalSection(heading: s.heading, body: s.body),
                  const SizedBox(height: 32),
                  Divider(color: cs.outline.withValues(alpha: 0.6)),
                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: selfUri == null
                          ? null
                          : () {
                              launchUrl(
                                selfUri,
                                mode: LaunchMode.platformDefault,
                                webOnlyWindowName: kIsWeb ? '_self' : null,
                              );
                            },
                      child: Text(pageTitle, textAlign: TextAlign.center),
                    ),
                  ),
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

/// Na web, alinha canonical/`og:url` ao path atual ao abrir rotas legais e após voltar.
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

class _LegalSection extends StatelessWidget {
  const _LegalSection({required this.heading, required this.body});

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
