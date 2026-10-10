import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'lead_capture_service.dart';

class FunilA1Prefill {
  const FunilA1Prefill({
    this.nome = '',
    this.email = '',
    this.telefone = '',
    this.cnpj = '',
    this.razao = '',
  });

  final String nome;
  final String email;
  final String telefone;
  final String cnpj;
  final String razao;
}

/// POST do cadastro A1 QualityCert → receberSolicitacaoA1Funil.
/// Não substitui [FunilFirestoreService] (lead com faixa).
class FunilA1Service {
  static const url =
      'https://southamerica-east1-perfectgest-contabilgest.cloudfunctions.net/receberSolicitacaoA1Funil';

  static String digits(String raw) => raw.replaceAll(RegExp(r'\D'), '');

  static Future<LeadCaptureResult> submit({
    required String tipoPessoa,
    required String cnpjCpf,
    required String razaoSocial,
    required String email,
    required String telefone,
    required String cep,
    required String logradouro,
    required String numero,
    required String bairro,
    required String cidade,
    required String estado,
    required bool consent,
    bool pixA1Informado = true,
    String complemento = '',
    String websiteHoneypot = '',
    String comprovanteNome = '',
    String comprovanteMime = '',
    String comprovanteBase64 = '',
  }) async {
    if (!consent) {
      return const LeadCaptureResult(ok: false, errorMessage: 'consent_required');
    }
    final tipo = tipoPessoa.trim().toUpperCase();
    if (tipo != 'PJ' && tipo != 'PF') {
      return const LeadCaptureResult(ok: false, errorMessage: 'tipo_pessoa_invalid');
    }
    final doc = digits(cnpjCpf);
    if (tipo == 'PJ' && doc.length != 14) {
      return const LeadCaptureResult(ok: false, errorMessage: 'cnpj_invalid');
    }
    if (tipo == 'PF' && doc.length != 11) {
      return const LeadCaptureResult(ok: false, errorMessage: 'cpf_invalid');
    }
    final razao = razaoSocial.trim();
    if (razao.length < 2) {
      return const LeadCaptureResult(ok: false, errorMessage: 'razao_invalid');
    }
    final mail = email.trim().toLowerCase();
    if (!_looksLikeEmail(mail)) {
      return const LeadCaptureResult(ok: false, errorMessage: 'email_invalid');
    }
    final fone = digits(telefone);
    if (fone.length < 10 || fone.length > 11) {
      return const LeadCaptureResult(ok: false, errorMessage: 'telefone_invalid');
    }
    final cepD = digits(cep);
    if (cepD.length != 8) {
      return const LeadCaptureResult(ok: false, errorMessage: 'cep_invalid');
    }
    final log = logradouro.trim();
    final num = numero.trim();
    final bai = bairro.trim();
    final cid = cidade.trim();
    final uf = estado.trim().toUpperCase();
    if (log.isEmpty) {
      return const LeadCaptureResult(ok: false, errorMessage: 'logradouro_invalid');
    }
    if (num.isEmpty) {
      return const LeadCaptureResult(ok: false, errorMessage: 'numero_invalid');
    }
    if (bai.isEmpty) {
      return const LeadCaptureResult(ok: false, errorMessage: 'bairro_invalid');
    }
    if (cid.isEmpty) {
      return const LeadCaptureResult(ok: false, errorMessage: 'cidade_invalid');
    }
    if (!RegExp(r'^[A-Z]{2}$').hasMatch(uf)) {
      return const LeadCaptureResult(ok: false, errorMessage: 'estado_invalid');
    }

    final body = jsonEncode({
      'tipo_pessoa': tipo,
      'cnpj_cpf': doc,
      'razao_social': razao,
      'email': mail,
      'telefone': fone,
      'cep': cepD,
      'logradouro': log,
      'numero': num,
      'bairro': bai,
      'complemento': complemento.trim(),
      'cidade': cid,
      'estado': uf,
      'consent': true,
      'pixA1Informado': pixA1Informado,
      'website': websiteHoneypot,
      if (comprovanteBase64.isNotEmpty) ...{
        'comprovanteNome': comprovanteNome,
        'comprovanteMime': comprovanteMime,
        'comprovanteBase64': comprovanteBase64,
      },
    });

    LeadCaptureResult? last;
    for (var attempt = 0; attempt < 2; attempt++) {
      try {
        final response = await http
            .post(
              Uri.parse(url),
              headers: const {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
              body: body,
            )
            .timeout(const Duration(seconds: 60));
        final code = response.statusCode;
        if (code == 400) {
          return LeadCaptureResult(
            ok: false,
            errorMessage: _errorFromBody(response.body) ?? 'server_error',
          );
        }
        if (code >= 200 && code < 300) {
          if (_jsonOkGravado(response.body)) {
            return const LeadCaptureResult(ok: true);
          }
          return const LeadCaptureResult(ok: false, errorMessage: 'server_error');
        }
        debugPrint('[FunilA1] HTTP $code: ${response.body}');
        return const LeadCaptureResult(ok: false, errorMessage: 'server_error');
      } on http.ClientException catch (e, st) {
        debugPrint('[FunilA1] ClientException: $e\n$st');
        last = const LeadCaptureResult(ok: false, errorMessage: 'network_error');
        if (attempt == 0) continue;
        return last;
      } on Exception catch (e, st) {
        final msg = e.toString();
        if (msg.contains('TimeoutException') || msg.contains('timed out')) {
          last = const LeadCaptureResult(ok: false, errorMessage: 'api_waking');
          if (attempt == 0) continue;
          return last;
        }
        debugPrint('[FunilA1] $e\n$st');
        last = const LeadCaptureResult(ok: false, errorMessage: 'network_error');
        if (attempt == 0) continue;
        return last;
      }
    }
    return last ??
        const LeadCaptureResult(ok: false, errorMessage: 'network_error');
  }

  static bool _jsonOkGravado(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map || decoded['ok'] != true) return false;
      if (decoded['skipped'] != null) return false;
      return true;
    } on Object {
      return false;
    }
  }

  static String? _errorFromBody(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map && decoded['error'] is String) {
        return decoded['error'] as String;
      }
    } on Object {
      return null;
    }
    return null;
  }

  static bool _looksLikeEmail(String value) {
    if (value.length < 5 || value.length > 254) return false;
    final at = value.indexOf('@');
    if (at <= 0 || at >= value.length - 1) return false;
    return value.indexOf('.', at + 1) > at;
  }
}
