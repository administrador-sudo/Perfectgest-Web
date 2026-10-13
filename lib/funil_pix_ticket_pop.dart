import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'company_legal.dart';
import 'funil_comprovante_pick.dart';
import 'funil_pix_emv.dart';

/// WhatsApp do tiquete PIX (A1 e honorarios). Nao substitui o FAB do site.
const String kPixTicketWhatsAppDigits = '5554999730205';

/// Paguei no cartão A1 nesta visita do Flutter (mesmo load).
class FunilPixSessao {
  FunilPixSessao._();
  static bool a1PagoAvulso = false;
}

class FunilPixLinha {
  const FunilPixLinha({required this.descricao, required this.valor});

  final String descricao;
  final double valor;
}

class FunilPixTicketResult {
  const FunilPixTicketResult({required this.pago, this.comprovante});

  final bool pago;
  final FunilComprovanteArquivo? comprovante;
}

Future<FunilPixTicketResult> showFunilPixTicket({
  required BuildContext context,
  required String titulo,
  required List<FunilPixLinha> linhas,
  required String txidPrefixo,
}) async {
  final total = linhas.fold<double>(0, (s, l) => s + l.valor);
  final now = DateTime.now();
  String d2(int n) => n.toString().padLeft(2, '0');
  final txid =
      '$txidPrefixo${now.year}${d2(now.month)}${d2(now.day)}${d2(now.hour)}${d2(now.minute)}';
  final payload = FunilPixEmv.payload(valor: total, txid: txid);
  final exigeComprovante = txidPrefixo == 'A1';
  final ok = await showDialog<FunilPixTicketResult>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => _FunilPixTicketDialog(
      titulo: titulo,
      linhas: linhas,
      total: total,
      payload: payload,
      txid: txid,
      exigeComprovante: exigeComprovante,
    ),
  );
  return ok ?? const FunilPixTicketResult(pago: false);
}

class _FunilPixTicketDialog extends StatefulWidget {
  const _FunilPixTicketDialog({
    required this.titulo,
    required this.linhas,
    required this.total,
    required this.payload,
    required this.txid,
    required this.exigeComprovante,
  });

  final String titulo;
  final List<FunilPixLinha> linhas;
  final double total;
  final String payload;
  final String txid;
  final bool exigeComprovante;

  @override
  State<_FunilPixTicketDialog> createState() => _FunilPixTicketDialogState();
}

class _FunilPixTicketDialogState extends State<_FunilPixTicketDialog> {
  FunilComprovanteArquivo? _comp;
  String? _erroComp;

  String get _crc => widget.payload.length >= 4
      ? widget.payload.substring(widget.payload.length - 4)
      : '';

  String _brl(double v) =>
      'R\$ ${v.toStringAsFixed(2).replaceAll('.', ',')}';

  Future<void> _abrirWhatsApp() async {
    await launchUrl(
      Uri.parse('https://wa.me/$kPixTicketWhatsAppDigits'),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _anexar() async {
    setState(() => _erroComp = null);
    try {
      final arq = await escolherComprovanteFunil();
      if (arq != null) setState(() => _comp = arq);
    } on StateError catch (e) {
      setState(() => _erroComp = e.message);
    }
  }

  void _confirmarPago() {
    if (widget.exigeComprovante && _comp == null) {
      setState(() => _erroComp = 'comprovante_required');
      return;
    }
    Navigator.pop(
      context,
      FunilPixTicketResult(pago: true, comprovante: _comp),
    );
  }

  String _txtErroComp(String code) => switch (code) {
        'file_too_large' =>
          'O comprovante de pagamento deve ter no maximo 2 MB.',
        'file_type' => 'Use PDF, JPG ou PNG.',
        'comprovante_required' =>
          'Anexe o comprovante de pagamento para confirmar.',
        _ => 'Nao foi possivel anexar o comprovante de pagamento.',
      };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420, maxHeight: 720),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFDF8),
                    border: Border.all(color: const Color(0xFFC4B8A0)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              kSiteBrandEmblemAsset,
                              width: 36,
                              height: 36,
                              filterQuality: FilterQuality.medium,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                'PerfectGest - Contabilidade',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'CNPJ $kCompanyCnpj',
                          style: const TextStyle(fontSize: 12, height: 1.35),
                        ),
                        Text(
                          kCompanyAddressLine,
                          style: const TextStyle(fontSize: 12, height: 1.35),
                        ),
                        Text(
                          kCompanyContactEmail,
                          style: const TextStyle(fontSize: 12, height: 1.35),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '- - - - - - - - - - - - - - - - - - -',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 1.2,
                              color: Color(0xFF8A8070),
                            ),
                          ),
                        ),
                        Text(
                          widget.titulo,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        for (final l in widget.linhas)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    l.descricao,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                Text(
                                  _brl(l.valor),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const Divider(height: 18),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'TOTAL',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              _brl(widget.total),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: QrImageView(
                            data: widget.payload,
                            size: 200,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'PIX copia e cola',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SelectableText(
                          widget.payload,
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'JetBrains Mono',
                            height: 1.3,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: widget.payload),
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Codigo PIX copiado.'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy, size: 16),
                            label: const Text('Copiar codigo'),
                          ),
                        ),
                        const Divider(height: 18),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              kSiteBrandEmblemAsset,
                              width: 28,
                              height: 28,
                              filterQuality: FilterQuality.medium,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Selo PerfectGest - Contabilidade',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          kCompanyLegalName,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            height: 1.35,
                          ),
                        ),
                        Text(
                          'CNPJ $kCompanyCnpj',
                          style: const TextStyle(fontSize: 11, height: 1.35),
                        ),
                        InkWell(
                          onTap: _abrirWhatsApp,
                          child: const Text(
                            'WhatsApp (54) 99973-0205',
                            style: TextStyle(
                              fontSize: 11,
                              height: 1.35,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1B7A4A),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Text(
                          'Autenticacao ${widget.txid}',
                          style: const TextStyle(fontSize: 11, height: 1.35),
                        ),
                        Text(
                          'CRC PIX $_crc',
                          style: const TextStyle(fontSize: 11, height: 1.35),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.exigeComprovante
                              ? 'Cobranca PIX. Anexe o comprovante de pagamento (PDF, JPG ou PNG, maximo 2 MB).'
                              : 'Cobranca PIX. Depois de pagar envie o comprovante.',
                          style: const TextStyle(fontSize: 11, height: 1.4),
                        ),
                        if (widget.exigeComprovante) ...[
                          const SizedBox(height: 10),
                          OutlinedButton.icon(
                            onPressed: _anexar,
                            icon: const Icon(Icons.attach_file, size: 18),
                            label: Text(
                              _comp == null
                                  ? 'Anexar comprovante de pagamento'
                                  : 'Trocar comprovante de pagamento',
                            ),
                          ),
                          if (_comp != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                _comp!.nome,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          if (_erroComp != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                _txtErroComp(_erroComp!),
                                style: const TextStyle(
                                  color: Color(0xFFB00020),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(
                      context,
                      const FunilPixTicketResult(pago: false),
                    ),
                    child: const Text('Voltar'),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: _confirmarPago,
                    child: const Text('Paguei'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
