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

    try {
      final response = await http
          .post(
            Uri.parse(kLeadsApiUrl),
            headers: const {'Content-Type': 'application/json'},
            body: jsonEncode({
              'nome': trimmedName,
              'email': trimmedEmail,
              'comentario': comentario.trim(),
              'consent': true,
              'locale': locale,
              'website': websiteHoneypot,
            }),
          )
          .timeout(const Duration(seconds: 25));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const LeadCaptureResult(ok: true);
      }
      if (response.statusCode == 503) {
        return const LeadCaptureResult(ok: false, errorMessage: 'api_unavailable');
      }
      debugPrint('[LeadCapture] HTTP ${response.statusCode}: ${response.body}');
      return const LeadCaptureResult(ok: false, errorMessage: 'server_error');
    } catch (e, st) {
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
