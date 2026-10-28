import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'brand_palette.dart';
import 'orcamento_models.dart';

Future<OrcamentoItem?> showOrcamentoItemPop(
  BuildContext context,
  OrcamentoItem item, {
  Map<String, double> precosVidro = const {},
}) {
  return showDialog<OrcamentoItem>(
    context: context,
    barrierColor: BrandPalette.charcoalDeep.withValues(alpha: 0.72),
    builder: (_) => _OrcamentoItemPop(item: item, precosVidro: precosVidro),
  );
}

class _OrcamentoItemPop extends StatefulWidget {
  const _OrcamentoItemPop({required this.item, required this.precosVidro});

  final OrcamentoItem item;
  final Map<String, double> precosVidro;

  @override
  State<_OrcamentoItemPop> createState() => _OrcamentoItemPopState();
}

class _OrcamentoItemPopState extends State<_OrcamentoItemPop> {
  late final TextEditingController _largura;
  late final TextEditingController _altura;
  late final TextEditingController _m2;
  late final TextEditingController _cor;
  late final TextEditingController _modelo;
  late final TextEditingController _mao;
  late final TextEditingController _comissao;
  late final TextEditingController _instalacao;
  late final TextEditingController _obs;
  bool _m2Manual = false;
  late String _vidroId;

  @override
  void initState() {
    super.initState();
    final it = widget.item;
    _m2Manual = it.areaM2Override != null;
    _largura = TextEditingController(text: _n(it.larguraMm, 0));
    _altura = TextEditingController(text: _n(it.alturaMm, 0));
    _m2 = TextEditingController(text: _n(it.area, 3));
    _cor = TextEditingController(text: it.cor);
    _modelo = TextEditingController(text: it.modelo);
    _mao = TextEditingController(text: formatPtBrNumber(kOrcamentoPctMaoObraPadrao, casas: 1));
    _comissao = TextEditingController(text: _n(it.pctComissao, 1));
    _instalacao = TextEditingController(text: formatPtBrNumber(instalacaoPorArea(it.area)));
    _obs = TextEditingController(text: it.obs);
    _vidroId = vidroPorId(it.vidroId)?.id ?? '';
    _largura.addListener(_recalcM2);
    _altura.addListener(_recalcM2);
    _comissao.addListener(_tick);
    _m2.addListener(() {
      if (_m2Manual) {
        _syncFixos();
        _tick();
      }
    });
    _syncFixos();
  }

  String _n(double v, [int casas = 2]) {
    if (v == 0) return '';
    return formatPtBrNumber(v, casas: casas);
  }

  void _tick() {
    if (mounted) setState(() {});
  }

  void _syncFixos() {
    final area = _m2Manual
        ? parsePtBrDouble(_m2.text)
        : (parsePtBrDouble(_largura.text) / 1000.0) * (parsePtBrDouble(_altura.text) / 1000.0);
    _mao.text = formatPtBrNumber(kOrcamentoPctMaoObraPadrao, casas: 1);
    _instalacao.text = formatPtBrNumber(instalacaoPorArea(area));
  }

  void _recalcM2() {
    if (_m2Manual) {
      _syncFixos();
      _tick();
      return;
    }
    final l = parsePtBrDouble(_largura.text);
    final a = parsePtBrDouble(_altura.text);
    final area = (l / 1000.0) * (a / 1000.0);
    _m2.value = TextEditingValue(
      text: area == 0 ? '' : formatPtBrNumber(area, casas: 3),
      selection: TextSelection.collapsed(offset: (area == 0 ? '' : formatPtBrNumber(area, casas: 3)).length),
    );
    _syncFixos();
    _tick();
  }

  OrcamentoItem _preview() {
    final area = _m2Manual
        ? parsePtBrDouble(_m2.text)
        : (parsePtBrDouble(_largura.text) / 1000.0) * (parsePtBrDouble(_altura.text) / 1000.0);
    final base = widget.item.copyWith(
      larguraMm: parsePtBrDouble(_largura.text),
      alturaMm: parsePtBrDouble(_altura.text),
      areaM2Override: _m2Manual ? parsePtBrDouble(_m2.text) : null,
      clearAreaOverride: !_m2Manual,
      cor: _cor.text.trim(),
      modelo: _modelo.text.trim(),
      pctMaoObra: kOrcamentoPctMaoObraPadrao,
      pctComissao: parsePtBrDouble(_comissao.text),
      instalacao: instalacaoPorArea(area),
      obs: _obs.text.trim(),
      vidroId: _vidroId,
      precoM2Vidro: _vidroId.isEmpty ? 0 : (widget.precosVidro[_vidroId] ?? 0),
    );
    return base.copyWith(obs: obsComRegrasAbertura(base, _obs.text.trim()));
  }

  String _rotuloVidro() {
    if (_vidroId.isEmpty) return 'Sem vidro';
    final tipo = vidroPorId(_vidroId);
    if (tipo == null) return 'Sem vidro';
    return '${tipo.nome} · ${formatBrl(widget.precosVidro[tipo.id] ?? 0)}/m²';
  }

  Future<void> _abrirListaVidro() async {
    final escolhido = await showDialog<String>(
      context: context,
      barrierColor: BrandPalette.charcoalDeep.withValues(alpha: 0.72),
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: BrandPalette.silverLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: BrandPalette.goldWarm, width: 1.2),
          ),
          title: const Text(
            'Vidro',
            style: TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w700),
          ),
          content: SizedBox(
            width: 420,
            height: 320,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Sem vidro', style: TextStyle(color: BrandPalette.charcoal)),
                  selected: _vidroId.isEmpty,
                  selectedColor: BrandPalette.charcoal,
                  selectedTileColor: BrandPalette.silverPeak,
                  onTap: () => Navigator.pop(ctx, ''),
                ),
                for (final v in kOrcamentoVidros)
                  ListTile(
                    title: Text(
                      v.nome,
                      style: const TextStyle(color: BrandPalette.charcoal, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${formatBrl(widget.precosVidro[v.id] ?? 0)}/m²',
                      style: const TextStyle(color: BrandPalette.silverDark),
                    ),
                    selected: _vidroId == v.id,
                    selectedColor: BrandPalette.charcoal,
                    selectedTileColor: BrandPalette.silverPeak,
                    onTap: () => Navigator.pop(ctx, v.id),
                  ),
              ],
            ),
          ),
        );
      },
    );
    if (escolhido == null || !mounted) return;
    setState(() => _vidroId = escolhido);
  }

  @override
  void dispose() {
    _largura.dispose();
    _altura.dispose();
    _m2.dispose();
    _cor.dispose();
    _modelo.dispose();
    _mao.dispose();
    _comissao.dispose();
    _instalacao.dispose();
    _obs.dispose();
    super.dispose();
  }

  InputDecoration _dec(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
      filled: true,
      fillColor: BrandPalette.silverPeak,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: BrandPalette.silverMid),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: BrandPalette.goldWarm, width: 1.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prev = _preview();
    return Dialog(
      backgroundColor: BrandPalette.silverLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: BrandPalette.goldWarm, width: 1.2),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.item.nome,
                  style: const TextStyle(
                    color: BrandPalette.charcoal,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Medidas, cor, modelo e custos desta abertura. O R\$/m² vem da tabela abaixo do painel.',
                  style: TextStyle(color: BrandPalette.silverDark, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$/m² da tabela: ${formatBrl(widget.item.precoM2)}',
                  style: const TextStyle(
                    color: BrandPalette.charcoal,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _w(120, TextField(
                      controller: _largura,
                      decoration: _dec('Largura mm'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    )),
                    _w(120, TextField(
                      controller: _altura,
                      decoration: _dec('Altura mm'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    )),
                    _w(140, TextField(
                      controller: _m2,
                      decoration: _dec('m²'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) => _m2Manual = true,
                    )),
                    _w(160, TextField(controller: _cor, decoration: _dec('Cor'))),
                    _w(180, TextField(controller: _modelo, decoration: _dec('Modelo'))),
                    _w(130, TextField(
                      controller: _mao,
                      readOnly: true,
                      decoration: _dec('% mão de obra'),
                    )),
                    _w(130, TextField(
                      controller: _comissao,
                      decoration: _dec('% comissão'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    )),
                    _w(170, TextField(
                      controller: _instalacao,
                      readOnly: true,
                      decoration: _dec('Instalação (R\$)'),
                    )),
                    _w(280, InkWell(
                      onTap: _abrirListaVidro,
                      child: InputDecorator(
                        decoration: _dec('Vidro'),
                        child: Text(
                          _rotuloVidro(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: BrandPalette.charcoal, fontSize: 13),
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _obs,
                  decoration: _dec('Observações'),
                  maxLines: 3,
                  inputFormatters: [LengthLimitingTextInputFormatter(400)],
                ),
                const SizedBox(height: 14),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: BrandPalette.charcoal,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: BrandPalette.goldWarm.withValues(alpha: 0.7)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: DefaultTextStyle(
                      style: const TextStyle(color: BrandPalette.silverLight, fontSize: 12, height: 1.45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Área ${formatPtBrNumber(prev.area, casas: 3)} m²'),
                          Text('Material ${formatBrl(prev.material)}'),
                          Text('Mão de obra ${formatBrl(prev.maoObra)}'),
                          Text('Comissão ${formatBrl(prev.comissao)}'),
                          Text('Instalação ${formatBrl(prev.instalacaoEfetiva)}'),
                          if (prev.vidroId.isNotEmpty) ...[
                            Text(
                              'Vidro ${formatPtBrNumber(prev.areaVidro, casas: 3)} m² (−5%) · ${formatBrl(prev.precoM2Vidro)}/m²',
                            ),
                            Text('Valor do vidro ${formatBrl(prev.valorVidro)}'),
                          ] else
                            const Text('Vidro: sem vidro'),
                          if (ultrapassaLimitePortaGiro(prev) || ultrapassaInstalacao35(prev)) ...[
                            const SizedBox(height: 6),
                            if (ultrapassaLimitePortaGiro(prev))
                              const Text(
                                kObsLimitePortaGiro,
                                style: TextStyle(
                                  color: BrandPalette.gold,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                            if (ultrapassaInstalacao35(prev))
                              const Text(
                                kObsInstalacaoAcima35,
                                style: TextStyle(
                                  color: BrandPalette.gold,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                          ],
                          const SizedBox(height: 4),
                          Text(
                            'Total da abertura ${formatBrl(prev.total)}',
                            style: const TextStyle(
                              color: BrandPalette.gold,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar', style: TextStyle(color: BrandPalette.charcoal)),
                    ),
                    const Spacer(),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: BrandPalette.goldWarm,
                        foregroundColor: BrandPalette.charcoalDeep,
                      ),
                      onPressed: () => Navigator.pop(context, _preview()),
                      child: const Text('Aplicar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _w(double width, Widget child) {
    final estreito = MediaQuery.sizeOf(context).width < 520;
    return SizedBox(width: estreito ? double.infinity : width, child: child);
  }
}
