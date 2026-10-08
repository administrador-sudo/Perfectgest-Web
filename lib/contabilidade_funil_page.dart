import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_theme.dart';
import 'asset_screenshot.dart';
import 'brand_palette.dart';
import 'company_legal.dart';
import 'l10n/site_contabilidade_funil_texts.dart';
import 'lead_capture_service.dart';
import 'locale_controller.dart';
import 'metallic_site_shell.dart';
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;
import 'site_hero_wordmark.dart';
import 'site_public_urls.dart';
import 'site_surface.dart';

const Color kFunilGreen = BrandPalette.goldWarm;
const Color kFunilA1Purple = Color(0xFF7A2E9A);
const Color kFunilBg = Color(0xFFF4F7F5);
const Color kFunilInk = Color(0xFF14211C);

const String kFunilImgDir = 'IMAGENS_APP/IMAGENS NOVA PAGE';

class FunilImg {
  static const welcome = '$kFunilImgDir/Screenshot_20260825-190957.jpg';
  static const accountant = '$kFunilImgDir/Screenshot_20260825-191019.jpg';
  static const mei = '$kFunilImgDir/Screenshot_20260825-191024.jpg';
  static const tabletNfe = '$kFunilImgDir/Screenshot_20260826-094155.jpg';
  static const home = '$kFunilImgDir/Screenshot_20261008-165617.jpg';
  static const close = '$kFunilImgDir/Screenshot_20261008-165716.jpg';
  static const duties = '$kFunilImgDir/Screenshot_20261008-165743.jpg';
  static const menu = '$kFunilImgDir/Screenshot_20261008-165818.jpg';
  static const invoices = '$kFunilImgDir/Screenshot_20261008-165926.jpg';
  static const phoneNfe = '$kFunilImgDir/phone_nfe.jpeg';
}

const List<({String id, double monthly, bool highlight})> kFunilTiers =
    <({String id, double monthly, bool highlight})>[
  (id: 'mei', monthly: 59.99, highlight: false),
  (id: 'fidelizado', monthly: 54.99, highlight: false),
  (id: 'essencial', monthly: 199.99, highlight: true),
  (id: 'standard', monthly: 299.99, highlight: false),
  (id: 'avancado', monthly: 399.99, highlight: false),
];

bool _tierIsMei(String id) => id == 'mei' || id == 'fidelizado';

List<({String id, double monthly, bool highlight})> _tiersOf(String? tipo) {
  if (tipo == 'MEI') {
    return kFunilTiers.where((t) => _tierIsMei(t.id)).toList();
  }
  if (tipo == 'ME') {
    return kFunilTiers.where((t) => !_tierIsMei(t.id)).toList();
  }
  return List<({String id, double monthly, bool highlight})>.of(kFunilTiers);
}

class ContabilidadeFunilPage extends StatefulWidget {
  const ContabilidadeFunilPage({super.key});

  @override
  State<ContabilidadeFunilPage> createState() => _ContabilidadeFunilPageState();
}

class _ContabilidadeFunilPageState extends State<ContabilidadeFunilPage> {
  final _formKey = GlobalKey<FormState>();
  final _planosKey = GlobalKey();
  final _formAnchorKey = GlobalKey();
  final _nomeCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _whatsAppCtrl = TextEditingController();
  final _razaoCtrl = TextEditingController();
  final _cnpjCtrl = TextEditingController();
  final _honeypotCtrl = TextEditingController();

  String? _tipo;
  String? _crc;
  String? _faixaId = 'essencial';
  bool _folha = false;
  bool _ir = false;
  bool _a1 = false;
  bool _consent = false;
  bool _submitting = false;
  bool _success = false;
  String? _errorCode;

  @override
  void initState() {
    super.initState();
    seo_meta.applyContabilidadeFunilSeoMetaTags();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (Uri.base.fragment == 'planos') _scrollTo(_planosKey);
    });
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _emailCtrl.dispose();
    _whatsAppCtrl.dispose();
    _razaoCtrl.dispose();
    _cnpjCtrl.dispose();
    _honeypotCtrl.dispose();
    seo_meta.restoreGlobalSeoMetaTags();
    super.dispose();
  }

  double get _faixaMensal {
    for (final t in kFunilTiers) {
      if (t.id == _faixaId) return t.monthly;
    }
    return 0;
  }

  String _brl(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  String _digits(String raw) => raw.replaceAll(RegExp(r'\D'), '');

  String _comentarioLinha() {
    final st = SiteContabilidadeFunilTexts.of(context);
    final faixa = _faixaId == null ? '-' : st.planName(_faixaId!);
    final acomp = _tipo == 'MEI'
        ? 'MEI sem contador'
        : (_crc == 'com' ? 'ME com contador' : 'ME sem contador');
    final line =
        '[CONTABILIDADE] ${_tipo ?? '-'}; $acomp; $faixa; assinatura ${_brl(_faixaMensal)}/mês; '
        'Folha ${_folha ? 'S' : 'N'}; IR ${_ir ? 'S' : 'N'}; A1 ${_a1 ? 'S' : 'N'}; '
        'WhatsApp ${_digits(_whatsAppCtrl.text)}; CNPJ ${_digits(_cnpjCtrl.text)}; '
        'razão social ${_razaoCtrl.text.trim()}';
    return line.length <= 4000 ? line : line.substring(0, 4000);
  }

  Future<void> _openExternal(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _openPlay() => _openExternal(kPerfectGestContabilIProductUrl);

  Future<void> _openWhatsApp([String? text]) async {
    final uri = text == null || text.isEmpty
        ? Uri.parse('https://wa.me/$kWhatsAppDigits')
        : Uri.parse('https://wa.me/$kWhatsAppDigits').replace(
            queryParameters: <String, String>{'text': text},
          );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  void _goHome() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  Future<void> _submit(SiteContabilidadeFunilTexts st) async {
    if (_submitting) return;
    setState(() {
      _errorCode = null;
    });
    if (_tipo == null) {
      setState(() => _errorCode = 'tipo_required');
      return;
    }
    if (_tipo == 'ME' && _crc == null) {
      setState(() => _errorCode = 'crc_required');
      return;
    }
    if (_faixaId == null) {
      setState(() => _errorCode = 'faixa_required');
      return;
    }
    if (!_consent) {
      setState(() => _errorCode = 'consent_required');
      return;
    }
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _submitting = true);
    final comentario = _comentarioLinha();
    final locale = Localizations.localeOf(context).toLanguageTag();
    final result = await LeadCaptureService.submit(
      nome: _nomeCtrl.text,
      email: _emailCtrl.text,
      comentario: comentario,
      consent: _consent,
      locale: locale,
      websiteHoneypot: _honeypotCtrl.text,
    );
    if (!mounted) return;
    setState(() {
      _submitting = false;
      if (result.ok) {
        _success = true;
      } else {
        _errorCode = result.errorMessage ?? 'server_error';
      }
    });
    if (result.ok) {
      await _openWhatsApp(comentario);
    }
  }

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 720;
    final cs = Theme.of(context).colorScheme;

    return Semantics(
      label: st.semanticsLabel,
      child: SiteBackgroundShell(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: narrow
              ? FloatingActionButton.extended(
                  backgroundColor: cs.primary,
                  foregroundColor: cs.onPrimary,
                  onPressed: () => _openWhatsApp(),
                  icon: const Icon(Icons.chat_rounded),
                  label: Text(st.whatsAppFab),
                )
              : null,
          body: Column(
            children: [
              _FunilHeader(st: st),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(narrow ? 16 : 24, 20, narrow ? 16 : 24, 48),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _HeroBlock(
                            st: st,
                            onLogo: _goHome,
                            onKnowApp: _openPlay,
                            onSeePlans: () => _scrollTo(_planosKey),
                          ),
                          const SizedBox(height: 28),
                          _SectionCard(
                            title: st.proofTitle,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(st.proofBody),
                                const SizedBox(height: 12),
                                _FunilShot(asset: FunilImg.accountant, caption: st.shotCaption('accountant')),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          _SectionCard(
                            title: st.featuresTitle,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (final f in st.features)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('·  ', style: TextStyle(color: kFunilGreen, fontWeight: FontWeight.w800)),
                                        Expanded(child: Text(f)),
                                      ],
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                _FunilShot(asset: FunilImg.menu, caption: st.shotCaption('menu')),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          _SectionCard(
                            title: st.stepsTitle,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _Step(title: st.stepATitle, body: st.stepABody),
                                _Step(title: st.stepBTitle, body: st.stepBBody),
                                _Step(title: st.stepCTitle, body: st.stepCBody),
                                const SizedBox(height: 8),
                                _FunilShot(asset: FunilImg.mei, caption: st.shotCaption('mei')),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          KeyedSubtree(
                            key: _planosKey,
                            child: _PlansTable(
                              st: st,
                              brl: _brl,
                              onChoose: (id) {
                                setState(() {
                                  _faixaId = id;
                                  if (_tierIsMei(id)) {
                                    _tipo = 'MEI';
                                    _crc = 'sem';
                                  } else {
                                    _tipo = 'ME';
                                    _crc = 'com';
                                  }
                                });
                                _scrollTo(_formAnchorKey);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          KeyedSubtree(
                            key: _formAnchorKey,
                            child: _success ? _SuccessCard(st: st, onPlay: _openPlay, onHome: _goHome) : _buildForm(st),
                          ),
                          const SizedBox(height: 20),
                          _DemoBlock(st: st, onKnowApp: _openPlay),
                          const SizedBox(height: 20),
                          _FaqBlock(st: st),
                          const SizedBox(height: 28),
                          _FunilFooter(st: st, onHome: _goHome),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(SiteContabilidadeFunilTexts st) {
    return _SectionCard(
      title: st.formTitle,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(st.formLead),
            const SizedBox(height: 8),
            Text(st.urgencyNote, style: const TextStyle(fontSize: 13, height: 1.4)),
            const SizedBox(height: 16),
            _field(
              controller: _nomeCtrl,
              label: st.fieldName,
              keyboard: TextInputType.name,
              validator: (v) => (v ?? '').trim().length < 2 ? st.errorForCode('name_invalid') : null,
            ),
            const SizedBox(height: 12),
            _field(
              controller: _emailCtrl,
              label: st.fieldEmail,
              keyboard: TextInputType.emailAddress,
              validator: (v) {
                final t = (v ?? '').trim();
                if (!t.contains('@') || !t.contains('.')) return st.errorForCode('email_invalid');
                return null;
              },
            ),
            const SizedBox(height: 12),
            _field(
              controller: _whatsAppCtrl,
              label: st.fieldWhatsApp,
              keyboard: TextInputType.phone,
              validator: (v) => _digits(v ?? '').length < 10 ? st.errorForCode('whatsapp_invalid') : null,
            ),
            const SizedBox(height: 12),
            _field(
              controller: _razaoCtrl,
              label: st.fieldRazao,
              keyboard: TextInputType.text,
              validator: (v) => (v ?? '').trim().length < 2 ? st.errorForCode('razao_invalid') : null,
            ),
            const SizedBox(height: 12),
            _field(
              controller: _cnpjCtrl,
              label: st.fieldCnpj,
              keyboard: TextInputType.number,
              validator: (v) => _digits(v ?? '').length != 14 ? st.errorForCode('cnpj_invalid') : null,
            ),
            const SizedBox(height: 16),
            Text(st.tipoLabel, style: const TextStyle(fontWeight: FontWeight.w700)),
            RadioGroup<String>(
              groupValue: _tipo,
              onChanged: _submitting
                  ? (_) {}
                  : (v) {
                      if (v == null) return;
                      setState(() {
                        _tipo = v;
                        if (v == 'MEI') {
                          _crc = 'sem';
                          _folha = false;
                          if (_faixaId == null || !_tierIsMei(_faixaId!)) {
                            _faixaId = 'mei';
                          }
                        } else {
                          _crc = 'com';
                          if (_faixaId == null || _tierIsMei(_faixaId!)) {
                            _faixaId = 'essencial';
                          }
                        }
                      });
                    },
              child: Column(
                children: [
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(st.tipoMei),
                    value: 'MEI',
                    activeColor: kFunilGreen,
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(st.tipoMe),
                    value: 'ME',
                    activeColor: kFunilGreen,
                  ),
                ],
              ),
            ),
            if (_tipo == 'ME') ...[
              const SizedBox(height: 8),
              Text(st.crcLabel, style: const TextStyle(fontWeight: FontWeight.w700)),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 2),
                child: Text(st.crcYes),
              ),
              if (st.extrasTitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 2),
                  child: Text(st.extrasTitle, style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
              _addonCheck(label: st.extraFolha, value: _folha, onChanged: (v) => setState(() => _folha = v ?? false)),
              _addonCheck(label: st.extraIr, value: _ir, onChanged: (v) => setState(() => _ir = v ?? false)),
              _addonCheck(label: st.extraA1, value: _a1, onChanged: (v) => setState(() => _a1 = v ?? false)),
            ],
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: ValueKey<String>('${_tipo ?? ''}|${_faixaId ?? ''}'),
              initialValue: _faixaId,
              decoration: InputDecoration(
                labelText: st.faixaLabel,
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              items: [
                for (final t in _tiersOf(_tipo))
                  DropdownMenuItem(
                    value: t.id,
                    child: Text('${st.planName(t.id)} · ${_brl(t.monthly)}/${st.perMonth}'),
                  ),
              ],
              onChanged: _submitting ? null : (v) => setState(() => _faixaId = v),
            ),
            if (_tipo != 'ME')
              _addonCheck(label: st.extraA1, value: _a1, onChanged: (v) => setState(() => _a1 = v ?? false)),
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
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _consent,
                  activeColor: kFunilGreen,
                  onChanged: _submitting ? null : (v) => setState(() => _consent = v ?? false),
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
                              color: kFunilGreen,
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
            if (_errorCode != null) ...[
              const SizedBox(height: 8),
              Text(
                st.errorForCode(_errorCode!),
                style: const TextStyle(color: Color(0xFFB3261E), fontWeight: FontWeight.w600),
              ),
            ],
            const SizedBox(height: 16),
            sitePrimaryActionButton(
              context: context,
              label: _submitting ? st.submittingLabel : st.submitLabel,
              onPressed: _submitting ? () {} : () => _submit(st),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addonCheck({
    required String label,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(label),
      value: value,
      activeColor: kFunilGreen,
      onChanged: _submitting ? null : onChanged,
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required TextInputType keyboard,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      enabled: !_submitting,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    );
  }
}

class _FunilHeader extends StatelessWidget {
  const _FunilHeader({required this.st});

  final SiteContabilidadeFunilTexts st;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: siteHeaderBackground(context),
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children: [
              const Spacer(),
              _LangChip(code: 'pt', label: st.langPt),
              _LangChip(code: 'en', label: st.langEn),
              _LangChip(code: 'es', label: st.langEs),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  const _LangChip({required this.code, required this.label});

  final String code;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale?>(
      valueListenable: appLocaleController,
      builder: (context, manual, _) {
        final active = (manual?.languageCode ?? Localizations.localeOf(context).languageCode) == code;
        return Padding(
          padding: const EdgeInsets.only(left: 4),
          child: TextButton(
            onPressed: () => appLocaleController.setLocale(Locale(code)),
            style: TextButton.styleFrom(
              foregroundColor: active ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
              backgroundColor: active ? Theme.of(context).colorScheme.primary : Colors.transparent,
              minimumSize: const Size(40, 36),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        );
      },
    );
  }
}

class _HeroBlock extends StatelessWidget {
  const _HeroBlock({
    required this.st,
    required this.onLogo,
    required this.onKnowApp,
    required this.onSeePlans,
  });

  final SiteContabilidadeFunilTexts st;
  final VoidCallback onLogo;
  final VoidCallback onKnowApp;
  final VoidCallback onSeePlans;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SiteRaisedBlock(
      goldIntensity: 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SiteHeroWordmark(onTap: onLogo),
          const SizedBox(height: 18),
          siteMetallicGoldText(
            context,
            st.brandLabel,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 8),
          siteMetallicGoldText(
            context,
            st.heroHeadline,
            fontSize: 26,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
          const SizedBox(height: 8),
          Text(
            st.heroHeadlineEmit,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: cs.onSurface.withValues(alpha: 0.82),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            st.heroLead,
            style: siteBodyTextStyle(context, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              sitePrimaryActionButton(context: context, label: st.ctaKnowApp, onPressed: onKnowApp),
              siteMetallicOutlinedButton(context: context, label: st.ctaSeePlans, onPressed: onSeePlans, icon: Icons.list_alt_rounded),
            ],
          ),
          const SizedBox(height: 16),
          _FunilShot(asset: FunilImg.welcome, caption: st.shotCaption('welcome'), height: 640),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SiteRaisedBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          siteSectionTitle(context, title, accentKey: title, fontSize: 18),
          const SizedBox(height: 10),
          DefaultTextStyle.merge(style: siteBodyTextStyle(context, fontSize: 14.5, height: 1.45), child: child),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: kFunilGreen)),
          const SizedBox(height: 4),
          Text(body),
        ],
      ),
    );
  }
}

class _PlansTable extends StatelessWidget {
  const _PlansTable({required this.st, required this.brl, required this.onChoose});

  final SiteContabilidadeFunilTexts st;
  final String Function(double) brl;
  final ValueChanged<String> onChoose;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: st.plansTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(st.plansLead),
          const SizedBox(height: 12),
          Text(st.plansGroupMei, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          const SizedBox(height: 8),
          for (final t in kFunilTiers.where((t) => _tierIsMei(t.id))) _planCard(t),
          const SizedBox(height: 8),
          Text(st.plansGroupMe, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          const SizedBox(height: 8),
          for (final t in kFunilTiers.where((t) => !_tierIsMei(t.id))) _planCard(t),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: kFunilA1Purple.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${st.a1Seal} · ${st.a1Price}',
              style: const TextStyle(color: kFunilA1Purple, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 8),
          Text(st.a1Body),
          const SizedBox(height: 8),
          Text(st.paymentLaterNote, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _planCard(({String id, double monthly, bool highlight}) t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: t.highlight ? const Color(0xFFE8F3EE) : const Color(0xFFF8FAF9),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: t.highlight ? kFunilGreen : const Color(0xFFD7E3DC),
            width: t.highlight ? 1.6 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(st.planName(t.id), style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  Text(
                    '${brl(t.monthly)}/${st.perMonth}',
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ],
              ),
              if (t.highlight)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(st.highlightBadge, style: const TextStyle(color: kFunilGreen, fontWeight: FontWeight.w700, fontSize: 12)),
                ),
              const SizedBox(height: 8),
              for (final item in st.planItems(t.id))
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('·  ', style: TextStyle(color: kFunilGreen, fontWeight: FontWeight.w800, fontSize: 13, height: 1.35)),
                      Expanded(
                        child: Text(item, style: const TextStyle(fontSize: 13, height: 1.35)),
                      ),
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => onChoose(t.id),
                  child: Text(st.ctaChoosePlan),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuccessCard extends StatelessWidget {
  const _SuccessCard({required this.st, required this.onPlay, required this.onHome});

  final SiteContabilidadeFunilTexts st;
  final VoidCallback onPlay;
  final VoidCallback onHome;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: st.successTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.check_circle_outline_rounded, color: kFunilGreen, size: 44),
          const SizedBox(height: 12),
          Text(st.successBody),
          const SizedBox(height: 16),
          sitePrimaryActionButton(context: context, label: st.subscribeApp, onPressed: onPlay),
          const SizedBox(height: 8),
          siteMetallicOutlinedButton(context: context, label: st.backHome, onPressed: onHome, icon: Icons.home_outlined),
        ],
      ),
    );
  }
}

class _FunilShot extends StatelessWidget {
  const _FunilShot({required this.asset, this.caption, this.height = 560});

  final String asset;
  final String? caption;
  final double height;

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    final title = (caption != null && caption!.isNotEmpty) ? caption! : st.demoTitle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (caption != null && caption!.isNotEmpty) ...[
          Text(caption!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
          const SizedBox(height: 8),
        ],
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _showFunilShotPreview(
              context,
              asset: asset,
              title: title,
              zoomHint: st.zoomHint,
            ),
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(
                color: const Color(0xFFEEF3F0),
                child: SizedBox(
                  height: height,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      buildScreenshotAssetImage(
                        assetPath: asset,
                        fit: BoxFit.contain,
                      ),
                      const Positioned(
                        right: 8,
                        top: 8,
                        child: Icon(Icons.zoom_out_map_rounded, size: 22, color: kFunilGreen),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _showFunilShotPreview(
  BuildContext context, {
  required String asset,
  required String title,
  required String zoomHint,
}) {
  final size = MediaQuery.sizeOf(context);
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          width: size.width - 24,
          height: size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 4, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: const Icon(Icons.close_rounded, color: kFunilInk),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  zoomHint,
                  style: TextStyle(fontSize: 12, color: kFunilInk.withValues(alpha: 0.65)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColoredBox(
                      color: const Color(0xFFEEF3F0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return InteractiveViewer(
                            minScale: 1,
                            maxScale: 5,
                            clipBehavior: Clip.hardEdge,
                            boundaryMargin: const EdgeInsets.all(48),
                            child: SizedBox(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              child: buildScreenshotAssetImage(
                                assetPath: asset,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _DemoBlock extends StatelessWidget {
  const _DemoBlock({required this.st, required this.onKnowApp});

  final SiteContabilidadeFunilTexts st;
  final VoidCallback onKnowApp;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: st.demoTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FunilShot(asset: FunilImg.phoneNfe, caption: st.shotCaption('phoneNfe')),
          const SizedBox(height: 16),
          _FunilShot(asset: FunilImg.tabletNfe, caption: st.shotCaption('tabletNfe'), height: 560),
          const SizedBox(height: 16),
          _FunilShot(asset: FunilImg.home, caption: st.shotCaption('home')),
          const SizedBox(height: 16),
          _FunilShot(asset: FunilImg.close, caption: st.shotCaption('close')),
          const SizedBox(height: 16),
          _FunilShot(asset: FunilImg.duties, caption: st.shotCaption('duties')),
          const SizedBox(height: 16),
          _FunilShot(asset: FunilImg.invoices, caption: st.shotCaption('invoices')),
          const SizedBox(height: 12),
          sitePrimaryActionButton(context: context, label: st.ctaKnowApp, onPressed: onKnowApp),
        ],
      ),
    );
  }
}

class _FaqBlock extends StatelessWidget {
  const _FaqBlock({required this.st});

  final SiteContabilidadeFunilTexts st;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: st.faqTitle,
      child: Column(
        children: [
          for (final item in st.faq)
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(item.question, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5)),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(item.body),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _FunilFooter extends StatelessWidget {
  const _FunilFooter({required this.st, required this.onHome});

  final SiteContabilidadeFunilTexts st;
  final VoidCallback onHome;

  @override
  Widget build(BuildContext context) {
    Widget link(String label, String path) {
      return TextButton(
        onPressed: () => Navigator.of(context).pushNamed(path),
        child: Text(label, style: const TextStyle(fontSize: 13)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kCompanyLegalName, style: const TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        Text(st.footerLegal, style: const TextStyle(fontSize: 13, height: 1.4)),
        const SizedBox(height: 6),
        Text(st.footerCrc, style: const TextStyle(fontSize: 13, height: 1.4)),
        const SizedBox(height: 8),
        Text('Honorarios: ${st.honorariosEmail}', style: const TextStyle(fontSize: 13)),
        Text('App: ${st.appEmail}', style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 8),
        Wrap(
          children: [
            link('Privacidade app', '/contabil-i-politica-privacidade'),
            link('Termos', '/contabil-i-termos'),
            link('FAQ app', '/contabil-i-faq'),
            link('Privacidade site', kSitePrivacyPolicyPath),
          ],
        ),
        TextButton(onPressed: onHome, child: Text(st.backHome)),
      ],
    );
  }
}
