import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'lead_capture_service.dart';

/// POST do funil /contabilidade → Function receberLeadFunil (Firestore).
/// Sem Auth. Pré-cadastro geral continua em [LeadCaptureService].
class FunilFirestoreService {
  static const url =
      'https://southamerica-east1-perfectgest-contabilgest.cloudfunctions.net/receberLeadFunil';

  static String faixaApi(String id) => id == 'mei' ? 'basico' : id;

  static Future<LeadCaptureResult> submit({
    required String nome,
    required String email,
    required String whatsapp,
    required String cnpj,
    required String razaoSocial,
    required String regime,
    required String faixa,
    required double boletoHonorarios,
    required bool folha,
    required bool ir,
    required bool a1,
    required bool consent,
    required String locale,
    String websiteHoneypot = '',
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
    final faixaNorm = faixaApi(faixa.trim().toLowerCase());
    const okFaixa = {
      'basico',
      'essencial',
      'standard',
      'avancado',
    };
    if (!okFaixa.contains(faixaNorm)) {
      return const LeadCaptureResult(ok: false, errorMessage: 'faixa_required');
    }

    final body = jsonEncode({
      'nome': trimmedName,
      'email': trimmedEmail,
      'whatsapp': whatsapp.trim(),
      'cnpj': cnpjDigits,
      'razaoSocial': razaoSocial.trim(),
      'regime': regime.trim().toUpperCase(),
      'faixa': faixaNorm,
      'boletoHonorarios': boletoHonorarios,
      'folha': folha,
      'ir': ir,
      'a1': a1,
      'locale': locale,
      'consent': true,
      'hp_site': websiteHoneypot,
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
            .timeout(const Duration(seconds: 20));
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
        debugPrint('[FunilFirestore] HTTP $code: ${response.body}');
        return const LeadCaptureResult(ok: false, errorMessage: 'server_error');
      } on http.ClientException catch (e, st) {
        debugPrint('[FunilFirestore] ClientException: $e\n$st');
        return const LeadCaptureResult(ok: false, errorMessage: 'network_error');
      } on Exception catch (e, st) {
        final msg = e.toString();
        if (msg.contains('TimeoutException') || msg.contains('timed out')) {
          last = const LeadCaptureResult(ok: false, errorMessage: 'api_waking');
          if (attempt == 0) continue;
          return last;
        }
        debugPrint('[FunilFirestore] $e\n$st');
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
