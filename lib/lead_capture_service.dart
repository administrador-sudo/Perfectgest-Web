import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'lead_api_config.dart';

class LeadCaptureResult {
  const LeadCaptureResult({required this.ok, this.errorMessage});

  final bool ok;
  final String? errorMessage;
}

class LeadCaptureService {
  static String get _healthUrl {
    // Deriva a URL de health a partir da URL base da API.
    final base = kLeadsApiUrl;
    final idx = base.indexOf('/api/');
    return idx >= 0 ? '${base.substring(0, idx)}/health' : '$base/health';
  }

  /// Verifica se o servidor está acessível (sem timeout longo).
  /// Retorna `null` se OK, ou o código de erro adequado.
  static Future<String?> _checkHealth() async {
    try {
      final response = await http
          .get(Uri.parse(_healthUrl))
          .timeout(const Duration(seconds: 12));
      if (response.statusCode == 200) return null; // OK
      if (response.statusCode == 503) return 'api_unavailable';
      return 'api_not_deployed';
    } on http.ClientException {
      return 'api_not_deployed';
    } on Exception catch (e) {
      final msg = e.toString();
      if (msg.contains('TimeoutException') || msg.contains('timed out')) {
        return 'api_waking';
      }
      return 'api_not_deployed';
    }
  }

  static Future<LeadCaptureResult> submit({
    required String nome,
    required String email,
    required String comentario,
    required bool consent,
    required String locale,
    String websiteHoneypot = '',
  }) async {
    if (!consent) {
      return const LeadCaptureResult(
        ok: false,
        errorMessage: 'consent_required',
      );
    }
    final trimmedName = nome.trim();
    final trimmedEmail = email.trim();
    if (trimmedName.length < 2) {
      return const LeadCaptureResult(ok: false, errorMessage: 'name_invalid');
    }
    if (!_looksLikeEmail(trimmedEmail)) {
      return const LeadCaptureResult(ok: false, errorMessage: 'email_invalid');
    }
    if (kLeadsApiUrl.isEmpty) {
      return const LeadCaptureResult(ok: false, errorMessage: 'api_unconfigured');
    }

    // Health check rápido — distingue "servidor inexistente" de "timeout no POST".
    final healthError = await _checkHealth();
    if (healthError == 'api_waking') {
      // Servidor a arrancar — espera e tenta o POST normalmente (cold start).
      debugPrint('[LeadCapture] Cold start detectado — aguardando...');
    } else if (healthError != null) {
      debugPrint('[LeadCapture] Health check falhou: $healthError');
      return LeadCaptureResult(ok: false, errorMessage: healthError);
    }

    try {
      final response = await http
          .post(
            Uri.parse(kLeadsApiUrl),
            headers: const {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'nome': trimmedName,
              'email': trimmedEmail,
              'comentario': comentario.trim(),
              'consent': true,
              'locale': locale,
              'website': websiteHoneypot,
            }),
          )
          .timeout(const Duration(seconds: 90));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const LeadCaptureResult(ok: true);
      }
      if (response.statusCode == 503) {
        return const LeadCaptureResult(ok: false, errorMessage: 'api_unavailable');
      }
      if (response.statusCode == 404) {
        return const LeadCaptureResult(ok: false, errorMessage: 'api_not_deployed');
      }
      debugPrint('[LeadCapture] HTTP ${response.statusCode}: ${response.body}');
      return const LeadCaptureResult(ok: false, errorMessage: 'server_error');
    } on http.ClientException catch (e, st) {
      debugPrint('[LeadCapture] ClientException: $e\n$st');
      return const LeadCaptureResult(ok: false, errorMessage: 'api_not_deployed');
    } on Exception catch (e, st) {
      final msg = e.toString();
      if (msg.contains('TimeoutException') || msg.contains('timed out')) {
        return const LeadCaptureResult(ok: false, errorMessage: 'api_waking');
      }
      debugPrint('[LeadCapture] $e\n$st');
      return const LeadCaptureResult(ok: false, errorMessage: 'network_error');
    }
  }

  static bool _looksLikeEmail(String value) {
    if (value.length < 5 || value.length > 254) return false;
    final at = value.indexOf('@');
    if (at <= 0 || at >= value.length - 1) return false;
    return value.indexOf('.', at + 1) > at;
  }
}
