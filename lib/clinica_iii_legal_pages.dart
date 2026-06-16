import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'l10n/clinica_iii_legal_texts.dart';
import 'locale_controller.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_public_urls.dart';

/// Paleta documento legal (estilo Microsoft Store) — independente da vitrine.
abstract final class _ClinicaLegalStyle {
  static const pageBg = Color(0xFFFFFFFF);
  static const headerBg = Color(0xFFF3F3F3);
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0xFF444444);
  static const border = Color(0xFFE1E1E1);
  static const linkColor = Color(0xFF0067B8);

  static const _fontFallback = <String>[
    'Segoe UI Web',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  static TextStyle title({double fontSize = 20, FontWeight weight = FontWeight.w600}) {
    return TextStyle(
      inherit: false,
      fontFamily: 'Segoe UI',
      fontFamilyFallback: _fontFallback,
      fontSize: fontSize,
      fontWeight: weight,
      height: 1.35,
      color: textPrimary,
      letterSpacing: -0.2,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle body({double fontSize = 14, Color? color}) {
    return TextStyle(
      inherit: false,
      fontFamily: 'Segoe UI',
      fontFamilyFallback: _fontFallback,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: color ?? textPrimary,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle linkStyle({double fontSize = 14}) {
    return TextStyle(
      inherit: false,
      fontFamily: 'Segoe UI',
      fontFamilyFallback: _fontFallback,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: linkColor,
      decoration: TextDecoration.underline,
      decorationColor: linkColor,
    );
  }

  static ThemeData theme() {
    final baseBody = body();
    final baseTitle = title();
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: pageBg,
      canvasColor: pageBg,
      cardColor: pageBg,
      colorScheme: const ColorScheme.light(
        primary: linkColor,
        onPrimary: pageBg,
        onSurface: textPrimary,
        surface: pageBg,
        outline: border,
      ),
      textTheme: TextTheme(
        bodyLarge: baseBody,
        bodyMedium: baseBody,
        bodySmall: body(fontSize: 13),
        titleLarge: baseTitle,
        titleMedium: title(fontSize: 16),
        titleSmall: title(fontSize: 15),
        labelLarge: baseBody,
      ),
      iconTheme: const IconThemeData(color: textPrimary),
      appBarTheme: const AppBarTheme(
        backgroundColor: pageBg,
        foregroundColor: textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      dividerColor: border,
      popupMenuTheme: PopupMenuThemeData(
        color: pageBg,
        textStyle: baseBody,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: linkColor,
          textStyle: linkStyle(fontSize: 14),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}

String _normalizeClinicaPath(String path) {
  if (path.isEmpty) return kClinicaIIIPrivacyPolicyPath;
  var normalized = path;
  if (normalized.length > 1 && normalized.endsWith('/')) {
    normalized = normalized.substring(0, normalized.length - 1);
  }
  if (normalized.endsWith('.html')) {
    normalized = normalized.substring(0, normalized.length - 5);
  }
  return normalized;
}

ClinicaIiiLegalPageKind _kindForPath(String path) {
  switch (_normalizeClinicaPath(path)) {
    case kClinicaIIITermsPath:
      return ClinicaIiiLegalPageKind.terms;
    case kClinicaIIIHealthLgpdPath:
      return ClinicaIiiLegalPageKind.healthLgpd;
    case kClinicaIIIPrivacyPolicyPath:
    default:
      return ClinicaIiiLegalPageKind.privacy;
  }
}

enum ClinicaIiiLegalPageKind { privacy, terms, healthLgpd }

/// Mini-app isolada (tema claro fixo) — não herda o tema escuro da vitrine.
class ClinicaIiiLegalApp extends StatelessWidget {
  const ClinicaIiiLegalApp({super.key, required this.initialPath});

  final String initialPath;

  @override
  Widget build(BuildContext context) {
    final shell = ValueListenableBuilder<Locale?>(
      valueListenable: appLocaleController,
      builder: (context, manualLocale, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _ClinicaLegalStyle.theme(),
          darkTheme: _ClinicaLegalStyle.theme(),
          themeMode: ThemeMode.light,
          locale: manualLocale,
          supportedLocales: kSupportedLocales,
          localizationsDelegates: const <LocalizationsDelegate<Object>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: resolveSupportedLocale,
          initialRoute: _normalizeClinicaPath(initialPath),
          onGenerateRoute: (RouteSettings settings) {
            final path = _normalizeClinicaPath(settings.name ?? initialPath);
            return MaterialPageRoute<void>(
              settings: RouteSettings(name: path),
              builder: (_) => _ClinicaIiiLegalPage(kind: _kindForPath(path)),
            );
          },
        );
      },
    );
    if (kIsWeb) return _WebCanonicalRouteScope(child: shell);
    return shell;
  }
}

class ClinicaIiiPrivacyPolicyPage extends StatelessWidget {
  const ClinicaIiiPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClinicaIiiLegalApp(initialPath: kClinicaIIIPrivacyPolicyPath);
  }
}

class ClinicaIiiTermsPage extends StatelessWidget {
  const ClinicaIiiTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClinicaIiiLegalApp(initialPath: kClinicaIIITermsPath);
  }
}

class ClinicaIiiHealthLgpdPage extends StatelessWidget {
  const ClinicaIiiHealthLgpdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClinicaIiiLegalApp(initialPath: kClinicaIIIHealthLgpdPath);
  }
}

class _ClinicaIiiLegalPage extends StatefulWidget {
  const _ClinicaIiiLegalPage({required this.kind});

  final ClinicaIiiLegalPageKind kind;

  @override
  State<_ClinicaIiiLegalPage> createState() => _ClinicaIiiLegalPageState();
}

class _ClinicaIiiLegalPageState extends State<_ClinicaIiiLegalPage> {
  var _seoApplied = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_seoApplied || !kIsWeb) return;
    _seoApplied = true;
    final lt = ClinicaIiiLegalTexts.of(context);
    final title = switch (widget.kind) {
      ClinicaIiiLegalPageKind.privacy => lt.privacyTitle,
      ClinicaIiiLegalPageKind.terms => lt.termsTitle,
      ClinicaIiiLegalPageKind.healthLgpd => lt.healthLgpdTitle,
    };
    seo_meta.applyClinicaIiiLegalSeoMetaTags(title);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 20.0 : 32.0;
    final lt = ClinicaIiiLegalTexts.of(context);

    final pageTitle = switch (widget.kind) {
      ClinicaIiiLegalPageKind.privacy => lt.privacyTitle,
      ClinicaIiiLegalPageKind.terms => lt.termsTitle,
      ClinicaIiiLegalPageKind.healthLgpd => lt.healthLgpdTitle,
    };
    final sections = switch (widget.kind) {
      ClinicaIiiLegalPageKind.privacy => lt.privacySections,
      ClinicaIiiLegalPageKind.terms => lt.termsSections,
      ClinicaIiiLegalPageKind.healthLgpd => lt.healthLgpdSections,
    };

    return ColoredBox(
      color: _ClinicaLegalStyle.pageBg,
      child: DefaultTextStyle(
        style: _ClinicaLegalStyle.body(),
        child: Scaffold(
          backgroundColor: _ClinicaLegalStyle.pageBg,
          appBar: _ClinicaIiiLegalAppBar(title: pageTitle),
          body: SelectionArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(padH, 24, padH, 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pageTitle,
                        style: _ClinicaLegalStyle.title(fontSize: w < 400 ? 22 : 26),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        lt.lastUpdated,
                        style: _ClinicaLegalStyle.body(
                          fontSize: 13,
                          color: _ClinicaLegalStyle.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _ClinicaLegalStyle.headerBg,
                          border: Border.all(color: _ClinicaLegalStyle.border),
                        ),
                        child: Text(
                          lt.legalHeaderBody,
                          style: _ClinicaLegalStyle.body(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 28),
                      for (final s in sections)
                        _ClinicaLegalSection(heading: s.heading, body: s.body),
                      const SizedBox(height: 32),
                      const Divider(height: 1, thickness: 1, color: _ClinicaLegalStyle.border),
                      const SizedBox(height: 16),
                      _ClinicaIiiFooterLinks(current: widget.kind, lt: lt),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ClinicaIiiLegalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ClinicaIiiLegalAppBar({required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _ClinicaLegalStyle.pageBg,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: _ClinicaLegalStyle.border)),
        ),
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: _ClinicaLegalStyle.title(fontSize: 15, weight: FontWeight.w600),
                  ),
                ),
                const _ClinicaLanguageMenu(),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ClinicaLanguageMenu extends StatelessWidget {
  const _ClinicaLanguageMenu();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<Locale?>(
      valueListenable: appLocaleController,
      builder: (context, manualLocale, _) {
        final activeCode = manualLocale?.languageCode;
        return PopupMenuButton<String>(
          tooltip: l10n.languageMenuTooltip,
          icon: const Icon(Icons.language, color: _ClinicaLegalStyle.textPrimary, size: 22),
          color: _ClinicaLegalStyle.pageBg,
          onSelected: (value) {
            appLocaleController.setLocale(value.isEmpty ? null : Locale(value));
          },
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            CheckedPopupMenuItem<String>(
              value: '',
              checked: activeCode == null,
              child: Text(l10n.languageFollowSystem, style: _ClinicaLegalStyle.body(fontSize: 14)),
            ),
            const PopupMenuDivider(height: 1),
            CheckedPopupMenuItem<String>(
              value: 'pt',
              checked: activeCode == 'pt',
              child: Text(l10n.languageNamePortuguese, style: _ClinicaLegalStyle.body(fontSize: 14)),
            ),
            CheckedPopupMenuItem<String>(
              value: 'en',
              checked: activeCode == 'en',
              child: Text(l10n.languageNameEnglish, style: _ClinicaLegalStyle.body(fontSize: 14)),
            ),
            CheckedPopupMenuItem<String>(
              value: 'es',
              checked: activeCode == 'es',
              child: Text(l10n.languageNameSpanish, style: _ClinicaLegalStyle.body(fontSize: 14)),
            ),
          ],
        );
      },
    );
  }
}

class _ClinicaIiiFooterLinks extends StatelessWidget {
  const _ClinicaIiiFooterLinks({required this.current, required this.lt});

  final ClinicaIiiLegalPageKind current;
  final ClinicaIiiLegalTexts lt;

  @override
  Widget build(BuildContext context) {
    final links = <Widget>[];

    void addLink(String label, String path, ClinicaIiiLegalPageKind target) {
      if (current == target) {
        links.add(Text(label, style: _ClinicaLegalStyle.body(fontSize: 14)));
        return;
      }
      links.add(
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed(path),
          child: Text(label, style: _ClinicaLegalStyle.linkStyle(fontSize: 14)),
        ),
      );
    }

    addLink(lt.footerPrivacy, kClinicaIIIPrivacyPolicyPath, ClinicaIiiLegalPageKind.privacy);
    links.add(Text(' · ', style: _ClinicaLegalStyle.body(fontSize: 14, color: _ClinicaLegalStyle.textSecondary)));
    addLink(lt.footerTerms, kClinicaIIITermsPath, ClinicaIiiLegalPageKind.terms);
    links.add(Text(' · ', style: _ClinicaLegalStyle.body(fontSize: 14, color: _ClinicaLegalStyle.textSecondary)));
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
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading, style: _ClinicaLegalStyle.title(fontSize: 16)),
          const SizedBox(height: 8),
          Text(body, style: _ClinicaLegalStyle.body(fontSize: 14)),
        ],
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
