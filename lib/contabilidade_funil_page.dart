import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_theme.dart';
import 'asset_screenshot.dart';
import 'brand_palette.dart';
import 'company_legal.dart';
import 'l10n/site_contabilidade_funil_texts.dart';
import 'a1_quality_cert_pop.dart';
import 'funil_a1_service.dart';
import 'funil_firestore_service.dart';
import 'funil_pix_ticket_pop.dart';
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
  static const qualityCert = '$kFunilImgDir/certificado_quality.png';
}

const List<({String id, double monthly, bool highlight})> kFunilTiers =
    <({String id, double monthly, bool highlight})>[
  (id: 'mei', monthly: 40.00, highlight: false),
  (id: 'fidelizado', monthly: 40.00, highlight: false),
  (id: 'essencial', monthly: 180.00, highlight: true),
  (id: 'standard', monthly: 280.00, highlight: false),
  (id: 'avancado', monthly: 380.00, highlight: false),
];

const double kFunilMeiAnual = 456.99;
const double kFunilFolhaMensal = 99.99;
const double kFunilIrAno = 49.99;
const double kFunilA1Ano = 119.99;

bool _tierIsFidelizado(String id) => id == 'fidelizado';
bool _tierIsMei(String id) => id == 'mei' || _tierIsFidelizado(id);

String _precoFaixa(
  ({String id, double monthly, bool highlight}) t,
  SiteContabilidadeFunilTexts st,
  String Function(double) brl,
) {
  if (_tierIsFidelizado(t.id)) return '${brl(kFunilMeiAnual)}/${st.perYear}';
  return '${brl(t.monthly)}/${st.perMonth}';
}

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
  bool _pixHonorariosInformado = false;
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

  bool get _meiFidelizado => _tierIsFidelizado(_faixaId ?? '');

  double get _faixaMensal {
    for (final t in kFunilTiers) {
      if (t.id == _faixaId) return t.monthly;
    }
    return 0;
  }

  double get _boletoMensal {
    final folha = _folha ? kFunilFolhaMensal : 0.0;
    if (_meiFidelizado) return folha;
    return _faixaMensal + folha;
  }

  double get _extrasPrimeiroBoleto =>
      (_a1 ? kFunilA1Ano : 0) + (_ir ? kFunilIrAno : 0);

  double get _primeiroBoleto {
    if (_meiFidelizado) {
      return kFunilMeiAnual + _boletoMensal + _extrasPrimeiroBoleto;
    }
    return _boletoMensal + _extrasPrimeiroBoleto;
  }

  String _itens12(SiteContabilidadeFunilTexts st) {
    if (_meiFidelizado) {
      return _folha ? st.itemFolha : '';
    }
    final parts = <String>[st.itemHonorarios];
    if (_folha) parts.add(st.itemFolha);
    return parts.join(' + ');
  }

  String _itensPrimeiro(SiteContabilidadeFunilTexts st) {
    final parts = <String>[st.itemHonorarios];
    if (_folha) parts.add(st.itemFolha);
    if (_a1) parts.add(st.itemA1);
    if (_ir) parts.add(st.itemIr);
    return parts.join(' + ');
  }

  String _brl(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  Future<void> _abrirPixHonorarios(SiteContabilidadeFunilTexts st) async {
    if (_tipo == null || _faixaId == null) {
      setState(() => _errorCode = 'faixa_required');
      return;
    }
    final linhas = <FunilPixLinha>[
      FunilPixLinha(
        descricao: st.planName(_faixaId!),
        valor: _meiFidelizado ? kFunilMeiAnual : _faixaMensal,
      ),
      if (_folha)
        FunilPixLinha(descricao: st.extraFolha, valor: kFunilFolhaMensal),
      if (_ir) FunilPixLinha(descricao: st.extraIr, valor: kFunilIrAno),
      if (_a1) FunilPixLinha(descricao: st.extraA1, valor: kFunilA1Ano),
    ];
    final ok = await showFunilPixTicket(
      context: context,
      titulo: 'Honorarios / Servicos',
      linhas: linhas,
      txidPrefixo: 'HON',
    );
    if (ok && mounted) {
      setState(() => _pixHonorariosInformado = true);
    }
  }

  String _digits(String raw) => raw.replaceAll(RegExp(r'\D'), '');

  String _comentarioLinha() {
    final st = SiteContabilidadeFunilTexts.of(context);
    final faixa = _faixaId == null ? '-' : st.planName(_faixaId!);
    final acomp = _tipo == 'MEI'
        ? 'MEI sem contador'
        : (_crc == 'com' ? 'ME com contador' : 'ME sem contador');
    final line =
        '[CONTABILIDADE] ${_tipo ?? '-'}; $acomp; $faixa; honorários ${_meiFidelizado ? '${_brl(kFunilMeiAnual)} à vista/ano' : '${_brl(_faixaMensal)}/mês'}; '
        'Folha ${_folha ? 'S ${_brl(kFunilFolhaMensal)}' : 'N'}; '
        '${_meiFidelizado && !_folha ? '12x N; ' : '12x S ${_brl(_boletoMensal)}/mês (${_itens12(st)}); '}'
        '1ª NF e boleto ${_brl(_primeiroBoleto)} (${_itensPrimeiro(st)}); '
        'A1 ${_a1 ? 'S renovação 12 meses' : 'N'}; '
        'IR ${_ir ? 'S cobrado no mês do IR do próximo ano' : 'N'}; '
        'cancelamento 30 dias (senão proporcional até cessar); '
        'resposta 1 dia útil; '
        'WhatsApp ${_digits(_whatsAppCtrl.text)}; CNPJ ${_digits(_cnpjCtrl.text)}; '
        'razão social ${_razaoCtrl.text.trim()}';
    return line.length <= 4000 ? line : line.substring(0, 4000);
  }

  String _aceiteEmFmt() {
    final a = DateTime.now();
    String d2(int n) => n.toString().padLeft(2, '0');
    return '${d2(a.day)}/${d2(a.month)}/${a.year} ${d2(a.hour)}:${d2(a.minute)}';
  }

  String _fichaProposta(SiteContabilidadeFunilTexts st) {
    final mensal = _boletoMensal;
    final primeiro = _primeiroBoleto;
    final linhas = <String>[
      st.proposalTitle,
      '${st.fieldName}: ${_nomeCtrl.text.trim()}',
      '${st.fieldEmail}: ${_emailCtrl.text.trim()}',
      '${st.fieldWhatsApp}: ${_whatsAppCtrl.text.trim()}',
      '${st.fieldRazao}: ${_razaoCtrl.text.trim()}',
      '${st.fieldCnpj}: ${_cnpjCtrl.text.trim()}',
      '${st.tipoLabel}: ${_tipo == 'MEI' ? st.tipoMei : st.tipoMe}',
      '${st.faixaLabel}: ${_faixaId == null ? '-' : st.planName(_faixaId!)}',
      '${st.proposalHonorariosLabel}: ${_meiFidelizado ? '${_brl(kFunilMeiAnual)}/${st.perYear}' : '${_brl(_faixaMensal)}/${st.perMonth}'}',
      if (_meiFidelizado) st.planMeiDesconto,
      if (_folha) '${st.extraFolha}: ${_brl(kFunilFolhaMensal)}/${st.perMonth}',
      if (_ir) '${st.extraIr}: ${_brl(kFunilIrAno)}',
      if (_a1) '${st.extraA1}: ${_brl(kFunilA1Ano)}',
      st.officeTotalLabel,
      if (_meiFidelizado && !_folha) st.proposalMeiAvista(_brl(kFunilMeiAnual)),
      if (!_meiFidelizado || _folha) st.officeTotalHint(_itens12(st), _brl(mensal)),
      if (!_meiFidelizado || _folha) st.proposalParcelarHint(_brl(mensal)),
      st.proposalFirstNfBoleto(_itensPrimeiro(st), _brl(primeiro)),
      if (_meiFidelizado) st.proposalNfObsMei(_brl(kFunilMeiAnual)),
      if (!_meiFidelizado) st.proposalNfObs(_brl(mensal)),
      if (_a1) st.proposalA1Rule,
      if (_ir) st.proposalIrRule,
      st.proposalRenewal,
      st.proposalCancel,
      st.proposalSla,
      st.proposalAceiteCobranca,
      'Aceite em: ${_aceiteEmFmt()}',
    ];
    final text = linhas.join('\n');
    return text.length <= 8000 ? text : text.substring(0, 8000);
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

  void _setTipo(String v) {
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
  }

  Widget _tipoLinha({
    required String label,
    required bool selected,
    required VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(label),
      leading: Icon(
        selected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: kFunilGreen,
      ),
      onTap: onTap,
    );
  }

  String _textoFaixa(SiteContabilidadeFunilTexts st) {
    for (final t in _tiersOf(_tipo)) {
      if (t.id == _faixaId) {
        return '${st.planName(t.id)} · ${_precoFaixa(t, st, _brl)}';
      }
    }
    return '';
  }

  Future<void> _escolherFaixa(SiteContabilidadeFunilTexts st) async {
    final escolhido = await showDialog<String>(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text(st.faixaLabel),
          children: [
            for (final t in _tiersOf(_tipo))
              SimpleDialogOption(
                onPressed: () => Navigator.of(ctx).pop(t.id),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text('${st.planName(t.id)} · ${_precoFaixa(t, st, _brl)}'),
                ),
              ),
          ],
        );
      },
    );
    if (escolhido != null && mounted) setState(() => _faixaId = escolhido);
  }

  Widget _campoFaixa(SiteContabilidadeFunilTexts st) {
    return InkWell(
      onTap: _submitting ? null : () => _escolherFaixa(st),
      child: InputDecorator(
        isEmpty: _textoFaixa(st).isEmpty,
        decoration: InputDecoration(
          labelText: st.faixaLabel,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.fromLTRB(12, 14, 4, 14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _textoFaixa(st),
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(fontSize: 14, height: 1.25),
                  ),
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  bool _formPronto() {
    setState(() => _errorCode = null);
    if (_tipo == null) {
      setState(() => _errorCode = 'tipo_required');
      return false;
    }
    if (_tipo == 'ME' && _crc == null) {
      setState(() => _errorCode = 'crc_required');
      return false;
    }
    if (_faixaId == null) {
      setState(() => _errorCode = 'faixa_required');
      return false;
    }
    if (!_consent) {
      setState(() => _errorCode = 'consent_required');
      return false;
    }
    if (!(_formKey.currentState?.validate() ?? false)) return false;
    return true;
  }

  Future<void> _openProposal(SiteContabilidadeFunilTexts st) async {
    if (_submitting) return;
    if (!_formPronto()) return;
    final mensal = _boletoMensal;
    final primeiro = _primeiroBoleto;
    await showDialog<void>(
      context: context,
      builder: (ctx) {
        return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SiteRaisedBlock(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480, maxHeight: 640),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(st.proposalTitle, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                        const SizedBox(height: 12),
                        _resumoLinha(st.fieldName, _nomeCtrl.text.trim()),
                        _resumoLinha(st.fieldEmail, _emailCtrl.text.trim()),
                        _resumoLinha(st.fieldWhatsApp, _whatsAppCtrl.text.trim()),
                        _resumoLinha(st.fieldRazao, _razaoCtrl.text.trim()),
                        _resumoLinha(st.fieldCnpj, _cnpjCtrl.text.trim()),
                        _resumoLinha(st.tipoLabel, _tipo == 'MEI' ? st.tipoMei : st.tipoMe),
                        _resumoLinha(st.faixaLabel, st.planName(_faixaId!)),
                        _resumoLinha(
                          st.proposalHonorariosLabel,
                          _meiFidelizado
                              ? '${_brl(kFunilMeiAnual)}/${st.perYear}'
                              : '${_brl(_faixaMensal)}/${st.perMonth}',
                        ),
                        if (_meiFidelizado)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(st.planMeiDesconto, style: const TextStyle(fontSize: 13, height: 1.35)),
                          ),
                        if (_folha) _resumoLinha(st.extraFolha, '${_brl(kFunilFolhaMensal)}/${st.perMonth}'),
                        if (_ir) _resumoLinha(st.extraIr, _brl(kFunilIrAno)),
                        if (_a1) _resumoLinha(st.extraA1, _brl(kFunilA1Ano)),
                        const SizedBox(height: 8),
                        Text(st.officeTotalLabel, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                        if (_meiFidelizado && !_folha) ...[
                          Text(
                            st.proposalMeiAvista(_brl(kFunilMeiAnual)),
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.35),
                          ),
                        ],
                        if (!_meiFidelizado || _folha) ...[
                          Text(
                            st.officeTotalHint(_itens12(st), _brl(mensal)),
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.35),
                          ),
                          const SizedBox(height: 8),
                          Text(st.proposalParcelarHint(_brl(mensal)), style: const TextStyle(fontSize: 13, height: 1.35)),
                        ],
                        const SizedBox(height: 6),
                        _fraseRelevo(st.proposalFirstNfBoleto(_itensPrimeiro(st), _brl(primeiro))),
                        const SizedBox(height: 8),
                        _fraseRelevo(
                          _meiFidelizado
                              ? st.proposalNfObsMei(_brl(kFunilMeiAnual))
                              : st.proposalNfObs(_brl(mensal)),
                        ),
                        if (_a1) ...[
                          const SizedBox(height: 6),
                          Text(st.proposalA1Rule, style: const TextStyle(fontSize: 13, height: 1.35)),
                        ],
                        if (_ir) ...[
                          const SizedBox(height: 6),
                          Text(st.proposalIrRule, style: const TextStyle(fontSize: 13, height: 1.35)),
                        ],
                        const SizedBox(height: 8),
                        Text(st.proposalRenewal, style: const TextStyle(fontSize: 13, height: 1.4)),
                        const SizedBox(height: 6),
                        Text(st.proposalCancel, style: const TextStyle(fontSize: 13, height: 1.4)),
                        const SizedBox(height: 6),
                        Text(st.proposalSla, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 12),
                        Text(
                          st.proposalAceiteCobranca,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, height: 1.35),
                        ),
                        const SizedBox(height: 16),
                        sitePrimaryActionButton(
                          context: context,
                          label: st.proposalSend,
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            _submit(st);
                          },
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text(st.proposalBack),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }

  Widget _fraseRelevo(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6C8),
        border: Border.all(color: kFunilGreen, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, height: 1.35),
      ),
    );
  }

  Widget _resumoLinha(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text('$label: $value', style: const TextStyle(fontSize: 13, height: 1.35)),
    );
  }

  Future<void> _submit(SiteContabilidadeFunilTexts st) async {
    if (_submitting) return;
    setState(() => _submitting = true);
    final comentario = _comentarioLinha();
    final ficha = _fichaProposta(st);
    final locale = Localizations.localeOf(context).toLanguageTag();
    var result = const LeadCaptureResult(ok: false, errorMessage: 'server_error');
    try {
      result = await FunilFirestoreService.submit(
        nome: _nomeCtrl.text,
        email: _emailCtrl.text,
        whatsapp: _digits(_whatsAppCtrl.text),
        cnpj: _digits(_cnpjCtrl.text),
        razaoSocial: _razaoCtrl.text,
        regime: _tipo ?? '',
        faixa: _faixaId ?? '',
        boletoHonorarios: _meiFidelizado ? kFunilMeiAnual : _boletoMensal,
        primeiroBoleto: _primeiroBoleto,
        fichaProposta: ficha,
        aceiteCobranca: true,
        folha: _folha,
        ir: _ir,
        a1: _a1,
        consent: _consent,
        locale: locale,
        pixHonorariosInformado: _pixHonorariosInformado,
        valorPixHonorarios: _pixHonorariosInformado ? _primeiroBoleto : 0,
        websiteHoneypot: _honeypotCtrl.text,
      );
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
          if (result.ok) {
            _success = true;
          } else {
            _errorCode = result.errorMessage ?? 'server_error';
          }
        });
      }
    }
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
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: narrow
              ? SizedBox(
                  height: 48,
                  child: FloatingActionButton.extended(
                    backgroundColor: cs.primary,
                    foregroundColor: cs.onPrimary,
                    onPressed: () => _openWhatsApp(),
                    icon: const Icon(Icons.chat_rounded),
                    label: Text(st.whatsAppFab),
                  ),
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
                            onKnowApp: () => _scrollTo(_formAnchorKey),
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
                              a1PrefillOf: () => FunilA1Prefill(
                                nome: _nomeCtrl.text,
                                email: _emailCtrl.text,
                                telefone: _whatsAppCtrl.text,
                                cnpj: _cnpjCtrl.text,
                                razao: _razaoCtrl.text,
                              ),
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
                            child: _success
                                ? _SuccessCard(
                                    st: st,
                                    email: _emailCtrl.text.trim(),
                                    playUrl: kPerfectGestContabilIProductUrl,
                                    onPlay: _openPlay,
                                    onHome: _goHome,
                                  )
                                : _buildForm(st),
                          ),
                          const SizedBox(height: 20),
                          _DemoBlock(st: st, onKnowApp: () => _scrollTo(_formAnchorKey)),
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
            _tipoLinha(
              label: st.tipoMei,
              selected: _tipo == 'MEI',
              onTap: _submitting ? null : () => _setTipo('MEI'),
            ),
            _tipoLinha(
              label: st.tipoMe,
              selected: _tipo == 'ME',
              onTap: _submitting ? null : () => _setTipo('ME'),
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
            _campoFaixa(st),
            if (_tipo != 'ME')
              _addonCheck(label: st.extraA1, value: _a1, onChanged: (v) => setState(() => _a1 = v ?? false)),
            Opacity(
              opacity: 0,
              child: SizedBox(
                height: 0,
                child: TextField(
                  controller: _honeypotCtrl,
                  autofillHints: const [],
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: 'hp_site'),
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
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _submitting ? null : () => _abrirPixHonorarios(st),
              icon: const Icon(Icons.qr_code_2, size: 18),
              label: const Text(
                'Pagar assinatura do plano (Honorários / Serviços)',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            sitePrimaryActionButton(
              context: context,
              label: _submitting ? st.submittingLabel : st.submitLabel,
              onPressed: _submitting ? () {} : () => _openProposal(st),
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
  const _PlansTable({
    required this.st,
    required this.brl,
    required this.onChoose,
    this.a1PrefillOf,
  });

  final SiteContabilidadeFunilTexts st;
  final String Function(double) brl;
  final ValueChanged<String> onChoose;
  final FunilA1Prefill Function()? a1PrefillOf;

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
          A1QualityCertCard(prefillOf: a1PrefillOf),
          const SizedBox(height: 8),
          Text(st.playNote, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Text(st.extrasTitle, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          const SizedBox(height: 6),
          Text(st.extrasBody),
          if (st.organsNote.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(st.organsNote, style: const TextStyle(fontSize: 13)),
          ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _precoFaixa(t, st, brl),
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      Text(
                        _tierIsFidelizado(t.id) ? st.colBoletoAvista : st.colBoleto,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                      if (_tierIsFidelizado(t.id))
                        SizedBox(
                          width: 160,
                          child: Text(
                            st.planMeiDesconto,
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 10, height: 1.25),
                          ),
                        ),
                    ],
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
  const _SuccessCard({
    required this.st,
    required this.email,
    required this.playUrl,
    required this.onPlay,
    required this.onHome,
  });

  final SiteContabilidadeFunilTexts st;
  final String email;
  final String playUrl;
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
          Text(st.successBody, style: const TextStyle(height: 1.4)),
          const SizedBox(height: 10),
          Text(st.successPlayNote, style: const TextStyle(height: 1.4, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Text(
            st.successCopyNote(email),
            style: const TextStyle(height: 1.4, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(st.playStoreLinkHint, style: const TextStyle(fontSize: 13, height: 1.35)),
          const SizedBox(height: 6),
          InkWell(
            onTap: onPlay,
            child: Text(
              playUrl,
              style: const TextStyle(
                fontSize: 13,
                height: 1.35,
                color: Color(0xFF1A56DB),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
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
    Widget appDoc(String label, String url) {
      return TextButton(
        onPressed: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
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
            appDoc(st.footerPrivacyApp, kPerfectGestContabilIPrivacyUrl),
            appDoc(st.footerTerms, kPerfectGestContabilITermsUrl),
            appDoc(st.footerDeletion, kPerfectGestContabilIDeletionUrl),
            appDoc(st.footerFaqApp, kPerfectGestContabilIFaqUrl),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(kSitePrivacyPolicyPath),
              child: Text(st.footerPrivacySite, style: const TextStyle(fontSize: 13)),
            ),
          ],
        ),
        TextButton(onPressed: onHome, child: Text(st.backHome)),
      ],
    );
  }
}

class A1QualityCertCard extends StatelessWidget {
  const A1QualityCertCard({super.key, this.prefillOf});

  final FunilA1Prefill Function()? prefillOf;

  @override
  Widget build(BuildContext context) {
    final st = SiteContabilidadeFunilTexts.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAF9),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kFunilA1Purple, width: 1.6),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                FunilImg.qualityCert,
                height: 44,
                width: 180,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 8),
              Text(
                st.a1Seal,
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              Text(
                st.a1VideoTitle,
                style: const TextStyle(
                  color: kFunilA1Purple,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              Text(
                st.a1Price,
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(st.a1Body, style: const TextStyle(fontSize: 13, height: 1.35)),
              const SizedBox(height: 12),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: kFunilA1Purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                onPressed: () async {
                  final pago = await showFunilPixTicket(
                    context: context,
                    titulo: 'Certificado A1 QualityCert',
                    linhas: const [
                      FunilPixLinha(
                        descricao: 'Certificado A1 QualityCert',
                        valor: kFunilA1Ano,
                      ),
                    ],
                    txidPrefixo: 'A1',
                  );
                  if (!context.mounted || !pago) return;
                  await showA1QualityCertPop(
                    context,
                    prefill: prefillOf?.call() ?? const FunilA1Prefill(),
                  );
                },
                child: Text(
                  st.a1BuyCta,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700, height: 1.25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
