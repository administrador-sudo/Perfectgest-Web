import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'brand_palette.dart';
import 'orcamento_models.dart';
import 'orcamento_print_stub.dart' if (dart.library.html) 'orcamento_print_web.dart' as orcamento_print;
import 'orcamento_storage_stub.dart' if (dart.library.html) 'orcamento_storage_web.dart' as orcamento_storage;
import 'seo_meta_stub.dart' if (dart.library.html) 'seo_meta_web.dart' as seo_meta;

class OrcamentoRegistrosPage extends StatefulWidget {
  const OrcamentoRegistrosPage({super.key});

  @override
  State<OrcamentoRegistrosPage> createState() => _OrcamentoRegistrosPageState();
}

class _OrcamentoRegistrosPageState extends State<OrcamentoRegistrosPage> {
  List<OrcamentoRegistroResumo> _lista = [];
  bool _loading = true;
  String? _erro;

  @override
  void initState() {
    super.initState();
    seo_meta.applyOrcamentoSeoMetaTags();
    WidgetsBinding.instance.addPostFrameCallback((_) => _carregar());
  }

  Future<void> _carregar() async {
    setState(() {
      _loading = true;
      _erro = null;
    });
    final lista = await orcamento_storage.fetchOrcamentoRegistros();
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (lista == null) {
        _erro = 'Sessão inválida ou API indisponível. Entre em /orcamento.';
      } else {
        _lista = lista;
      }
    });
  }

  Future<void> _apagar(OrcamentoRegistroResumo r) async {
    final err = await orcamento_storage.deleteOrcamentoRegistro(id: r.id);
    if (!mounted) return;
    if (err != null) {
      setState(() => _erro = 'Não foi possível apagar.');
      return;
    }
    setState(() => _lista = [for (final e in _lista) if (e.id != r.id) e]);
  }

  void _abrir(OrcamentoRegistroResumo r) {
    orcamento_storage.writeOrcamentoDocumentoId(r.id);
    Navigator.of(context).pop(r.id);
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
        body: SafeArea(child: _listaView()),
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
                              onPressed: () => _abrir(r),
                              child: const Text('Abrir'),
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
