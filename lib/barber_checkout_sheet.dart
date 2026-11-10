import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'barber_cloud.dart';
import 'barber_pix_emv.dart';
import 'funil_comprovante_pick.dart';

/// Checkout da vitrine: PIX (QR + comprovante) ou dinheiro (retirada).
/// Pedido → app Pedidos; comprovante PIX também no WhatsApp da loja.
/// Sem opt-in de avisos WA/ICS (só no agendar).
Future<void> showBarberCheckout({
  required BuildContext context,
  required BarberShopPresentation shop,
  required BarberProductCard product,
  required int qty,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF2A2A2A),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) => _BarberCheckoutSheet(
      shop: shop,
      product: product,
      qty: qty,
    ),
  );
}

class _BarberCheckoutSheet extends StatefulWidget {
  const _BarberCheckoutSheet({
    required this.shop,
    required this.product,
    required this.qty,
  });

  final BarberShopPresentation shop;
  final BarberProductCard product;
  final int qty;

  @override
  State<_BarberCheckoutSheet> createState() => _BarberCheckoutSheetState();
}

class _BarberCheckoutSheetState extends State<_BarberCheckoutSheet> {
  static const Color _olive = Color(0xFF556B2F);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _muted = Color(0xFFD0D0D0);
  static const String _mono = 'JetBrains Mono';

  final _formKey = GlobalKey<FormState>();
  final _nomeCtrl = TextEditingController();
  final _foneCtrl = TextEditingController();
  final _addrCtrl = TextEditingController();

  String _pay = 'pix';
  String _fulfill = 'pickup';
  FunilComprovanteArquivo? _receipt;
  bool _saving = false;
  bool _done = false;
  bool _pixPanelOpen = false;
  String _pixTxid = '';
  String _pixPayload = '';
  String? _orderId;
  String? _error;

  double get _total => widget.product.price * widget.qty;

  String get _brl =>
      'R\$ ${_total.toStringAsFixed(2).replaceAll('.', ',')}';

  bool get _canConfirm {
    if (_saving) return false;
    if (_pay == 'cash') return true;
    return _pixPanelOpen &&
        _receipt != null &&
        _pixPayload.isNotEmpty;
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _foneCtrl.dispose();
    _addrCtrl.dispose();
    super.dispose();
  }

  void _preparePix() {
    final key = widget.shop.pixKey.trim();
    if (key.isEmpty) {
      _pixTxid = '';
      _pixPayload = '';
      return;
    }
    final now = DateTime.now();
    String d2(int n) => n.toString().padLeft(2, '0');
    _pixTxid =
        'LOJA${now.year}${d2(now.month)}${d2(now.day)}${d2(now.hour)}${d2(now.minute)}${d2(now.second)}';
    _pixPayload = BarberPixEmv.payload(
      chave: key,
      nomeRecebedor: widget.shop.name,
      cidade: 'BRASIL',
      valor: _total,
      txid: _pixTxid,
    );
  }

  Future<void> _fazerPagamento() async {
    if (!_formKey.currentState!.validate()) return;
    if (_pay != 'pix') return;
    if (widget.shop.pixKey.trim().isEmpty) {
      setState(() => _error =
          'Loja sem chave PIX cadastrada. Escolha dinheiro ou avise a barbearia.');
      return;
    }
    if (_fulfill == 'delivery' && _addrCtrl.text.trim().isEmpty) {
      setState(() => _error = 'Informe o endereço de entrega');
      return;
    }
    setState(() {
      _error = null;
      _preparePix();
      _pixPanelOpen = true;
      _receipt = null;
    });
  }

  Future<void> _pickReceipt() async {
    setState(() => _error = null);
    try {
      final file = await escolherComprovanteFunil();
      if (!mounted) return;
      setState(() => _receipt = file);
    } catch (e) {
      if (!mounted) return;
      final msg = '$e'.contains('file_too_large')
          ? 'Arquivo maior que 2 MB'
          : '$e'.contains('file_type')
              ? 'Use PDF, JPG ou PNG'
              : 'Falha ao anexar: $e';
      setState(() => _error = msg);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_pay == 'cash') {
      _fulfill = 'pickup';
    }
    if (!_canConfirm) {
      setState(() => _error = _pay == 'pix'
          ? 'Anexe o comprovante PIX antes de confirmar'
          : 'Preencha os dados');
      return;
    }
    if (_pay == 'pix' && _fulfill == 'delivery' && _addrCtrl.text.trim().isEmpty) {
      setState(() => _error = 'Informe o endereço de entrega');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final receiptUrl = _receipt == null
          ? ''
          : 'data:${_receipt!.mime};base64,${_receipt!.base64}';
      final id = await BarberCloud.instance.createOrder(
        items: [
          {
            'productId': widget.product.id,
            'name': widget.product.name,
            'qty': widget.qty,
            'unitPrice': widget.product.price,
          },
        ],
        total: _total,
        paymentMethod: _pay,
        fulfillment: _fulfill,
        customerName: _nomeCtrl.text,
        customerPhone: _foneCtrl.text,
        deliveryAddress: _fulfill == 'delivery' ? _addrCtrl.text : '',
        receiptUrl: receiptUrl,
      );
      if (!mounted) return;
      setState(() {
        _orderId = id;
        _done = true;
        _saving = false;
      });
      // Sem opt-in: abre WA com resumo (+ nota do comprovante no app).
      await _openWhatsApp(id);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = '$e';
      });
    }
  }

  Future<void> _openWhatsApp(String orderId) async {
    final phone = widget.shop.whatsappPhone.trim();
    if (phone.isEmpty) return;
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    final wa = digits.startsWith('55') ? digits : '55$digits';
    final buf = StringBuffer()
      ..writeln('Pedido $orderId — ${widget.shop.name}')
      ..writeln('Cliente: ${_nomeCtrl.text.trim()}')
      ..writeln('Telefone: ${_foneCtrl.text.trim()}')
      ..writeln(
        'Pagamento: ${_pay == 'pix' ? 'PIX' : 'Dinheiro (paga na loja)'}',
      )
      ..writeln(
        'Entrega: ${_fulfill == 'delivery' ? 'Entrega' : 'Retirada na barbearia'}',
      );
    if (_fulfill == 'delivery') {
      buf.writeln('Endereço: ${_addrCtrl.text.trim()}');
    } else if (widget.shop.pickupAddress.trim().isNotEmpty) {
      buf.writeln('Retirada: ${widget.shop.pickupAddress.trim()}');
    }
    buf
      ..writeln(
        'Itens: ${widget.qty}× ${widget.product.name} — $_brl',
      )
      ..writeln('Total: $_brl');
    if (_pay == 'pix') {
      if (_pixTxid.isNotEmpty) buf.writeln('TXID: $_pixTxid');
      buf.writeln(
        'Comprovante: anexo no pedido (app Pedidos). '
        'Envie também a foto/PDF neste chat se preferir.',
      );
    }
    final uri = Uri.parse(
      'https://wa.me/$wa?text=${Uri.encodeComponent(buf.toString())}',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  InputDecoration _dec(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: _muted),
      hintStyle: const TextStyle(color: _muted),
      filled: true,
      fillColor: const Color(0xFF1C1C1C),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
      child: _done ? _buildDone() : _buildForm(),
    );
  }

  Widget _buildDone() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(Icons.check_circle_outline, color: _olive, size: 48),
        const SizedBox(height: 12),
        const Text(
          'Pedido enviado',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _text,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Nº ${_orderId ?? ''} — aparece em Pedidos no app. '
          '${_pay == 'pix' ? 'Comprovante gravado no pedido.' : 'Pagamento em dinheiro na loja.'}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: _muted, fontSize: 14),
        ),
        if (widget.shop.whatsappPhone.trim().isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Abrimos o WhatsApp do profissional com o resumo do pedido.',
            textAlign: TextAlign.center,
            style: TextStyle(color: _muted, fontSize: 13),
          ),
        ],
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          style: FilledButton.styleFrom(backgroundColor: _olive),
          child: const Text('Fechar'),
        ),
        if (widget.shop.whatsappPhone.trim().isNotEmpty) ...[
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _openWhatsApp(_orderId ?? ''),
            icon: const Icon(Icons.chat, color: _olive),
            label: const Text(
              'Reabrir WhatsApp',
              style: TextStyle(color: _text),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildForm() {
    final confirmEnabled = _canConfirm;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: _muted.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Comprar — ${widget.product.name}',
              style: const TextStyle(
                color: _text,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.qty} un. · $_brl',
              style: const TextStyle(color: _olive, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _nomeCtrl,
              style: const TextStyle(color: _text),
              decoration: _dec('Seu nome'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _foneCtrl,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: _text),
              decoration: _dec('Telefone / WhatsApp'),
              validator: (v) =>
                  (v == null || v.trim().length < 8) ? 'Informe o telefone' : null,
            ),
            const SizedBox(height: 12),
            const Text(
              'Pagamento',
              style: TextStyle(color: _muted, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('PIX agora'),
                  selected: _pay == 'pix',
                  onSelected: (_) => setState(() {
                    _pay = 'pix';
                    _pixPanelOpen = false;
                    _receipt = null;
                    _pixPayload = '';
                    _pixTxid = '';
                  }),
                  selectedColor: _olive,
                  labelStyle: TextStyle(
                    color: _pay == 'pix' ? _text : _muted,
                  ),
                ),
                ChoiceChip(
                  label: const Text('Dinheiro na hora'),
                  selected: _pay == 'cash',
                  onSelected: (_) => setState(() {
                    _pay = 'cash';
                    _fulfill = 'pickup';
                    _receipt = null;
                    _pixPanelOpen = false;
                    _pixPayload = '';
                    _pixTxid = '';
                  }),
                  selectedColor: _olive,
                  labelStyle: TextStyle(
                    color: _pay == 'cash' ? _text : _muted,
                  ),
                ),
              ],
            ),
            if (_pay == 'cash') ...[
              const SizedBox(height: 8),
              const Text(
                'Dinheiro: só retirada na barbearia. Paga na loja — sem comprovante.',
                style: TextStyle(color: _muted, fontSize: 13),
              ),
              if (widget.shop.pickupAddress.trim().isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  'Retirada: ${widget.shop.pickupAddress}',
                  style: const TextStyle(color: _text, fontSize: 13),
                ),
              ],
            ],
            if (_pay == 'pix') ...[
              const SizedBox(height: 12),
              const Text(
                'Entrega ou retirada',
                style: TextStyle(color: _muted, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Retirada'),
                    selected: _fulfill == 'pickup',
                    onSelected: (_) => setState(() => _fulfill = 'pickup'),
                    selectedColor: _olive,
                    labelStyle: TextStyle(
                      color: _fulfill == 'pickup' ? _text : _muted,
                    ),
                  ),
                  ChoiceChip(
                    label: const Text('Entrega'),
                    selected: _fulfill == 'delivery',
                    onSelected: (_) => setState(() => _fulfill = 'delivery'),
                    selectedColor: _olive,
                    labelStyle: TextStyle(
                      color: _fulfill == 'delivery' ? _text : _muted,
                    ),
                  ),
                ],
              ),
              if (_fulfill == 'pickup' &&
                  widget.shop.pickupAddress.trim().isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  'Retirada: ${widget.shop.pickupAddress}',
                  style: const TextStyle(color: _text, fontSize: 13),
                ),
              ],
              if (_fulfill == 'delivery') ...[
                const SizedBox(height: 8),
                TextFormField(
                  controller: _addrCtrl,
                  maxLines: 2,
                  style: const TextStyle(color: _text),
                  decoration: _dec('Endereço de entrega'),
                  validator: (v) {
                    if (_pay == 'pix' &&
                        _fulfill == 'delivery' &&
                        (v == null || v.trim().isEmpty)) {
                      return 'Informe o endereço';
                    }
                    return null;
                  },
                ),
              ],
              if (_pixPanelOpen && _pixPayload.isNotEmpty) ...[
                const SizedBox(height: 14),
                Text(
                  _brl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: _olive,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pague via PIX e anexe o comprovante para confirmar o pedido.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: _muted, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    child: QrImageView(
                      data: _pixPayload,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'PIX copia e cola',
                  style: TextStyle(color: _muted, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                SelectableText(
                  _pixPayload,
                  style: const TextStyle(
                    fontFamily: _mono,
                    color: _text,
                    fontSize: 11,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: _pixPayload));
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Código PIX copiado')),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16, color: _olive),
                  label: const Text(
                    'Copiar código',
                    style: TextStyle(color: _text),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _saving ? null : _pickReceipt,
                  icon: const Icon(Icons.attach_file, color: _olive),
                  label: Text(
                    _receipt == null
                        ? 'Anexar comprovante PIX'
                        : 'Comprovante: ${_receipt!.nome}',
                    style: const TextStyle(color: _text),
                  ),
                ),
              ],
            ],
            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(
                _error!,
                style: const TextStyle(color: Color(0xFFFFB74D), fontSize: 13),
              ),
            ],
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: confirmEnabled ? _submit : null,
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          confirmEnabled ? _olive : const Color(0xFF555555),
                      disabledBackgroundColor: const Color(0xFF444444),
                      foregroundColor: _text,
                      disabledForegroundColor: const Color(0xFFAAAAAA),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: _saving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: _text,
                            ),
                          )
                        : Text(
                            _pay == 'pix'
                                ? 'Confirmar pedido'
                                : 'Confirmar retirada',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: _text,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
                if (_pay == 'pix') ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: _saving ? null : _fazerPagamento,
                      style: FilledButton.styleFrom(
                        backgroundColor: _olive,
                        foregroundColor: _text,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Fazer o pagamento',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _text,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
