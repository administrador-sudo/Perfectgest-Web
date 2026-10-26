import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'brand_palette.dart';
import 'company_legal.dart';
import 'orcamento_item_pop.dart';
import 'orcamento_models.dart';
import 'orcamento_print_stub.dart' if (dart.library.html) 'orcamento_print_web.dart' as orcamento_print;
import 'orcamento_storage_stub.dart' if (dart.library.html) 'orcamento_storage_web.dart' as orcamento_storage;
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;

class OrcamentoPage extends StatefulWidget {
  const OrcamentoPage({super.key});

  @override
  State<OrcamentoPage> createState() => _OrcamentoPageState();
}

class _OrcamentoPageState extends State<OrcamentoPage> {
  final _empresa = TextEditingController();
  final _cnpj = TextEditingController();
  final _endereco = TextEditingController();
  final _telefone = TextEditingController();
  final _email = TextEditingController();
  final _fabricante = TextEditingController();
  final _vendedor = TextEditingController();
  final _instalador = TextEditingController();
  final _cliente = TextEditingController();
  late final TextEditingController _validade;
  late final Map<String, TextEditingController> _precoCtrls;
  late final Map<String, TextEditingController> _precoVidroCtrls;
  List<OrcamentoItem> _itens = [];
  bool _folha = false;
  double _fatiaMaterial = kOrcamentoFatiaMaterialPadrao;
  double _fatiaMaoObra = kOrcamentoFatiaMaoObraPadrao;

  @override
  void initState() {
    super.initState();
    _validade = TextEditingController(text: validadePadrao());
    _precoCtrls = {
      for (final t in kOrcamentoCatalogo) t.id: TextEditingController(),
    };
    _precoVidroCtrls = {
      for (final t in kOrcamentoVidros) t.id: TextEditingController(),
    };
    seo_meta.applyOrcamentoSeoMetaTags();
    _hidratar();
    _carregarPrecosOficiais();
  }

  void _hidratar() {
    final raw = orcamento_storage.readOrcamentoJson();
    if (raw == null || raw.isEmpty) return;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return;
      final snap = OrcamentoSnapshot.fromJson(Map<String, dynamic>.from(decoded));
      _empresa.text = snap.cadastro.empresaNome;
      _cnpj.text = snap.cadastro.cnpj;
      _endereco.text = snap.cadastro.endereco;
      _telefone.text = snap.cadastro.telefone;
      _email.text = snap.cadastro.email;
      _fabricante.text = snap.cadastro.fabricante;
      _vendedor.text = snap.cadastro.vendedor;
      _instalador.text = snap.cadastro.instalador;
      _cliente.text = snap.cadastro.cliente;
      _validade.text = snap.cadastro.validadeAte.trim().isEmpty
          ? validadePadrao()
          : snap.cadastro.validadeAte;
      _itens = List<OrcamentoItem>.from(snap.itens);
    } catch (_) {}
  }

  OrcamentoCadastro _cadastroAtual() {
    return OrcamentoCadastro(
      empresaNome: _empresa.text.trim(),
      cnpj: _cnpj.text.trim(),
      endereco: _endereco.text.trim(),
      telefone: _telefone.text.trim(),
      email: _email.text.trim(),
      fabricante: _fabricante.text.trim(),
      vendedor: _vendedor.text.trim(),
      instalador: _instalador.text.trim(),
      cliente: _cliente.text.trim(),
      validadeAte: _validade.text.trim(),
    );
  }

  Map<String, double> _precosAtuais() => {
        for (final t in kOrcamentoCatalogo) t.id: parsePtBrDouble(_precoCtrls[t.id]!.text),
      };

  Map<String, double> _precosVidroAtuais() => {
        for (final t in kOrcamentoVidros) t.id: parsePtBrDouble(_precoVidroCtrls[t.id]!.text),
      };

  OrcamentoSnapshot _snapshot() => OrcamentoSnapshot(
        cadastro: _cadastroAtual(),
        itens: _itens,
        precosM2: _precosAtuais(),
        precosVidro: _precosVidroAtuais(),
      );

  void _aplicarPrecosOficiais(Map<String, double> precosM2, Map<String, double> precosVidro) {
    for (final t in kOrcamentoCatalogo) {
      final v = precosM2[t.id];
      if (v != null && v > 0) {
        _precoCtrls[t.id]!.text = formatPtBrNumber(v);
      }
    }
    for (final t in kOrcamentoVidros) {
      final v = precosVidro[t.id];
      if (v != null && v > 0) {
        _precoVidroCtrls[t.id]!.text = formatPtBrNumber(v);
      }
    }
    setState(() {
      _itens = [
        for (final e in _itens)
          e.copyWith(
            precoM2: (precosM2[e.catalogId] != null && precosM2[e.catalogId]! > 0)
                ? precosM2[e.catalogId]!
                : e.precoM2,
            precoM2Vidro: e.vidroId.isEmpty
                ? e.precoM2Vidro
                : ((precosVidro[e.vidroId] != null && precosVidro[e.vidroId]! > 0)
                    ? precosVidro[e.vidroId]!
                    : e.precoM2Vidro),
          ),
      ];
    });
  }

  Future<void> _carregarPrecosOficiais() async {
    final remotos = await orcamento_storage.fetchOrcamentoPrecos();
    if (remotos == null || !mounted) return;
    final fatia = normalizarFatia(remotos.fatiaMaterial);
    _fatiaMaterial = fatia.material;
    _fatiaMaoObra = fatia.maoObra;
    _aplicarPrecosOficiais(remotos.precosM2, remotos.precosVidro);
  }

  void _salvar() {
    final json = jsonEncode(
      OrcamentoSnapshot(
        cadastro: _cadastroAtual(),
        itens: _itens,
      ).toJson(),
    );
    orcamento_storage.writeOrcamentoJson(json);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: BrandPalette.charcoal,
        content: Text(
          'Dados gravados neste browser. Voltam preenchidos no próximo acesso.',
          style: TextStyle(color: BrandPalette.silverLight),
        ),
      ),
    );
  }

  void _addFromCatalog(OrcamentoCatalogTipo tipo) {
    final preco = parsePtBrDouble(_precoCtrls[tipo.id]?.text ?? '');
    setState(() => _itens = [..._itens, OrcamentoItem.fromCatalog(tipo, precoM2: preco)]);
  }

  void _atualizarPrecoTipo(String catalogId, String raw) {
    final preco = parsePtBrDouble(raw);
    setState(() {
      _itens = [
        for (final e in _itens)
          if (e.catalogId == catalogId) e.copyWith(precoM2: preco) else e,
      ];
    });
  }

  InputDecoration _decPin() => InputDecoration(
        labelText: '4 dígitos',
        labelStyle: const TextStyle(color: BrandPalette.charcoal),
        filled: true,
        fillColor: BrandPalette.silverPeak,
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: BrandPalette.goldWarm, width: 1.4),
        ),
      );

  Future<String?> _pedirPin(String titulo) async {
    final pinCtrl = TextEditingController();
    final pin = await showDialog<String>(
      context: context,
      barrierColor: BrandPalette.charcoalDeep.withValues(alpha: 0.72),
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: BrandPalette.silverLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: BrandPalette.goldWarm, width: 1.2),
          ),
          title: Text(
            titulo,
            style: const TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w700),
          ),
          content: TextField(
            controller: pinCtrl,
            autofocus: true,
            obscureText: true,
            maxLength: 4,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
            style: const TextStyle(color: BrandPalette.charcoal, fontSize: 22, letterSpacing: 8),
            decoration: _decPin(),
            onSubmitted: (v) => Navigator.pop(ctx, v.trim()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancelar', style: TextStyle(color: BrandPalette.charcoal)),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: BrandPalette.goldWarm,
                foregroundColor: BrandPalette.charcoalDeep,
              ),
              onPressed: () => Navigator.pop(ctx, pinCtrl.text.trim()),
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
    pinCtrl.dispose();
    return pin;
  }

  Future<String?> _gravarPrecosOficiais(String pin) {
    return orcamento_storage.saveOrcamentoPrecos(
      pin: pin,
      precosM2: _precosAtuais(),
      precosVidro: _precosVidroAtuais(),
      fatiaMaterial: _fatiaMaterial,
      fatiaMaoObra: _fatiaMaoObra,
    );
  }

  void _avisoPrecos(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: BrandPalette.charcoal,
        content: Text(msg, style: const TextStyle(color: BrandPalette.silverLight)),
      ),
    );
  }

  String _msgErroPin(String? err) {
    if (err == null) return 'Tabela R\$/m² gravada. Vale para qualquer acesso.';
    if (err == 'pin_invalid') return 'Senha incorreta. A tabela não foi gravada.';
    return 'Não foi possível gravar a tabela. Tente de novo.';
  }

  Future<void> _pedirSenhaESalvarPrecos() async {
    final pin = await _pedirPin('Senha para gravar a tabela');
    if (pin == null || pin.isEmpty || !mounted) return;
    final err = await _gravarPrecosOficiais(pin);
    _avisoPrecos(_msgErroPin(err));
  }

  Future<void> _abrirAjustesAdm() async {
    final pin = await _pedirPin('Senha de Ajustes Adm');
    if (pin == null || pin.isEmpty || !mounted) return;
    final check = await _gravarPrecosOficiais(pin);
    if (!mounted) return;
    if (check != null) {
      _avisoPrecos(
        check == 'pin_invalid'
            ? 'Senha incorreta.'
            : 'Não foi possível abrir os ajustes. Tente de novo.',
      );
      return;
    }
    final fatiaMatCtrl = TextEditingController(text: formatPtBrNumber(_fatiaMaterial, casas: 0));
    final fatiaMoCtrl = TextEditingController(text: formatPtBrNumber(_fatiaMaoObra, casas: 0));
    final pctMatCtrl = TextEditingController();
    final pctMoCtrl = TextEditingController();
    final pctVidroCtrl = TextEditingController();

    InputDecoration decCampo(String label) => InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(color: BrandPalette.charcoal, fontSize: 12),
          filled: true,
          fillColor: BrandPalette.silverPeak,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrandPalette.goldWarm),
          ),
        );

    final aplicar = await showDialog<bool>(
      context: context,
      barrierColor: BrandPalette.charcoalDeep.withValues(alpha: 0.72),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setPop) {
            return AlertDialog(
              backgroundColor: BrandPalette.silverLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: BrandPalette.goldWarm, width: 1.2),
              ),
              title: const Text(
                'Ajustes Adm',
                style: TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w700),
              ),
              content: SizedBox(
                width: 360,
                child: SingleChildScrollView(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Fatia do R\$/m² das aberturas. A mão de obra completa 100%. Número positivo sobe o preço; negativo desce (ex. 15 ou -15).',
                      style: TextStyle(color: BrandPalette.charcoal, fontSize: 12),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: fatiaMatCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: BrandPalette.charcoal),
                      decoration: decCampo('Fatia material %'),
                      onChanged: (v) {
                        final fatia = normalizarFatia(parsePtBrDouble(v));
                        fatiaMoCtrl.text = formatPtBrNumber(fatia.maoObra, casas: 0);
                        setPop(() {});
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: fatiaMoCtrl,
                      readOnly: true,
                      style: const TextStyle(color: BrandPalette.charcoal),
                      decoration: decCampo('Fatia mão de obra %'),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: pctMatCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      style: const TextStyle(color: BrandPalette.charcoal),
                      decoration: decCampo('% material (alumínio, use - para baixar)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: pctMoCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      style: const TextStyle(color: BrandPalette.charcoal),
                      decoration: decCampo('% mão de obra (use - para baixar)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: pctVidroCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      style: const TextStyle(color: BrandPalette.charcoal),
                      decoration: decCampo('% vidro R\$/m² (use - para baixar)'),
                    ),
                  ],
                ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancelar', style: TextStyle(color: BrandPalette.charcoal)),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: BrandPalette.goldWarm,
                    foregroundColor: BrandPalette.charcoalDeep,
                  ),
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('Aplicar e gravar'),
                ),
              ],
            );
          },
        );
      },
    );

    final fatia = normalizarFatia(parsePtBrDouble(fatiaMatCtrl.text));
    final pctMat = parsePtBrDouble(pctMatCtrl.text);
    final pctMo = parsePtBrDouble(pctMoCtrl.text);
    final pctVidro = parsePtBrDouble(pctVidroCtrl.text);
    fatiaMatCtrl.dispose();
    fatiaMoCtrl.dispose();
    pctMatCtrl.dispose();
    pctMoCtrl.dispose();
    pctVidroCtrl.dispose();
    if (aplicar != true || !mounted) return;

    final fator = fatorReajusteAbertura(
      fatiaMaterial: fatia.material,
      fatiaMaoObra: fatia.maoObra,
      pctMaterial: pctMat,
      pctMaoObra: pctMo,
    );
    final precosM2 = <String, double>{
      for (final t in kOrcamentoCatalogo)
        t.id: aplicarReajustePreco(parsePtBrDouble(_precoCtrls[t.id]!.text), fator),
    };
    final precosVidro = <String, double>{
      for (final t in kOrcamentoVidros)
        t.id: aplicarAjustePct(parsePtBrDouble(_precoVidroCtrls[t.id]!.text), pctVidro),
    };
    _fatiaMaterial = fatia.material;
    _fatiaMaoObra = fatia.maoObra;
    _aplicarPrecosOficiais(precosM2, precosVidro);
    final err = await _gravarPrecosOficiais(pin);
    _avisoPrecos(
      err == null
          ? 'Reajuste aplicado e gravado.'
          : _msgErroPin(err),
    );
  }

  void _atualizarPrecoVidro(String vidroId, String raw) {
    final preco = parsePtBrDouble(raw);
    setState(() {
      _itens = [
        for (final e in _itens)
          if (e.vidroId == vidroId) e.copyWith(precoM2Vidro: preco) else e,
      ];
    });
  }

  Future<void> _abrirItem(OrcamentoItem item) async {
    final updated = await showOrcamentoItemPop(
      context,
      item,
      precosVidro: _precosVidroAtuais(),
    );
    if (updated == null || !mounted) return;
    setState(() {
      _itens = [for (final e in _itens) if (e.id == item.id) updated else e];
    });
  }

  void _remover(String id) {
    setState(() => _itens = [for (final e in _itens) if (e.id != id) e]);
  }

  void _gerarPdf() {
    final html = orcamentoToPrintHtml(
      cadastro: _cadastroAtual(),
      itens: _itens,
      data: DateTime.now(),
    );
    final ok = orcamento_print.printOrcamentoHtml(html);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: BrandPalette.charcoal,
          content: Text(
            'Permita a impressão nesta página para gerar o PDF.',
            style: TextStyle(color: BrandPalette.silverLight),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _empresa.dispose();
    _cnpj.dispose();
    _endereco.dispose();
    _telefone.dispose();
    _email.dispose();
    _fabricante.dispose();
    _vendedor.dispose();
    _instalador.dispose();
    _cliente.dispose();
    _validade.dispose();
    for (final c in _precoCtrls.values) {
      c.dispose();
    }
    for (final c in _precoVidroCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: buildPerfectProDarkTheme().copyWith(
        scaffoldBackgroundColor: BrandPalette.charcoalDeep,
      ),
      child: Scaffold(
        backgroundColor: BrandPalette.charcoalDeep,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _folha ? _folhaView() : _montagemView(context),
              ),
              _OrcamentoRodapeFerramenta(onAjustesAdm: _folha ? null : _abrirAjustesAdm),
            ],
          ),
        ),
      ),
    );
  }

  bool _estreito(BuildContext context) => MediaQuery.sizeOf(context).width < 720;

  bool _largo(BuildContext context) => MediaQuery.sizeOf(context).width >= 980;

  Widget _montagemView(BuildContext context) {
    final pad = _estreito(context) ? 10.0 : 16.0;
    if (!_largo(context)) {
      return ColoredBox(
        color: BrandPalette.charcoalDeep,
        child: Padding(
          padding: EdgeInsets.fromLTRB(pad, 10, pad, 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _barraCadastro()),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(child: _quadroCatalogo(fill: false)),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 280),
                  child: _quadroOrcamento(fill: false),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(child: _quadroPrecosM2(fill: false)),
            ],
          ),
        ),
      );
    }

    return ColoredBox(
      color: BrandPalette.charcoalDeep,
      child: Padding(
        padding: EdgeInsets.fromLTRB(pad, 12, pad, 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _barraCadastro()),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: _quadroCatalogo(fill: false)),
                  const SizedBox(width: 14),
                  Expanded(
                    flex: 6,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 320),
                      child: _quadroOrcamento(fill: false),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(child: _quadroPrecosM2(fill: false)),
          ],
        ),
      ),
    );
  }

  Widget _barraCadastro() {
    InputDecoration dec(String label) => InputDecoration(
          labelText: label,
          hintText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(color: BrandPalette.charcoal, fontSize: 12),
          hintStyle: const TextStyle(color: BrandPalette.silverDark, fontSize: 12),
          filled: true,
          fillColor: BrandPalette.silverPeak,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrandPalette.silverMid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrandPalette.goldWarm),
          ),
        );

    final estreito = _estreito(context);
    Widget campo(double w, TextEditingController c, String label) {
      return SizedBox(
        width: estreito ? double.infinity : w,
        child: TextField(
          controller: c,
          style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
          decoration: dec(label),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: BrandPalette.silverLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: BrandPalette.goldWarm.withValues(alpha: 0.85)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Cadastro da empresa fabricante',
                  style: TextStyle(
                    color: BrandPalette.charcoal,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: _salvar,
                  style: TextButton.styleFrom(
                    backgroundColor: BrandPalette.goldWarm,
                    foregroundColor: BrandPalette.charcoalDeep,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    minimumSize: const Size(88, 44),
                  ),
                  child: const Text('Salvar', style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                campo(220, _empresa, 'Nome da empresa'),
                campo(160, _cnpj, 'CNPJ'),
                campo(260, _endereco, 'Endereço'),
                campo(150, _telefone, 'Telefone'),
                campo(200, _email, 'E-mail'),
                campo(200, _fabricante, 'Fabricante'),
                campo(180, _vendedor, 'Vendedor'),
                campo(180, _instalador, 'Instalador'),
                campo(200, _cliente, 'Cliente'),
                SizedBox(
                  width: estreito ? double.infinity : 150,
                  child: TextField(
                    controller: _validade,
                    readOnly: true,
                    onTap: _escolherValidade,
                    style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
                    decoration: dec('Válido até'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _quadroPrata({required String titulo, required Widget child, bool fill = true}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BrandPalette.silverLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: BrandPalette.silverMid),
      ),
      child: Column(
        mainAxisSize: fill ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: BrandPalette.charcoal,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                titulo,
                style: const TextStyle(
                  color: BrandPalette.gold,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
          if (fill) Expanded(child: child) else child,
        ],
      ),
    );
  }

  Future<void> _escolherValidade() async {
    final atual = parseDataBr(_validade.text) ?? DateTime.now().add(const Duration(days: 15));
    final picked = await showDatePicker(
      context: context,
      initialDate: atual,
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (picked == null || !mounted) return;
    setState(() => _validade.text = formatDataBr(picked));
  }

  Widget _quadroCatalogo({bool fill = true}) {
    final estreito = _estreito(context);
    final grid = SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: estreito ? 176 : 210,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      mainAxisExtent: estreito ? 156 : 172,
    );
    final corpo = fill
        ? CustomScrollView(
            slivers: _catalogoSlivers(grid),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final grupo in kOrcamentoGruposOrdenados) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
                  child: Text(
                    grupo,
                    style: const TextStyle(
                      color: BrandPalette.charcoal,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: grid,
                    children: [
                      for (final tipo in catalogoDoGrupo(grupo))
                        _CatalogCard(
                          tipo: tipo,
                          onAdd: () => _addFromCatalog(tipo),
                          toqueLongo: estreito,
                        ),
                    ],
                  ),
                ),
              ],
            ],
          );
    return _quadroPrata(
      titulo: '1 · Aberturas disponíveis',
      fill: fill,
      child: corpo,
    );
  }

  List<Widget> _catalogoSlivers(SliverGridDelegate grid) {
    final estreito = _estreito(context);
    return [
      for (final grupo in kOrcamentoGruposOrdenados) ...[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
            child: Text(
              grupo,
              style: const TextStyle(
                color: BrandPalette.charcoal,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
          sliver: SliverGrid(
            gridDelegate: grid,
            delegate: SliverChildListDelegate([
              for (final tipo in catalogoDoGrupo(grupo))
                _CatalogCard(
                  tipo: tipo,
                  onAdd: () => _addFromCatalog(tipo),
                  toqueLongo: estreito,
                ),
            ]),
          ),
        ),
      ],
    ];
  }

  Widget _quadroPrecosM2({bool fill = true}) {
    InputDecoration dec() => InputDecoration(
          labelText: 'R\$/m²',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(color: BrandPalette.charcoal, fontSize: 11),
          filled: true,
          fillColor: BrandPalette.silverPeak,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrandPalette.silverMid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrandPalette.goldWarm),
          ),
        );

    final estreito = _estreito(context);
    final linhas = [
      for (final grupo in kOrcamentoGruposOrdenados) ...[
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
          child: Text(
            grupo,
            style: const TextStyle(
              color: BrandPalette.charcoal,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ),
        for (final tipo in catalogoDoGrupo(grupo))
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: estreito
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        tipo.nome,
                        style: const TextStyle(
                          color: BrandPalette.charcoal,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _precoCtrls[tipo.id],
                        style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: dec(),
                        onChanged: (v) => _atualizarPrecoTipo(tipo.id, v),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(tipo.icon, size: 18, color: BrandPalette.charcoal),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tipo.nome,
                          style: const TextStyle(
                            color: BrandPalette.charcoal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: TextField(
                          controller: _precoCtrls[tipo.id],
                          style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: dec(),
                          onChanged: (v) => _atualizarPrecoTipo(tipo.id, v),
                        ),
                      ),
                    ],
                  ),
          ),
      ],
      Padding(
        padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
        child: Text(
          'Vidros',
          style: const TextStyle(
            color: BrandPalette.charcoal,
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
        ),
      ),
      for (final tipo in kOrcamentoVidros)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: estreito
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      tipo.nome,
                      style: const TextStyle(
                        color: BrandPalette.charcoal,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _precoVidroCtrls[tipo.id],
                      style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: dec(),
                      onChanged: (v) => _atualizarPrecoVidro(tipo.id, v),
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Icon(Icons.layers, size: 18, color: BrandPalette.charcoal),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tipo.nome,
                        style: const TextStyle(
                          color: BrandPalette.charcoal,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: TextField(
                        controller: _precoVidroCtrls[tipo.id],
                        style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: dec(),
                        onChanged: (v) => _atualizarPrecoVidro(tipo.id, v),
                      ),
                    ),
                  ],
                ),
        ),
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.centerRight,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: BrandPalette.goldWarm,
            foregroundColor: BrandPalette.charcoalDeep,
            minimumSize: const Size(88, 44),
          ),
          onPressed: _pedirSenhaESalvarPrecos,
          child: const Text('Salvar novos valores'),
        ),
      ),
    ];
    return _quadroPrata(
      titulo: '3 · Valores R\$/m² por abertura',
      fill: fill,
      child: fill
          ? ListView(padding: const EdgeInsets.fromLTRB(10, 8, 10, 10), children: linhas)
          : Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: linhas),
            ),
    );
  }

  Widget _quadroOrcamento({bool fill = true}) {
    final estreito = _estreito(context);
    final alvo = DragTarget<OrcamentoCatalogTipo>(
      onWillAcceptWithDetails: (_) => true,
      onAcceptWithDetails: (d) => _addFromCatalog(d.data),
      builder: (context, candidate, _) {
        final hover = candidate.isNotEmpty;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: hover ? const Color(0xFFE8E4D4) : BrandPalette.silverLight,
            border: Border.all(
              color: hover ? BrandPalette.goldWarm : Colors.transparent,
              width: 2,
            ),
          ),
          child: _itens.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(estreito ? Icons.add_circle : Icons.south_west, color: BrandPalette.goldDim, size: 28),
                      const SizedBox(height: 10),
                      Text(
                        estreito
                            ? 'Toque em + nas aberturas para montar o orçamento'
                            : 'Arraste as aberturas para cá, ou toque em +',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: BrandPalette.charcoal,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: !fill,
                  physics: fill ? null : const NeverScrollableScrollPhysics(),
                  itemCount: _itens.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 6),
                  itemBuilder: (context, i) {
                    final it = _itens[i];
                    final tipo = catalogoPorId(it.catalogId);
                    return Material(
                      color: BrandPalette.silverPeak,
                      borderRadius: BorderRadius.circular(8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        onTap: () => _abrirItem(it),
                        leading: Icon(tipo?.icon ?? Icons.window, color: BrandPalette.charcoal),
                        title: Text(
                          it.nome,
                          style: const TextStyle(
                            color: BrandPalette.charcoal,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        subtitle: Text(
                          '${formatPtBrNumber(it.larguraMm, casas: 0)} × ${formatPtBrNumber(it.alturaMm, casas: 0)} mm  ·  ${formatPtBrNumber(it.area, casas: 3)} m²  ·  ${formatBrl(it.total)}',
                          style: const TextStyle(color: BrandPalette.silverDark, fontSize: 11),
                        ),
                        trailing: IconButton(
                          tooltip: 'Remover',
                          onPressed: () => _remover(it.id),
                          icon: const Icon(Icons.close, color: BrandPalette.charcoal),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );

    return _quadroPrata(
      titulo: '2 · Local do orçamento',
      fill: fill,
      child: Column(
        mainAxisSize: fill ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (fill) Expanded(child: alvo) else alvo,
          DecoratedBox(
            decoration: const BoxDecoration(
              color: BrandPalette.charcoal,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(9)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    'Total  ${formatBrl(_snapshot().total)}',
                    style: const TextStyle(
                      color: BrandPalette.gold,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Wrap(
                    spacing: 6,
                    children: [
                      TextButton(
                        onPressed: _itens.isEmpty ? null : () => setState(() => _folha = true),
                        child: const Text('Ver folha', style: TextStyle(color: BrandPalette.silverLight)),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: BrandPalette.goldWarm,
                          foregroundColor: BrandPalette.charcoalDeep,
                          minimumSize: const Size(88, 44),
                        ),
                        onPressed: _itens.isEmpty ? null : _gerarPdf,
                        child: const Text('Gerar PDF'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _folhaView() {
    final cad = _cadastroAtual();
    final total = _snapshot().total;
    return ColoredBox(
      color: BrandPalette.charcoalDeep,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => setState(() => _folha = false),
                  child: const Text('Voltar ao painel', style: TextStyle(color: BrandPalette.silverLight)),
                ),
                const Spacer(),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: BrandPalette.goldWarm,
                    foregroundColor: BrandPalette.charcoalDeep,
                  ),
                  onPressed: _gerarPdf,
                  child: const Text('Gerar PDF'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: BrandPalette.silverPeak,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: BrandPalette.goldWarm, width: 1.2),
                    ),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(_estreito(context) ? 14 : 22, 18, _estreito(context) ? 14 : 22, 22),
                      children: [
                        Builder(
                          builder: (context) {
                            final estreito = _estreito(context);
                            final empresa = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cad.empresaNome.isEmpty ? 'ORÇAMENTO' : cad.empresaNome,
                                  style: TextStyle(
                                    color: BrandPalette.charcoal,
                                    fontSize: estreito ? 18 : 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                if (cad.cnpj.isNotEmpty) Text('CNPJ ${cad.cnpj}', style: _folhaMeta),
                                if (cad.endereco.isNotEmpty) Text(cad.endereco, style: _folhaMeta),
                                if (cad.telefone.isNotEmpty || cad.email.isNotEmpty)
                                  Text(
                                    [if (cad.telefone.isNotEmpty) 'Tel. ${cad.telefone}', if (cad.email.isNotEmpty) cad.email].join(' · '),
                                    style: _folhaMeta,
                                  ),
                              ],
                            );
                            final meta = Column(
                              crossAxisAlignment: estreito ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'ORÇAMENTO DE ESQUADRIAS',
                                  style: TextStyle(color: BrandPalette.goldDim, fontWeight: FontWeight.w700, fontSize: 12),
                                ),
                                Text('Data ${formatDataBr(DateTime.now())}', style: _folhaMeta),
                                if (cad.validadeAte.trim().isNotEmpty)
                                  Text('Válido até ${cad.validadeAte.trim()}', style: _folhaMeta),
                                if (cad.fabricante.isNotEmpty) Text('Fabricante: ${cad.fabricante}', style: _folhaMeta),
                                if (cad.vendedor.isNotEmpty) Text('Vendedor: ${cad.vendedor}', style: _folhaMeta),
                                if (cad.instalador.isNotEmpty) Text('Instalador: ${cad.instalador}', style: _folhaMeta),
                                if (cad.cliente.isNotEmpty) Text('Cliente: ${cad.cliente}', style: _folhaMeta),
                              ],
                            );
                            if (estreito) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [empresa, const SizedBox(height: 10), meta],
                              );
                            }
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: empresa),
                                const SizedBox(width: 12),
                                meta,
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        const Divider(color: BrandPalette.goldWarm, thickness: 1.4),
                        const SizedBox(height: 8),
                        for (var i = 0; i < _itens.length; i++) ...[
                          _linhaFolha(i + 1, _itens[i]),
                          const Divider(color: BrandPalette.silverMid, height: 16),
                        ],
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Total  ${formatBrl(total)}',
                            style: const TextStyle(
                              color: BrandPalette.charcoal,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const _folhaMeta = TextStyle(color: BrandPalette.charcoal, fontSize: 12, height: 1.4);

  Widget _linhaFolha(int n, OrcamentoItem it) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 28,
          child: Text('$n', style: const TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w700)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(it.nome, style: const TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w700)),
              Text(
                '${formatPtBrNumber(it.larguraMm, casas: 0)} × ${formatPtBrNumber(it.alturaMm, casas: 0)} mm  ·  ${formatPtBrNumber(it.area, casas: 3)} m²  ·  ${formatBrl(it.precoM2)}/m²',
                style: _folhaMeta,
              ),
              if (it.modelo.isNotEmpty || it.cor.isNotEmpty)
                Text([it.modelo, it.cor].where((e) => e.isNotEmpty).join(' · '), style: _folhaMeta),
              if (it.vidroId.isNotEmpty)
                Text(
                  '${it.vidroNome}  ·  ${formatPtBrNumber(it.areaVidro, casas: 3)} m² (−5%)  ·  ${formatBrl(it.valorVidro)}',
                  style: _folhaMeta,
                ),
              if (it.obs.isNotEmpty) Text('Obs.: ${it.obs}', style: _folhaMeta),
            ],
          ),
        ),
        Text(formatBrl(it.total), style: const TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _CatalogCard extends StatelessWidget {
  const _CatalogCard({
    required this.tipo,
    required this.onAdd,
    this.toqueLongo = false,
  });

  final OrcamentoCatalogTipo tipo;
  final VoidCallback onAdd;
  final bool toqueLongo;

  @override
  Widget build(BuildContext context) {
    final dragChild = _chip();
    final drag = toqueLongo
        ? LongPressDraggable<OrcamentoCatalogTipo>(
            data: tipo,
            feedback: Material(
              color: Colors.transparent,
              child: SizedBox(width: 176, height: 156, child: _chip(dragging: true)),
            ),
            childWhenDragging: Opacity(opacity: 0.35, child: dragChild),
            child: dragChild,
          )
        : Draggable<OrcamentoCatalogTipo>(
            data: tipo,
            feedback: Material(
              color: Colors.transparent,
              child: SizedBox(width: 196, height: 172, child: _chip(dragging: true)),
            ),
            childWhenDragging: Opacity(opacity: 0.35, child: dragChild),
            child: dragChild,
          );
    return SizedBox(
      height: toqueLongo ? 156 : 172,
      child: Stack(
        children: [
          Positioned.fill(child: drag),
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                tooltip: 'Adicionar ao orçamento',
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minWidth: toqueLongo ? 44 : 28,
                  minHeight: toqueLongo ? 44 : 28,
                ),
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle, color: BrandPalette.goldDim, size: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip({bool dragging = false}) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: BrandPalette.silverPeak,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: dragging ? BrandPalette.goldWarm : BrandPalette.silverMid),
          boxShadow: dragging
              ? const [BoxShadow(color: Color(0x66000000), blurRadius: 10, offset: Offset(0, 4))]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 22, 8),
          child: Column(
            children: [
              Icon(tipo.icon, color: BrandPalette.charcoal, size: 22),
              const SizedBox(height: 6),
              Expanded(
                child: Text(
                  tipo.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: BrandPalette.charcoal,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrcamentoRodapeFerramenta extends StatelessWidget {
  const _OrcamentoRodapeFerramenta({this.onAjustesAdm});

  final VoidCallback? onAjustesAdm;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: BrandPalette.charcoal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onAjustesAdm != null)
              TextButton(
                onPressed: onAjustesAdm,
                style: TextButton.styleFrom(
                  minimumSize: const Size(44, 36),
                  foregroundColor: BrandPalette.silverMid,
                  visualDensity: VisualDensity.compact,
                ),
                child: const Text(
                  'Ajustes Adm',
                  style: TextStyle(fontSize: 11, decoration: TextDecoration.underline),
                ),
              ),
            Text(
              ' · © Todos os Direitos Reservados à $kCompanyFantasyName 2026 - Divisão Ferramentas Digitais ·',
              textAlign: TextAlign.center,
              style: const TextStyle(color: BrandPalette.silverMid, fontSize: 11, height: 1.35),
            ),
          ],
        ),
      ),
    );
  }
}
