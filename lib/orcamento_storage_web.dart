import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/web.dart' as web;

import 'lead_api_config.dart';
import 'orcamento_models.dart';

const String kOrcamentoStorageKey = 'pg_orcamento_v1';

String _apiRoot() {
  final base = kLeadsApiUrl;
  final idx = base.indexOf('/api/');
  return idx >= 0 ? base.substring(0, idx) : base;
}

String _precosUrl() => '${_apiRoot()}/api/orcamento-precos';

String _registrosUrl() => '${_apiRoot()}/api/orcamento-registros';

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

double _asFatia(dynamic raw, double padrao) {
  if (raw is num) {
    final v = raw.toDouble();
    if (v < 0) return 0;
    if (v > 100) return 100;
    return v;
  }
  final v = double.tryParse('$raw') ?? padrao;
  if (v < 0) return 0;
  if (v > 100) return 100;
  return v;
}

Future<
    ({
      Map<String, double> precosM2,
      Map<String, double> precosVidro,
      double fatiaMaterial,
      double fatiaMaoObra,
    })?> fetchOrcamentoPrecos() async {
  try {
    final response = await http.get(Uri.parse(_precosUrl())).timeout(const Duration(seconds: 20));
    if (response.statusCode != 200) return null;
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return null;
    final fatia = normalizarFatia(_asFatia(decoded['fatiaMaterial'], 60));
    return (
      precosM2: _asPriceMap(decoded['precosM2']),
      precosVidro: _asPriceMap(decoded['precosVidro']),
      fatiaMaterial: fatia.material,
      fatiaMaoObra: fatia.maoObra,
    );
  } catch (_) {
    return null;
  }
}

Future<String?> saveOrcamentoPrecos({
  required String pin,
  required Map<String, double> precosM2,
  required Map<String, double> precosVidro,
  double fatiaMaterial = 60,
  double fatiaMaoObra = 40,
}) async {
  try {
    final fatia = normalizarFatia(fatiaMaterial);
    final response = await http
        .put(
          Uri.parse(_precosUrl()),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode({
            'pin': pin,
            'precosM2': precosM2,
            'precosVidro': precosVidro,
            'fatiaMaterial': fatia.material,
            'fatiaMaoObra': fatia.maoObra,
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

List<({String id, DateTime createdAt})> _asHistorico(dynamic raw) {
  final out = <({String id, DateTime createdAt})>[];
  if (raw is! List) return out;
  for (final e in raw) {
    if (e is! Map) continue;
    final id = '${e['id'] ?? ''}';
    if (id.isEmpty) continue;
    final dt = DateTime.tryParse('${e['createdAt'] ?? ''}') ?? DateTime.now();
    out.add((id: id, createdAt: dt));
  }
  return out;
}

Future<({List<({String id, DateTime createdAt})> historico, String? err})> fetchOrcamentoPrecosHistorico(
  String pin,
) async {
  try {
    final uri = Uri.parse('${_precosUrl()}/historico').replace(queryParameters: {'pin': pin});
    final response = await http.get(uri).timeout(const Duration(seconds: 20));
    if (response.statusCode == 403) {
      return (historico: <({String id, DateTime createdAt})>[], err: 'pin_invalid');
    }
    if (response.statusCode != 200) {
      return (historico: <({String id, DateTime createdAt})>[], err: 'api_unavailable');
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) {
      return (historico: <({String id, DateTime createdAt})>[], err: 'server_error');
    }
    return (historico: _asHistorico(decoded['historico']), err: null);
  } catch (_) {
    return (historico: <({String id, DateTime createdAt})>[], err: 'api_unavailable');
  }
}

Future<({Map<String, double> precosM2, Map<String, double> precosVidro, double fatiaMaterial, double fatiaMaoObra})?> restoreOrcamentoPrecosHistoricoData({
  required String pin,
  required String id,
}) async {
  try {
    final response = await http
        .post(
          Uri.parse('${_precosUrl()}/historico/restaurar'),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode({'pin': pin, 'id': id}),
        )
        .timeout(const Duration(seconds: 20));
    if (response.statusCode != 200) return null;
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return null;
    final fatia = normalizarFatia(_asFatia(decoded['fatiaMaterial'], 60));
    return (
      precosM2: _asPriceMap(decoded['precosM2']),
      precosVidro: _asPriceMap(decoded['precosVidro']),
      fatiaMaterial: fatia.material,
      fatiaMaoObra: fatia.maoObra,
    );
  } catch (_) {
    return null;
  }
}

Future<String?> deleteOrcamentoPrecosHistorico({
  required String pin,
  required String id,
}) async {
  try {
    final uri = Uri.parse('${_precosUrl()}/historico').replace(
      queryParameters: {'pin': pin, 'id': id},
    );
    final response = await http.delete(uri).timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) return null;
    if (response.statusCode == 403) return 'pin_invalid';
    if (response.statusCode == 404) return 'not_found';
    return 'server_error';
  } catch (_) {
    return 'api_unavailable';
  }
}

Future<String?> postOrcamentoRegistro(Map<String, dynamic> payload) async {
  try {
    final response = await http
        .post(
          Uri.parse(_registrosUrl()),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode(payload),
        )
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 201 || response.statusCode == 200) return null;
    if (response.statusCode == 503) return 'api_unavailable';
    return 'server_error';
  } catch (_) {
    return 'api_unavailable';
  }
}

Future<List<OrcamentoRegistroResumo>?> fetchOrcamentoRegistros(String pin) async {
  try {
    final uri = Uri.parse(_registrosUrl()).replace(queryParameters: {'pin': pin});
    final response = await http.get(uri).timeout(const Duration(seconds: 20));
    if (response.statusCode != 200) return null;
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return null;
    final raw = decoded['registros'];
    if (raw is! List) return const [];
    return [
      for (final e in raw)
        if (e is Map) OrcamentoRegistroResumo.fromJson(Map<String, dynamic>.from(e)),
    ];
  } catch (_) {
    return null;
  }
}

Future<String?> deleteOrcamentoRegistro({
  required String pin,
  required String id,
}) async {
  try {
    final uri = Uri.parse(_registrosUrl()).replace(
      queryParameters: {'pin': pin, 'id': id},
    );
    final response = await http.delete(uri).timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) return null;
    if (response.statusCode == 403) return 'pin_invalid';
    if (response.statusCode == 404) return 'not_found';
    return 'server_error';
  } catch (_) {
    return 'api_unavailable';
  }
}
