import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'brand_palette.dart';
import 'orcamento_models.dart';
import 'orcamento_print_stub.dart' if (dart.library.html) 'orcamento_print_web.dart' as orcamento_print;
import 'orcamento_storage_stub.dart' if (dart.library.html) 'orcamento_storage_web.dart' as orcamento_storage;
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;

class OrcamentoRegistrosPage extends StatefulWidget {
  const OrcamentoRegistrosPage({super.key, this.pin});

  final String? pin;

  @override
  State<OrcamentoRegistrosPage> createState() => _OrcamentoRegistrosPageState();
}

class _OrcamentoRegistrosPageState extends State<OrcamentoRegistrosPage> {
  late final TextEditingController _pin;
  String? _pinOk;
  List<OrcamentoRegistroResumo> _lista = [];
  bool _loading = false;
  String? _erro;

  @override
  void initState() {
    super.initState();
    seo_meta.applyOrcamentoSeoMetaTags();
    _pin = TextEditingController(text: widget.pin ?? '');
    if (widget.pin != null && widget.pin!.isNotEmpty) {
      _pinOk = widget.pin;
      WidgetsBinding.instance.addPostFrameCallback((_) => _carregar());
    }
  }

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  Future<void> _carregar() async {
    final pin = (_pinOk ?? _pin.text).trim();
    if (pin.isEmpty) return;
    setState(() {
      _loading = true;
      _erro = null;
    });
    final lista = await orcamento_storage.fetchOrcamentoRegistros(pin);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (lista == null) {
        _erro = 'Senha incorreta ou API indisponível.';
        _pinOk = null;
      } else {
        _pinOk = pin;
        _lista = lista;
      }
    });
  }

  Future<void> _apagar(OrcamentoRegistroResumo r) async {
    final pin = _pinOk;
    if (pin == null) return;
    final err = await orcamento_storage.deleteOrcamentoRegistro(pin: pin, id: r.id);
    if (!mounted) return;
    if (err != null) {
      setState(() => _erro = 'Não foi possível apagar.');
      return;
    }
    setState(() => _lista = [for (final e in _lista) if (e.id != r.id) e]);
  }

  void _pdfWhatsApp() {
    orcamento_print.printOrcamentoHtml(registrosResumoToPrintHtml(_lista));
    orcamento_print.openWhatsAppText(textoWhatsAppRegistros(_lista));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: buildPerfectProDarkTheme().copyWith(
        scaffoldBackgroundColor: BrandPalette.charcoalDeep,
      ),
      child: Scaffold(
        backgroundColor: BrandPalette.charcoalDeep,
        appBar: AppBar(
          backgroundColor: BrandPalette.charcoalDeep,
          foregroundColor: BrandPalette.silverLight,
          title: const Text('Registros de orçamento'),
        ),
        body: SafeArea(
          child: _pinOk == null ? _pinView() : _listaView(),
        ),
      ),
    );
  }

  Widget _pinView() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Senha de Ajustes Adm',
            style: TextStyle(color: BrandPalette.silverLight, fontSize: 14),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _pin,
            obscureText: true,
            style: const TextStyle(color: BrandPalette.charcoal),
            decoration: InputDecoration(
              filled: true,
              fillColor: BrandPalette.silverPeak,
              isDense: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onSubmitted: (_) => _carregar(),
          ),
          if (_erro != null) ...[
            const SizedBox(height: 8),
            Text(_erro!, style: const TextStyle(color: BrandPalette.goldWarm)),
          ],
          const SizedBox(height: 14),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: BrandPalette.goldWarm,
              foregroundColor: BrandPalette.charcoalDeep,
            ),
            onPressed: _loading ? null : _carregar,
            child: Text(_loading ? 'A abrir…' : 'Entrar'),
          ),
        ],
      ),
    );
  }

  Widget _listaView() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator(color: BrandPalette.goldWarm));
    }
    return Column(
      children: [
        if (_erro != null)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(_erro!, style: const TextStyle(color: BrandPalette.goldWarm)),
          ),
        Expanded(
          child: _lista.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhum registro.',
                    style: TextStyle(color: BrandPalette.silverLight),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  itemCount: _lista.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 6),
                  itemBuilder: (ctx, i) {
                    final r = _lista[i];
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: BrandPalette.charcoal,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: BrandPalette.goldWarm.withValues(alpha: 0.45)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 4, 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${r.cliente.isEmpty ? '—' : r.cliente}  ·  ${formatBrl(r.total)}  ·  ${formatDataBr(r.data)}  ·  Comissão ${formatBrl(r.comissao)}',
                                style: const TextStyle(color: BrandPalette.silverLight, fontSize: 13),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _apagar(r),
                              child: const Text('Apagar'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: BrandPalette.goldWarm,
                foregroundColor: BrandPalette.charcoalDeep,
                minimumSize: const Size(88, 44),
              ),
              onPressed: _lista.isEmpty ? null : _pdfWhatsApp,
              child: const Text('PDF WhatsApp'),
            ),
          ),
        ),
      ],
    );
  }
}
