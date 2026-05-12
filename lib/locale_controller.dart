import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'locale_storage_stub.dart' if (dart.library.html) 'locale_storage_web.dart' as storage;

/// Idiomas suportados pelo site (codigo ISO 639-1).
const Set<String> kSupportedLanguageCodes = <String>{'pt', 'en', 'es'};

/// Locales suportados pelo MaterialApp na Fase 1.
const List<Locale> kSupportedLocales = <Locale>[
  Locale('pt'),
  Locale('en'),
  Locale('es'),
];

/// Controla o idioma da aplicacao.
///
/// `value == null` significa "seguir o idioma do sistema/browser" (autodeteccao
/// via [resolveSupportedLocale]). Uma escolha explicita do utilizador e
/// persistida no `localStorage` (web) e tem prioridade sobre a deteccao.
class LocaleController extends ValueNotifier<Locale?> {
  LocaleController() : super(_initialFromStorage());

  static Locale? _initialFromStorage() {
    final stored = storage.readStoredLocaleTag();
    if (stored == null) return null;
    if (!kSupportedLanguageCodes.contains(stored)) return null;
    return Locale(stored);
  }

  /// Define o idioma. Passar `null` retoma a autodeteccao.
  void setLocale(Locale? locale) {
    if (locale != null && !kSupportedLanguageCodes.contains(locale.languageCode)) {
      return;
    }
    storage.writeStoredLocaleTag(locale?.languageCode);
    value = locale;
  }
}

/// Singleton simples para consumo em widgets sem injectar deps adicionais.
final LocaleController appLocaleController = LocaleController();

/// Resolve o idioma a usar quando o controlador nao tem escolha explicita
/// (`appLocaleController.value == null`). Estrategia: bater `languageCode`
/// com algum dos [supportedLocales]; senao, `pt` como fallback.
Locale resolveSupportedLocale(Locale? deviceLocale, Iterable<Locale> supportedLocales) {
  if (deviceLocale != null) {
    for (final s in supportedLocales) {
      if (s.languageCode == deviceLocale.languageCode) return s;
    }
  }
  return supportedLocales.first;
}
