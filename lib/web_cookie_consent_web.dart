import 'dart:js_interop';

import 'package:web/web.dart' as web;

@JS('ppLoadAnalyticsIfConsented')
external void _ppLoadAnalyticsIfConsented();

/// Indica se o utilizador já tomou uma decisão explícita (aceitar ou recusar).
bool isCookieChoiceStored() {
  try {
    final v = web.window.localStorage.getItem('pp_cookie_consent');
    return v != null && v.isNotEmpty;
  } catch (_) {
    return true;
  }
}

/// Grava aceitação de cookies de medição e carrega GA4 se a página já estiver pronta.
void grantAnalyticsMeasurementConsent() {
  web.window.localStorage.setItem('pp_cookie_consent', 'granted');
  try {
    _ppLoadAnalyticsIfConsented();
  } catch (_) {
    // pp_analytics.js ausente (ex.: testes unitários).
  }
}

/// Grava recusa explícita (medição permanece desativada até nova decisão).
void denyAnalyticsMeasurementConsent() {
  web.window.localStorage.setItem('pp_cookie_consent', 'denied');
}
