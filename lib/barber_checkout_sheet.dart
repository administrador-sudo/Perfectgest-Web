import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'barber_cloud.dart';
import 'funil_comprovante_pick.dart';

/// Checkout da vitrine: PIX (entrega/retirada + comprovante) ou dinheiro (só retirada).
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

  final _formKey = GlobalKey<FormState>();
  final _nomeCtrl = TextEditingController();
  final _foneCtrl = TextEditingController();
  final _addrCtrl = TextEditingController();

  String _pay = 'pix';
  String _fulfill = 'pickup';
  FunilComprovanteArquivo? _receipt;
  bool _saving = false;
  bool _done = false;
  String? _orderId;
  String? _error;

  double get _total => widget.product.price * widget.qty;

  String get _brl =>
      'R\$ ${_total.toStringAsFixed(2).replaceAll('.', ',')}';

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _foneCtrl.dispose();
    _addrCtrl.dispose();
    super.dispose();
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
    if (_pay == 'pix' && widget.shop.pixKey.trim().isEmpty) {
      setState(() => _error = 'Loja sem chave PIX cadastrada. Escolha dinheiro ou avise a barbearia.');
      return;
    }
    if (_pay == 'pix' && _receipt == null) {
      setState(() => _error = 'Anexe o comprovante do PIX');
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
      buf.writeln('Comprovante: anexo no pedido (app Pedidos).');
    }
    final uri = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(buf.toString())}',
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
          'Nº ${_orderId ?? ''} — aguarde a confirmação da barbearia.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: _muted, fontSize: 14),
        ),
        if (widget.shop.whatsappPhone.trim().isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Abrimos o WhatsApp com o resumo do pedido.',
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
                  label: const Text('PIX'),
                  selected: _pay == 'pix',
                  onSelected: (_) => setState(() {
                    _pay = 'pix';
                  }),
                  selectedColor: _olive,
                  labelStyle: TextStyle(
                    color: _pay == 'pix' ? _text : _muted,
                  ),
                ),
                ChoiceChip(
                  label: const Text('Dinheiro'),
                  selected: _pay == 'cash',
                  onSelected: (_) => setState(() {
                    _pay = 'cash';
                    _fulfill = 'pickup';
                    _receipt = null;
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
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _olive.withValues(alpha: 0.5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chave PIX',
                      style: TextStyle(color: _muted, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    SelectableText(
                      widget.shop.pixKey.trim().isEmpty
                          ? '(não cadastrada — peça à loja)'
                          : widget.shop.pixKey,
                      style: const TextStyle(
                        color: _text,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (widget.shop.pixKey.trim().isNotEmpty) ...[
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: widget.shop.pixKey.trim()),
                          );
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Chave PIX copiada')),
                          );
                        },
                        icon: const Icon(Icons.copy, size: 16, color: _olive),
                        label: const Text(
                          'Copiar chave',
                          style: TextStyle(color: _text),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(
                _error!,
                style: const TextStyle(color: Color(0xFFFFB74D), fontSize: 13),
              ),
            ],
            const SizedBox(height: 14),
            FilledButton(
              onPressed: _saving ? null : _submit,
              style: FilledButton.styleFrom(
                backgroundColor: _olive,
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
                          ? 'Enviar pedido + WhatsApp'
                          : 'Confirmar retirada (dinheiro)',
                      style: const TextStyle(
                        color: _text,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
