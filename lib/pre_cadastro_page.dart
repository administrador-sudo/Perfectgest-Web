import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'l10n/site_pre_cadastro_texts.dart';
import 'lead_capture_service.dart';
import 'metallic_site_shell.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_language_menu.dart';

class PreCadastroPage extends StatefulWidget {
  const PreCadastroPage({super.key, this.onToggleTheme});

  final VoidCallback? onToggleTheme;

  @override
  State<PreCadastroPage> createState() => _PreCadastroPageState();
}

class _PreCadastroPageState extends State<PreCadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _comentarioCtrl = TextEditingController();
  final _honeypotCtrl = TextEditingController();
  bool _consent = false;
  bool _submitting = false;
  bool _success = false;
  String? _errorCode;

  @override
  void initState() {
    super.initState();
    seo_meta.applyPreCadastroSeoMetaTags();
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _emailCtrl.dispose();
    _comentarioCtrl.dispose();
    _honeypotCtrl.dispose();
    seo_meta.restoreGlobalSeoMetaTags();
    super.dispose();
  }

  Future<void> _submit(SitePreCadastroTexts st) async {
    if (_submitting) return;
    setState(() {
      _errorCode = null;
      _success = false;
    });
    if (!_consent) {
      setState(() => _errorCode = 'consent_required');
      return;
    }
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _submitting = true);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final result = await LeadCaptureService.submit(
      nome: _nomeCtrl.text,
      email: _emailCtrl.text,
      comentario: _comentarioCtrl.text,
      consent: _consent,
      locale: locale,
      websiteHoneypot: _honeypotCtrl.text,
    );
    if (!mounted) return;
    setState(() {
      _submitting = false;
      if (result.ok) {
        _success = true;
        _nomeCtrl.clear();
        _emailCtrl.clear();
        _comentarioCtrl.clear();
        _consent = false;
      } else {
        _errorCode = result.errorMessage ?? 'server_error';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 400 ? 16.0 : 24.0;
    final st = SitePreCadastroTexts.of(context);

    return Semantics(
      label: st.semanticsLabel,
      child: Scaffold(
        backgroundColor: siteScaffoldBackground(context),
        appBar: sitePolicyAppBar(
          context,
          title: st.appBarTitle,
          onToggleTheme: widget.onToggleTheme,
        ),
        body: SiteBackgroundShell(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(padH, 16, padH, 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: _success ? _buildSuccess(context, st, cs) : _buildForm(context, st, cs),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, SitePreCadastroTexts st, ColorScheme cs) {
    return SiteSectionPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.check_circle_outline_rounded, color: cs.primary, size: 48),
          const SizedBox(height: 16),
          siteSectionTitle(context, st.successTitle, fontSize: 20),
          const SizedBox(height: 12),
          Text(st.successBody, style: siteBodyTextStyle(context)),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacementNamed('/');
              }
            },
            child: Text(st.backHomeLabel),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, SitePreCadastroTexts st, ColorScheme cs) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          siteSectionTitle(context, st.headline, fontSize: wHeadline(context)),
          const SizedBox(height: 8),
          Text(st.intro, style: siteBodyTextStyle(context)),
          const SizedBox(height: 20),
          SiteSectionPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _field(
                  controller: _nomeCtrl,
                  label: st.fieldNameLabel,
                  hint: st.fieldNameHint,
                  keyboard: TextInputType.name,
                  validator: (v) {
                    if ((v ?? '').trim().length < 2) {
                      return st.errorForCode('name_invalid');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                _field(
                  controller: _emailCtrl,
                  label: st.fieldEmailLabel,
                  hint: st.fieldEmailHint,
                  keyboard: TextInputType.emailAddress,
                  validator: (v) {
                    final t = (v ?? '').trim();
                    if (!t.contains('@') || !t.contains('.')) {
                      return st.errorForCode('email_invalid');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                _field(
                  controller: _comentarioCtrl,
                  label: st.fieldCommentLabel,
                  hint: st.fieldCommentHint,
                  keyboard: TextInputType.multiline,
                  maxLines: 4,
                  required: false,
                ),
                // Honeypot — oculto para utilizadores; bots preenchem.
                Opacity(
                  opacity: 0,
                  child: SizedBox(
                    height: 0,
                    child: TextField(
                      controller: _honeypotCtrl,
                      autofillHints: const [],
                      decoration: const InputDecoration(labelText: 'Website'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _consent,
                      onChanged: _submitting
                          ? null
                          : (v) => setState(() => _consent = v ?? false),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Wrap(
                          children: [
                            Text(st.consentPrefix, style: siteBodyTextStyle(context, fontSize: 13)),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('/politica-privacidade-site'),
                              child: Text(
                                st.consentLinkLabel,
                                style: siteBodyTextStyle(context, fontSize: 13).copyWith(
                                  color: cs.primary,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(st.consentSuffix, style: siteBodyTextStyle(context, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (_errorCode != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    st.errorForCode(_errorCode!),
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: cs.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: _submitting ? null : () => _submit(st),
                  icon: _submitting
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: cs.onPrimary,
                          ),
                        )
                      : const Icon(Icons.send_rounded, size: 18),
                  label: Text(_submitting ? st.submittingLabel : st.submitLabel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double wHeadline(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 400 ? 18 : 22;

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    required TextInputType keyboard,
    String? Function(String?)? validator,
    int maxLines = 1,
    bool required = true,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      maxLines: maxLines,
      enabled: !_submitting,
      validator: required ? validator : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    );
  }
}
