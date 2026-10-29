import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/web.dart' as web;

import 'lead_api_config.dart';
import 'orcamento_models.dart';

const String kOrcamentoStorageKey = 'pg_orcamento_v1';
const String kOrcamentoSessaoTokenKey = 'pg_orcamento_sessao_token';
const String kOrcamentoSessaoPapelKey = 'pg_orcamento_sessao_papel';

String _apiRoot() {
  final base = kLeadsApiUrl;
  final idx = base.indexOf('/api/');
  return idx >= 0 ? base.substring(0, idx) : base;
}

String _precosUrl() => '${_apiRoot()}/api/orcamento-precos';

String _registrosUrl() => '${_apiRoot()}/api/orcamento-registros';

String _sessaoUrl() => '${_apiRoot()}/api/orcamento-sessao';

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

String? readOrcamentoSessaoToken() {
  try {
    final v = web.window.sessionStorage.getItem(kOrcamentoSessaoTokenKey);
    if (v == null || v.isEmpty) return null;
    return v;
  } catch (_) {
    return null;
  }
}

String? readOrcamentoSessaoPapel() {
  try {
    final v = web.window.sessionStorage.getItem(kOrcamentoSessaoPapelKey);
    if (v == null || v.isEmpty) return null;
    return v;
  } catch (_) {
    return null;
  }
}

void writeOrcamentoSessao({required String token, required String papel}) {
  try {
    web.window.sessionStorage.setItem(kOrcamentoSessaoTokenKey, token);
    web.window.sessionStorage.setItem(kOrcamentoSessaoPapelKey, papel);
  } catch (_) {}
}

void clearOrcamentoSessao() {
  try {
    web.window.sessionStorage.removeItem(kOrcamentoSessaoTokenKey);
    web.window.sessionStorage.removeItem(kOrcamentoSessaoPapelKey);
  } catch (_) {}
}

Map<String, String> _authHeaders({bool json = false}) {
  final h = <String, String>{};
  if (json) h['Content-Type'] = 'application/json; charset=utf-8';
  final t = readOrcamentoSessaoToken();
  if (t != null && t.isNotEmpty) h['Authorization'] = 'Bearer $t';
  return h;
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

Future<({String? token, String? papel, String? err})> loginOrcamentoSessao(String pin) async {
  try {
    final response = await http
        .post(
          Uri.parse(_sessaoUrl()),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode({'pin': pin}),
        )
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 403) {
      return (token: null, papel: null, err: 'pin_invalid');
    }
    if (response.statusCode != 200) {
      return (token: null, papel: null, err: 'api_unavailable');
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return (token: null, papel: null, err: 'server_error');
    final token = '${decoded['token'] ?? ''}';
    final papel = '${decoded['papel'] ?? ''}';
    if (token.isEmpty || (papel != 'adm' && papel != 'vendedor')) {
      return (token: null, papel: null, err: 'server_error');
    }
    writeOrcamentoSessao(token: token, papel: papel);
    return (token: token, papel: papel, err: null);
  } catch (_) {
    return (token: null, papel: null, err: 'api_unavailable');
  }
}

Future<
    ({
      Map<String, double> precosM2,
      Map<String, double> precosVidro,
      double fatiaMaterial,
      double fatiaMaoObra,
      String? err,
    })> fetchOrcamentoPrecos() async {
  try {
    final response = await http
        .get(Uri.parse(_precosUrl()), headers: _authHeaders())
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 403) {
      return (
        precosM2: <String, double>{},
        precosVidro: <String, double>{},
        fatiaMaterial: 60.0,
        fatiaMaoObra: 40.0,
        err: 'pin_invalid',
      );
    }
    if (response.statusCode != 200) {
      return (
        precosM2: <String, double>{},
        precosVidro: <String, double>{},
        fatiaMaterial: 60.0,
        fatiaMaoObra: 40.0,
        err: 'api_unavailable',
      );
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) {
      return (
        precosM2: <String, double>{},
        precosVidro: <String, double>{},
        fatiaMaterial: 60.0,
        fatiaMaoObra: 40.0,
        err: 'server_error',
      );
    }
    final fatia = normalizarFatia(_asFatia(decoded['fatiaMaterial'], 60));
    return (
      precosM2: _asPriceMap(decoded['precosM2']),
      precosVidro: _asPriceMap(decoded['precosVidro']),
      fatiaMaterial: fatia.material,
      fatiaMaoObra: fatia.maoObra,
      err: null,
    );
  } catch (_) {
    return (
      precosM2: <String, double>{},
      precosVidro: <String, double>{},
      fatiaMaterial: 60.0,
      fatiaMaoObra: 40.0,
      err: 'api_unavailable',
    );
  }
}

Future<String?> saveOrcamentoPrecos({
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
          headers: _authHeaders(json: true),
          body: jsonEncode({
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

Future<({List<({String id, DateTime createdAt})> historico, String? err})> fetchOrcamentoPrecosHistorico() async {
  try {
    final response = await http
        .get(Uri.parse('${_precosUrl()}/historico'), headers: _authHeaders())
        .timeout(const Duration(seconds: 20));
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

Future<({Map<String, double> precosM2, Map<String, double> precosVidro, double fatiaMaterial, double fatiaMaoObra})?>
    restoreOrcamentoPrecosHistoricoData({required String id}) async {
  try {
    final response = await http
        .post(
          Uri.parse('${_precosUrl()}/historico/restaurar'),
          headers: _authHeaders(json: true),
          body: jsonEncode({'id': id}),
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

Future<String?> deleteOrcamentoPrecosHistorico({required String id}) async {
  try {
    final uri = Uri.parse('${_precosUrl()}/historico').replace(queryParameters: {'id': id});
    final response = await http.delete(uri, headers: _authHeaders()).timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) return null;
    if (response.statusCode == 403) return 'pin_invalid';
    if (response.statusCode == 404) return 'not_found';
    return 'server_error';
  } catch (_) {
    return 'api_unavailable';
  }
}

Future<({String? id, String? err})> upsertOrcamentoDocumento({
  String? id,
  required Map<String, dynamic> payload,
}) async {
  try {
    final hasId = id != null && id.isNotEmpty;
    final uri = hasId ? Uri.parse('${_registrosUrl()}/$id') : Uri.parse(_registrosUrl());
    final response = hasId
        ? await http
            .put(uri, headers: _authHeaders(json: true), body: jsonEncode(payload))
            .timeout(const Duration(seconds: 20))
        : await http
            .post(uri, headers: _authHeaders(json: true), body: jsonEncode(payload))
            .timeout(const Duration(seconds: 20));
    if (response.statusCode == 403) return (id: null, err: 'pin_invalid');
    if (response.statusCode != 200 && response.statusCode != 201) {
      return (id: null, err: response.statusCode == 503 ? 'api_unavailable' : 'server_error');
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return (id: id, err: null);
    final savedId = '${decoded['id'] ?? id ?? ''}';
    return (id: savedId.isEmpty ? id : savedId, err: null);
  } catch (_) {
    return (id: null, err: 'api_unavailable');
  }
}

Future<({OrcamentoSnapshot? snap, String? err})> fetchOrcamentoDocumento(String id) async {
  try {
    final response = await http
        .get(Uri.parse('${_registrosUrl()}/$id'), headers: _authHeaders())
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 403) return (snap: null, err: 'pin_invalid');
    if (response.statusCode == 404) return (snap: null, err: 'not_found');
    if (response.statusCode != 200) return (snap: null, err: 'api_unavailable');
    final decoded = jsonDecode(response.body);
    if (decoded is! Map) return (snap: null, err: 'server_error');
    return (snap: snapshotFromRegistro(Map<String, dynamic>.from(decoded)), err: null);
  } catch (_) {
    return (snap: null, err: 'api_unavailable');
  }
}

Future<List<OrcamentoRegistroResumo>?> fetchOrcamentoRegistros() async {
  try {
    final response = await http
        .get(Uri.parse(_registrosUrl()), headers: _authHeaders())
        .timeout(const Duration(seconds: 20));
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

Future<String?> deleteOrcamentoRegistro({required String id}) async {
  try {
    final uri = Uri.parse(_registrosUrl()).replace(queryParameters: {'id': id});
    final response = await http.delete(uri, headers: _authHeaders()).timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) return null;
    if (response.statusCode == 403) return 'pin_invalid';
    if (response.statusCode == 404) return 'not_found';
    return 'server_error';
  } catch (_) {
    return 'api_unavailable';
  }
}
