import 'package:web/web.dart' as web;

const String kOrcamentoStorageKey = 'pg_orcamento_v1';

String? readOrcamentoJson() {
  try {
    final v = web.window.localStorage.getItem(kOrcamentoStorageKey);
    if (v == null || v.isEmpty) return null;
    return v;
  } catch (_) {
    return null;
  }
}

void writeOrcamentoJson(String json) {
  try {
    web.window.localStorage.setItem(kOrcamentoStorageKey, json);
  } catch (_) {}
}
