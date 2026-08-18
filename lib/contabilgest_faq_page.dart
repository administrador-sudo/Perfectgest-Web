import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'l10n/site_contabilgest_faq_texts.dart';
import 'metallic_site_shell.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_language_menu.dart';

class ContabilgestFaqPage extends StatefulWidget {
  const ContabilgestFaqPage({super.key, this.onToggleTheme});

  final VoidCallback? onToggleTheme;

  @override
  State<ContabilgestFaqPage> createState() => _ContabilgestFaqPageState();
}

class _ContabilgestFaqPageState extends State<ContabilgestFaqPage> {
  @override
  void initState() {
    super.initState();
    seo_meta.applyContabilgestFaqSeoMetaTags();
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
    final st = SiteContabilgestFaqTexts.of(context);
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
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
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
                        const SizedBox(height: 22),
                        for (final item in st.items) _FaqSection(item: item),
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

class _FaqSection extends StatelessWidget {
  const _FaqSection({required this.item});

  final SiteFaqItem item;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final mqW = MediaQuery.sizeOf(context).width;
    final padH = mqW < 400 ? 12.0 : 16.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Semantics(
        container: true,
        label: item.question,
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
                  item.question,
                  style: GoogleFonts.inter(
                    fontSize: mqW < 360 ? 15 : 16,
                    fontWeight: FontWeight.w700,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.body,
                  style: GoogleFonts.inter(
                    fontSize: mqW < 360 ? 13 : 14,
                    height: 1.55,
                    color: cs.onSurface.withValues(alpha: 0.88),
                  ),
                ),
                if (item.links.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  for (final link in item.links)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => launchUrl(
                            Uri.parse(link.url),
                            mode: LaunchMode.externalApplication,
                            webOnlyWindowName: kIsWeb ? '_blank' : null,
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          child: Text(
                            link.label,
                            style: GoogleFonts.inter(
                              fontSize: mqW < 360 ? 13 : 14,
                              height: 1.45,
                              fontWeight: FontWeight.w600,
                              color: cs.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
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
