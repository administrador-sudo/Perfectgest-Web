import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/web.dart' as web;

import 'lead_api_config.dart';

const String kOrcamentoStorageKey = 'pg_orcamento_v1';

String _precosUrl() {
  final base = kLeadsApiUrl;
  final idx = base.indexOf('/api/');
  final root = idx >= 0 ? base.substring(0, idx) : base;
  return '$root/api/orcamento-precos';
}

Map<String, double> _asPriceMap(dynamic raw) {
  final out = <String, double>{};
  if (raw is! Map) return out;
  raw.forEach((k, v) {
    if (v is num) {
      out['$k'] = v.toDouble();
    } else {
      out['$k'] = double.tryParse('$v') ?? 0;
    }
  });
  return out;
}

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

Future<({Map<String, double> precosM2, Map<String, double> precosVidro})?> fetchOrcamentoPrecos() async {
  try {
    final response = await http.get(Uri.parse(_precosUrl())).timeout(const Duration(seconds: 20));
    if (response.statusCode != 200) return null;
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return null;
    return (
      precosM2: _asPriceMap(decoded['precosM2']),
      precosVidro: _asPriceMap(decoded['precosVidro']),
    );
  } catch (_) {
    return null;
  }
}

Future<String?> saveOrcamentoPrecos({
  required String pin,
  required Map<String, double> precosM2,
  required Map<String, double> precosVidro,
}) async {
  try {
    final response = await http
        .put(
          Uri.parse(_precosUrl()),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode({
            'pin': pin,
            'precosM2': precosM2,
            'precosVidro': precosVidro,
          }),
        )
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) return null;
    if (response.statusCode == 403) return 'pin_invalid';
    if (response.statusCode == 503) return 'api_unavailable';
    return 'server_error';
  } catch (_) {
    return 'api_unavailable';
  }
}
