import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'funil_firestore_service.dart';
import 'lead_capture_service.dart';

/// POST do funil /contabilidade_Escritorio001 → Lambda crc-lab-api (AWS).
/// Não usa Firebase. O funil PerfectGest continua em [FunilFirestoreService].
class FunilAwsService {
  static const url =
      'https://jk7eom0uw7.execute-api.sa-east-1.amazonaws.com';

  static Future<LeadCaptureResult> submitLead({
    required String nome,
    required String email,
    required String whatsapp,
    required String cnpj,
    required String razaoSocial,
    required String regime,
    required String faixa,
    required double boletoHonorarios,
    required double primeiroBoleto,
    required String fichaProposta,
    required bool aceiteCobranca,
    required bool folha,
    required bool ir,
    required bool a1,
    required bool consent,
    required String locale,
    String enquadramento = '',
    bool pixHonorariosInformado = false,
    double valorPixHonorarios = 0,
    bool pixA1Informado = false,
    String websiteHoneypot = '',
    String comprovanteNome = '',
    String comprovanteMime = '',
    String comprovanteBase64 = '',
  }) async {
    if (!consent) {
      return const LeadCaptureResult(ok: false, errorMessage: 'consent_required');
    }
    final trimmedName = nome.trim();
    final trimmedEmail = email.trim();
    if (trimmedName.length < 2) {
      return const LeadCaptureResult(ok: false, errorMessage: 'name_invalid');
    }
    if (!_looksLikeEmail(trimmedEmail)) {
      return const LeadCaptureResult(ok: false, errorMessage: 'email_invalid');
    }
    final cnpjDigits = cnpj.replaceAll(RegExp(r'\D'), '');
    if (cnpjDigits.isNotEmpty && cnpjDigits.length != 14) {
      return const LeadCaptureResult(ok: false, errorMessage: 'cnpj_invalid');
    }
    final eq = enquadramento.trim().toLowerCase();
    const okAvulso = {
      'abertura',
      'transformacao_mei_me',
      'viabilidade',
    };
    final avulso = okAvulso.contains(eq);
    final faixaNorm = avulso ? eq : FunilFirestoreService.faixaApi(faixa.trim().toLowerCase());
    const okFaixa = {
      'basico',
      'fidelizado',
      'essencial',
      'standard',
      'avancado',
    };
    if (!avulso && !okFaixa.contains(faixaNorm)) {
      return const LeadCaptureResult(ok: false, errorMessage: 'faixa_required');
    }

    return _postCallable('receberLeadFunil', {
      'nome': trimmedName,
      'email': trimmedEmail,
      'whatsapp': whatsapp.trim(),
      'cnpj': cnpjDigits,
      'razaoSocial': razaoSocial.trim(),
      'regime': avulso ? eq : regime.trim().toUpperCase(),
      'faixa': faixaNorm,
      'enquadramento': eq.isEmpty ? faixaNorm : eq,
      'boletoHonorarios': boletoHonorarios,
      'primeiroBoleto': primeiroBoleto,
      'fichaProposta': fichaProposta.trim(),
      'aceiteCobranca': aceiteCobranca,
      'folha': folha,
      'ir': ir,
      'a1': a1,
      'locale': locale,
      'consent': true,
      'pixHonorariosInformado': pixHonorariosInformado,
      'valorPixHonorarios': valorPixHonorarios,
      'pixA1Informado': pixA1Informado,
      'hp_site': websiteHoneypot,
      if (comprovanteBase64.isNotEmpty) ...{
        'comprovanteNome': comprovanteNome,
        'comprovanteMime': comprovanteMime,
        'comprovanteBase64': comprovanteBase64,
      },
    });
  }

  static Future<LeadCaptureResult> submitA1({
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
    String complemento = '',
    bool pixA1Informado = false,
    String websiteHoneypot = '',
    String comprovanteNome = '',
    String comprovanteMime = '',
    String comprovanteBase64 = '',
  }) async {
    if (!consent) {
      return const LeadCaptureResult(ok: false, errorMessage: 'consent_required');
    }
    return _postCallable('receberSolicitacaoA1Funil', {
      'tipo_pessoa': tipoPessoa,
      'cnpj_cpf': cnpjCpf,
      'razao_social': razaoSocial,
      'email': email,
      'telefone': telefone,
      'cep': cep,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'complemento': complemento,
      'cidade': cidade,
      'estado': estado,
      'consent': true,
      'pixA1Informado': pixA1Informado,
      'website': websiteHoneypot,
      if (comprovanteBase64.isNotEmpty) ...{
        'comprovanteNome': comprovanteNome,
        'comprovanteMime': comprovanteMime,
        'comprovanteBase64': comprovanteBase64,
      },
    });
  }

  static Future<LeadCaptureResult> _postCallable(
    String callable,
    Map<String, dynamic> data,
  ) async {
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
              body: jsonEncode({'callable': callable, 'data': data}),
            )
            .timeout(const Duration(seconds: 60));
        final code = response.statusCode;
        if (code == 400 || code == 429) {
          return LeadCaptureResult(
            ok: false,
            errorMessage: _errorFromBody(response.body) ?? 'server_error',
          );
        }
        if (code >= 200 && code < 300) {
          if (_jsonOkGravado(response.body)) {
            return const LeadCaptureResult(ok: true);
          }
          return const LeadCaptureResult(
            ok: false,
            errorMessage: 'server_error',
          );
        }
        debugPrint('[FunilAws] HTTP $code: ${response.body}');
        return const LeadCaptureResult(ok: false, errorMessage: 'server_error');
      } on http.ClientException catch (e, st) {
        debugPrint('[FunilAws] ClientException: $e\n$st');
        return const LeadCaptureResult(ok: false, errorMessage: 'network_error');
      } on Exception catch (e, st) {
        final msg = e.toString();
        if (msg.contains('TimeoutException') || msg.contains('timed out')) {
          last = const LeadCaptureResult(ok: false, errorMessage: 'api_waking');
          if (attempt == 0) continue;
          return last;
        }
        debugPrint('[FunilAws] $e\n$st');
        return const LeadCaptureResult(ok: false, errorMessage: 'network_error');
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
      if (decoded['gravado'] == false) return false;
      return decoded['gravado'] == true ||
          decoded['id'] != null ||
          decoded['pedidoId'] != null;
    } on Object {
      return false;
    }
  }

  static String? _errorFromBody(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      if (decoded['error'] is String) return decoded['error'] as String;
      if (decoded['message'] is String) return decoded['message'] as String;
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
