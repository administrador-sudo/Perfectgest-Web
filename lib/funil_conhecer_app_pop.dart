import 'package:flutter/material.dart';

import 'brand_palette.dart';
import 'l10n/site_contabilidade_funil_texts.dart';
import 'lead_capture_service.dart';
import 'site_public_urls.dart';

class FunilConhecerAppDados {
  const FunilConhecerAppDados({
    required this.nome,
    required this.email,
    required this.whatsapp,
  });

  final String nome;
  final String email;
  final String whatsapp;
}

Future<FunilConhecerAppDados?> showFunilConhecerAppPop(BuildContext context) {
  return showDialog<FunilConhecerAppDados>(
    context: context,
    builder: (ctx) => const _FunilConhecerAppPop(),
  );
}

class _FunilConhecerAppPop extends StatefulWidget {
  const _FunilConhecerAppPop();

  @override
  State<_FunilConhecerAppPop> createState() => _FunilConhecerAppPopState();
}

class _FunilConhecerAppPopState extends State<_FunilConhecerAppPop> {
  final _nomeCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _whatsCtrl = TextEditingController();
  final _hpCtrl = TextEditingController();
  bool _consent = false;
  bool _enviando = false;
  String? _erro;

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _emailCtrl.dispose();
    _whatsCtrl.dispose();
    _hpCtrl.dispose();
    super.dispose();
  }

  String _digits(String raw) => raw.replaceAll(RegExp(r'\D'), '');

  Future<void> _enviar(SiteContabilidadeFunilTexts st) async {
    final nome = _nomeCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final whats = _digits(_whatsCtrl.text);
    if (nome.length < 2) {
      setState(() => _erro = 'name_invalid');
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      setState(() => _erro = 'email_invalid');
      return;
    }
    if (whats.length < 10) {
      setState(() => _erro = 'whatsapp_invalid');
      return;
    }
    if (!_consent) {
      setState(() => _erro = 'consent_required');
      return;
    }
    setState(() {
      _enviando = true;
      _erro = null;
    });
    final locale = Localizations.localeOf(context).toLanguageTag();
    await LeadCaptureService.submit(
      nome: nome,
      email: email,
      comentario: '[FUNIL CONHECER APP] WhatsApp $whats',
      consent: true,
      locale: locale,
      websiteHoneypot: _hpCtrl.text,
    );
    if (!mounted) return;
    Navigator.of(context).pop(
      FunilConhecerAppDados(nome: nome, email: email, whatsapp: whats),
    );
  }

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        st.conhecerPopTitle,
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: _enviando ? null : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Text(st.conhecerPopLead, style: const TextStyle(fontSize: 13, height: 1.35)),
                const SizedBox(height: 12),
                TextField(
                  controller: _nomeCtrl,
                  enabled: !_enviando,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: st.fieldName,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailCtrl,
                  enabled: !_enviando,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: st.fieldEmail,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _whatsCtrl,
                  enabled: !_enviando,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: st.fieldWhatsApp,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: SizedBox(
                    height: 0,
                    child: TextField(
                      controller: _hpCtrl,
                      decoration: const InputDecoration(labelText: 'hp_site'),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _consent,
                      activeColor: BrandPalette.goldWarm,
                      onChanged: _enviando ? null : (v) => setState(() => _consent = v ?? false),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Wrap(
                          children: [
                            Text(st.consentPrefix, style: const TextStyle(fontSize: 13)),
                            InkWell(
                              onTap: () => Navigator.of(context).pushNamed(kSitePrivacyPolicyPath),
                              child: Text(
                                st.consentLinkLabel,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: BrandPalette.goldWarm,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(st.consentSuffix, style: const TextStyle(fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (_erro != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    st.errorForCode(_erro!),
                    style: const TextStyle(color: Color(0xFFB3261E), fontWeight: FontWeight.w600),
                  ),
                ],
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _enviando ? null : () => _enviar(st),
                  child: Text(_enviando ? st.conhecerPopSending : st.conhecerPopDownload),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
