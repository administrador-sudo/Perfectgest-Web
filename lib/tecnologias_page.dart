import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/app_localizations.dart';
import 'l10n/site_tecnologias_texts.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;

class TecnologiasPage extends StatefulWidget {
  const TecnologiasPage({super.key, this.onToggleTheme, this.initialTopic});

  final VoidCallback? onToggleTheme;
  final String? initialTopic;

  static const topicCleanArch = 'clean-arch';
  static const topicSeguranca = 'seguranca';
  static const topicEscala = 'escala';
  static const topicFullStack = 'full-stack';

  @override
  State<TecnologiasPage> createState() => _TecnologiasPageState();
}

class _TecnologiasPageState extends State<TecnologiasPage> {
  final _scrollCtrl = ScrollController();
  final _cleanArchKey = GlobalKey();
  final _segurancaKey = GlobalKey();
  final _escalaKey = GlobalKey();
  final _fullStackKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    seo_meta.applyTecnologiasSeoMetaTags();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToInitialTopic());
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    seo_meta.restoreGlobalSeoMetaTags();
    super.dispose();
  }

  void _scrollToInitialTopic() {
    final keyByTopic = <String, GlobalKey>{
      TecnologiasPage.topicCleanArch: _cleanArchKey,
      TecnologiasPage.topicSeguranca: _segurancaKey,
      TecnologiasPage.topicEscala: _escalaKey,
      TecnologiasPage.topicFullStack: _fullStackKey,
    };
    final selectedKey = keyByTopic[widget.initialTopic];
    final targetContext = selectedKey?.currentContext;
    if (targetContext == null) return;
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeOutCubic,
      alignment: 0.24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    final l10n = AppLocalizations.of(context);
    final tt = SiteTecnologiasTexts.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardKeys = <GlobalKey?>[ _cleanArchKey, _segurancaKey, _escalaKey, _fullStackKey ];
    return Semantics(
      label: tt.semanticsLabel,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: cs.surface.withValues(alpha: 0.96),
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: cs.primary),
            tooltip: l10n.navBackHome,
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
          ),
          title: Text(l10n.portBtnPartners, style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: cs.onSurface)),
          actions: [
            if (widget.onToggleTheme != null)
              IconButton(
                tooltip: isDark ? l10n.themeLight : l10n.themeDark,
                onPressed: widget.onToggleTheme,
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: cs.primary,
                ),
              ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollCtrl,
          padding: EdgeInsets.fromLTRB(padH, 16, padH, 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tt.heroTitle,
                    style: GoogleFonts.inter(fontSize: w < 400 ? 22 : 26, fontWeight: FontWeight.w800, color: cs.onSurface, height: 1.2),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tt.heroIntro1,
                    style: GoogleFonts.inter(fontSize: 14, height: 1.5, color: cs.onSurface.withValues(alpha: 0.82)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tt.heroIntro2,
                    style: GoogleFonts.inter(fontSize: 13.6, height: 1.5, color: cs.onSurface.withValues(alpha: 0.8)),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    tt.portfolioDifferentialsTitle,
                    style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w800, color: cs.onSurface),
                  ),
                  const SizedBox(height: 10),
                  for (var i = 0; i < tt.stackCards.length; i++) ...[
                    if (i == 4) const SizedBox(height: 8),
                    _TechItem(
                      key: i < 4 ? cardKeys[i] : null,
                      conceptLabel: tt.conceptAppliedLabel,
                      title: tt.stackCards[i].title,
                      body: tt.stackCards[i].body,
                      example: tt.stackCards[i].example,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TechItem extends StatelessWidget {
  const _TechItem({super.key, required this.title, required this.body, this.example, required this.conceptLabel});

  final String title;
  final String body;
  final String? example;
  final String conceptLabel;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cs.outline.withValues(alpha: 0.35)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(fontSize: 15.5, fontWeight: FontWeight.w700, color: cs.primary)),
              const SizedBox(height: 6),
              const SizedBox(height: 2),
              Text(
                conceptLabel,
                style: GoogleFonts.inter(fontSize: 12.8, height: 1.4, color: cs.primary.withValues(alpha: 0.9), fontWeight: FontWeight.w700),
              ),
              Text(
                body,
                style: GoogleFonts.inter(fontSize: 12.8, height: 1.45, color: cs.onSurface.withValues(alpha: 0.84)),
              ),
              if (example != null) ...[
                const SizedBox(height: 8),
                Text(
                  example!,
                  style: GoogleFonts.inter(fontSize: 12.8, height: 1.45, color: cs.primary.withValues(alpha: 0.92), fontWeight: FontWeight.w600),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
