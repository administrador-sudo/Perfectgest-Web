import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/app_localizations.dart';
import 'locale_controller.dart';
import 'metallic_site_shell.dart';
import 'web_site_root_stub.dart' if (dart.library.html) 'web_site_root_web.dart' as web_site_root;

/// Selector de idioma (PT/EN/ES) — igual ao da página principal.
class SiteLanguageMenuButton extends StatelessWidget {
  const SiteLanguageMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<Locale?>(
      valueListenable: appLocaleController,
      builder: (context, manualLocale, _) {
        final activeCode = manualLocale?.languageCode;
        return PopupMenuButton<String>(
          tooltip: l10n.languageMenuTooltip,
          icon: Icon(Icons.translate_rounded, color: cs.primary, size: 22),
          onSelected: (value) {
            appLocaleController.setLocale(value.isEmpty ? null : Locale(value));
          },
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            CheckedPopupMenuItem<String>(
              value: '',
              checked: activeCode == null,
              child: Text(l10n.languageFollowSystem),
            ),
            const PopupMenuDivider(),
            CheckedPopupMenuItem<String>(
              value: 'pt',
              checked: activeCode == 'pt',
              child: Text(l10n.languageNamePortuguese),
            ),
            CheckedPopupMenuItem<String>(
              value: 'en',
              checked: activeCode == 'en',
              child: Text(l10n.languageNameEnglish),
            ),
            CheckedPopupMenuItem<String>(
              value: 'es',
              checked: activeCode == 'es',
              child: Text(l10n.languageNameSpanish),
            ),
          ],
        );
      },
    );
  }
}

/// Ações comuns no AppBar das páginas de política (tema opcional + idioma).
List<Widget> sitePolicyAppBarActions(
  BuildContext context, {
  VoidCallback? onToggleTheme,
}) {
  final cs = Theme.of(context).colorScheme;
  final l10n = AppLocalizations.of(context);
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return [
    if (onToggleTheme != null)
      IconButton(
        tooltip: isDark ? l10n.themeLight : l10n.themeDark,
        onPressed: onToggleTheme,
        icon: Icon(
          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          color: cs.primary,
        ),
      ),
    const SiteLanguageMenuButton(),
  ];
}

/// AppBar padrão das páginas de política (voltar + idioma).
PreferredSizeWidget sitePolicyAppBar(
  BuildContext context, {
  required String title,
  VoidCallback? onToggleTheme,
  VoidCallback? onBack,
}) {
  final cs = Theme.of(context).colorScheme;
  final l10n = AppLocalizations.of(context);
  return AppBar(
    backgroundColor: siteAppBarBackground(context),
    surfaceTintColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: cs.primary),
      tooltip: l10n.navBackHome,
      onPressed: onBack ?? () => sitePolicyNavigateBack(context),
    ),
    title: Text(
      title,
      style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: cs.onSurface),
    ),
    actions: sitePolicyAppBarActions(context, onToggleTheme: onToggleTheme),
  );
}

void sitePolicyNavigateBack(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
    return;
  }
  if (kIsWeb) {
    web_site_root.navigateToSameOriginRoot();
    return;
  }
  Navigator.of(context).pushReplacementNamed('/');
}
