import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'barber_checkout_sheet.dart';
import 'barber_cloud.dart';
import 'barber_ics.dart';
import 'barber_pix_emv.dart';
import 'barber_slot_engine.dart';
import 'funil_comprovante_pick.dart';
import 'site_public_urls.dart';

enum _PayMode { pix, payAtShop, noPixKey }

class _BookedSnapshot {
  const _BookedSnapshot({
    required this.appointmentId,
    required this.clientName,
    required this.clientPhone,
    required this.proName,
    required this.proPhone,
    required this.serviceName,
    required this.shopName,
    required this.startsAt,
    required this.endsAt,
    required this.uid,
    required this.amountDue,
    required this.payMode,
    this.pixTxid = '',
    this.pixPayload = '',
  });

  final String appointmentId;
  final String clientName;
  final String clientPhone;
  final String proName;
  final String proPhone;
  final String serviceName;
  final String shopName;
  final DateTime startsAt;
  final DateTime endsAt;
  final String uid;
  final double amountDue;
  final _PayMode payMode;
  final String pixTxid;
  final String pixPayload;

  String get whenLabel {
    String tw(int n) => n.toString().padLeft(2, '0');
    final d = startsAt;
    return '${tw(d.day)}/${tw(d.month)}/${d.year} às ${tw(d.hour)}:${tw(d.minute)}';
  }

  String get amountLabel =>
      'R\$ ${amountDue.toStringAsFixed(2).replaceAll('.', ',')}';

  String get whatsappText {
    final buf = StringBuffer()
      ..writeln('Agendamento — $shopName')
      ..writeln('Cliente: $clientName')
      ..writeln('Telefone: $clientPhone')
      ..writeln('Serviço: $serviceName')
      ..writeln('Profissional: $proName')
      ..writeln('Quando: $whenLabel');
    if (amountDue > 0) {
      buf.writeln('Valor: $amountLabel');
    }
    switch (payMode) {
      case _PayMode.payAtShop:
        buf.writeln('Pagamento: na barbearia');
      case _PayMode.pix:
        buf
          ..writeln('Pagamento: PIX')
          ..writeln('TXID: $pixTxid')
          ..writeln('Comprovante: anexo no agendamento (app).');
      case _PayMode.noPixKey:
        buf.writeln('Pagamento: a combinar (sem chave PIX no cadastro)');
    }
    return buf.toString().trim();
  }

  String get icsSummary => '$serviceName — $shopName';

  String get icsDescription =>
      'Cliente: $clientName\nTelefone: $clientPhone\nProfissional: $proName';
}

/// Landing isolada `/Barber_Hairdresser` — grade de horários via Firebase.
class BarberHairdresserPage extends StatefulWidget {
  const BarberHairdresserPage({super.key});

  @override
  State<BarberHairdresserPage> createState() => _BarberHairdresserPageState();
}

class _BarberHairdresserPageState extends State<BarberHairdresserPage> {
  static const Color _olive = Color(0xFF556B2F);
  static const Color _bg = Color(0xFF121212);
  static const Color _surface = Color(0xFF2A2A2A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _muted = Color(0xFFD0D0D0);
  static const String _font = 'Inter';
  static const String _mono = 'JetBrains Mono';

  final _formKey = GlobalKey<FormState>();
  final _reviewFormKey = GlobalKey<FormState>();
  final _bookingKey = GlobalKey();
  final _heroKey = GlobalKey();
  final _reviewKey = GlobalKey();
  final _nomeCtrl = TextEditingController();
  final _telefoneCtrl = TextEditingController();
  final _reviewNomeCtrl = TextEditingController();
  final _reviewTextoCtrl = TextEditingController();

  BarberShopPresentation _shop = const BarberShopPresentation();
  List<BarberPro> _pros = [];
  List<BarberServiceCard> _services = [];
  List<BarberProductCard> _products = [];
  List<TimeOfDaySlot> _slots = [];
  BarberPro? _pro;
  BarberServiceCard? _service;
  DateTime? _date;
  TimeOfDaySlot? _slot;
  bool _loading = true;
  bool _loadingSlots = false;
  bool _saving = false;
  bool _success = false;
  String? _error;
  Timer? _slotsPoll;
  _BookedSnapshot? _booked;
  FunilComprovanteArquivo? _pixReceipt;
  bool _sendingReceipt = false;
  int _reviewRating = 5;
  bool _sendingReview = false;

  TextStyle get _body => const TextStyle(
        fontFamily: _font,
        color: _text,
        fontSize: 16,
        height: 1.35,
      );

  TextStyle get _mutedStyle => const TextStyle(
        fontFamily: _font,
        color: _muted,
        fontSize: 15,
        height: 1.4,
      );

  TextStyle get _title => const TextStyle(
        fontFamily: _font,
        color: _text,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        height: 1.15,
      );

  TextStyle get _section => const TextStyle(
        fontFamily: _font,
        color: _olive,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
      );

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    await BarberCloud.instance.ensureInitialized();
    final shop = await BarberCloud.instance.fetchPresentation();
    final pros = await BarberCloud.instance.listProfessionals();
    final products = await BarberCloud.instance.listProducts();
    if (!mounted) return;
    setState(() {
      _shop = shop;
      _pros = pros;
      _products = products;
      _pro = pros.isEmpty ? null : pros.first;
      _loading = false;
      if (!BarberCloud.instance.ready) {
        _error = BarberCloud.instance.lastError ??
            'Nuvem inacessível. Tente de novo ou confira a rede.';
      } else if (pros.isEmpty) {
        _error =
            'Catálogo vazio. No app: Configurações → Profissionais e horários → Salvar horário (nuvem), e cartões de serviço no profissional.';
      }
    });
    if (_pro != null) await _loadServices();
  }

  void _scrollToBooking() {
    final ctx = _bookingKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  void _scrollToInicio() {
    final ctx = _heroKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        alignment: 0,
      );
    }
  }

  Future<void> _loadServices() async {
    if (_pro == null) return;
    final list = await BarberCloud.instance.listServices(_pro!.id);
    if (!mounted) return;
    setState(() {
      _services = list;
      _service = list.isEmpty ? null : list.first;
      _slot = null;
      _slots = [];
      if (list.isEmpty && BarberCloud.instance.ready) {
        _error =
            'Sem serviços para ${_pro!.name}. No app, abra o profissional e adicione cartões; depois «Salvar horário (nuvem)» ou Salvar e publicar.';
      } else if (list.isNotEmpty &&
          (_error?.startsWith('Sem serviços') == true ||
              _error?.startsWith('Catálogo') == true)) {
        _error = null;
      }
      if (BarberCloud.instance.lastError != null) {
        _error = BarberCloud.instance.lastError;
      }
    });
  }

  Future<void> _reloadSlots() async {
    if (_pro == null || _service == null || _date == null) {
      setState(() {
        _slots = [];
        _slot = null;
      });
      return;
    }
    setState(() => _loadingSlots = true);
    final slots = await BarberCloud.instance.slots(
      professionalId: _pro!.id,
      day: _date!,
      durationMinutes: _service!.durationMinutes,
    );
    if (!mounted) return;
    setState(() {
      _slots = slots;
      _loadingSlots = false;
      if (_slot != null) {
        final still = slots.where(
          (s) =>
              s.available && s.startMinutes == _slot!.startMinutes,
        );
        if (still.isEmpty) _slot = null;
      }
    });
    _ensureSlotsPoll();
  }

  void _ensureSlotsPoll() {
    _slotsPoll?.cancel();
    if (_success || _pro == null || _service == null || _date == null) {
      return;
    }
    _slotsPoll = Timer.periodic(const Duration(seconds: 20), (_) {
      if (!mounted || _saving || _success) return;
      _reloadSlots();
    });
  }

  @override
  void dispose() {
    _slotsPoll?.cancel();
    _nomeCtrl.dispose();
    _telefoneCtrl.dispose();
    _reviewNomeCtrl.dispose();
    _reviewTextoCtrl.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    if (!(_reviewFormKey.currentState?.validate() ?? false)) return;
    setState(() => _sendingReview = true);
    try {
      await BarberCloud.instance.submitReview(
        authorName: _reviewNomeCtrl.text,
        rating: _reviewRating,
        text: _reviewTextoCtrl.text,
      );
      if (!mounted) return;
      _reviewNomeCtrl.clear();
      _reviewTextoCtrl.clear();
      setState(() => _reviewRating = 5);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Avaliação enviada. Aparece no site após aprovação da barbearia.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao enviar avaliação: $e')),
      );
    } finally {
      if (mounted) setState(() => _sendingReview = false);
    }
  }

  Future<void> _showPublishedReviews() async {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: _surface,
          title: Text(
            'Avaliações',
            style: _body.copyWith(fontWeight: FontWeight.w700),
          ),
          content: SizedBox(
            width: 420,
            child: FutureBuilder<List<BarberReviewCard>>(
              future: BarberCloud.instance.listPublishedReviews(),
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final list = snap.data ?? const <BarberReviewCard>[];
                if (list.isEmpty) {
                  return Text(
                    'Ainda não há avaliações publicadas.',
                    style: _mutedStyle,
                  );
                }
                return SizedBox(
                  height: 360,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const Divider(color: _muted),
                    itemBuilder: (context, i) {
                      final r = list[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            r.authorName,
                            style: _body.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(5, (j) {
                              return Icon(
                                j < r.rating ? Icons.star : Icons.star_border,
                                size: 16,
                                color: _olive,
                              );
                            }),
                          ),
                          const SizedBox(height: 6),
                          Text(r.text, style: _mutedStyle),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('Fechar', style: _mutedStyle),
            ),
          ],
        );
      },
    );
  }

  Future<void> _enviar() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_pro == null ||
        _service == null ||
        _date == null ||
        _slot == null ||
        !_slot!.available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escolha serviço, dia e horário livre')),
      );
      return;
    }
    setState(() => _saving = true);
    final starts = DateTime(
      _date!.year,
      _date!.month,
      _date!.day,
      _slot!.startMinutes ~/ 60,
      _slot!.startMinutes % 60,
    );
    final ends = starts.add(
      Duration(
        minutes: SlotEngine.allocateMinutes(_service!.durationMinutes),
      ),
    );
    try {
      final clientName = _nomeCtrl.text.trim();
      final clientPhone = _telefoneCtrl.text.trim();
      final amount = _service!.price;
      final allowCash =
          await BarberCloud.instance.clientAllowsCash(clientPhone);
      final proPix = _pro!.pixKey.trim();
      final shopPix = _shop.pixKey.trim();
      final pixKey = proPix.isNotEmpty ? proPix : shopPix;
      final receiver = _pro!.pixReceiverName.trim().isNotEmpty
          ? _pro!.pixReceiverName.trim()
          : (_pro!.name.trim().isNotEmpty ? _pro!.name.trim() : _shop.name);
      final city = _pro!.pixCity.trim().isNotEmpty
          ? _pro!.pixCity.trim()
          : 'BRASIL';

      late final _PayMode payMode;
      var paymentStatus = 'pending_payment';
      var pixTxid = '';
      var pixPayload = '';

      if (allowCash) {
        payMode = _PayMode.payAtShop;
        paymentStatus = 'pay_at_shop';
      } else if (pixKey.isEmpty) {
        payMode = _PayMode.noPixKey;
        paymentStatus = 'pending_payment';
      } else {
        payMode = _PayMode.pix;
        paymentStatus = 'pending_payment';
        final now = DateTime.now();
        String d2(int n) => n.toString().padLeft(2, '0');
        pixTxid =
            'SITE${now.year}${d2(now.month)}${d2(now.day)}${d2(now.hour)}${d2(now.minute)}${d2(now.second)}';
        pixPayload = BarberPixEmv.payload(
          chave: pixKey,
          nomeRecebedor: receiver,
          cidade: city,
          valor: amount,
          txid: pixTxid,
        );
      }

      final appointmentId = await BarberCloud.instance.book(
        professionalId: _pro!.id,
        serviceId: _service!.id,
        clientName: clientName,
        phone: clientPhone,
        startsAt: starts,
        endsAt: ends,
        amountDue: amount,
        paymentStatus: paymentStatus,
        pixTxid: pixTxid,
      );
      if (!mounted) return;
      final booked = _BookedSnapshot(
        appointmentId: appointmentId,
        clientName: clientName,
        clientPhone: clientPhone,
        proName: _pro!.name,
        proPhone: _pro!.phone,
        serviceName: _service!.name,
        shopName: _shop.name,
        startsAt: starts,
        endsAt: ends,
        uid:
            'barber-${starts.millisecondsSinceEpoch}-${_pro!.id}@perfectgestdev.com',
        amountDue: amount,
        payMode: payMode,
        pixTxid: pixTxid,
        pixPayload: pixPayload,
      );
      _slotsPoll?.cancel();
      await _reloadSlots();
      if (!mounted) return;
      setState(() {
        _booked = booked;
        _pixReceipt = null;
        _success = true;
        _saving = false;
      });
      // PIX: cliente anexa comprovante antes do WA do barbeiro.
      if (payMode != _PayMode.pix) {
        await _openBookingWhatsApp(booked);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      await _reloadSlots();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao agendar: $e')),
      );
    }
  }

  String _barberWaDigits(_BookedSnapshot booked) {
    final pro = booked.proPhone.replaceAll(RegExp(r'\D'), '');
    if (pro.isNotEmpty) {
      return pro.startsWith('55') ? pro : '55$pro';
    }
    final shop = _shop.whatsappPhone.trim();
    if (shop.isNotEmpty) {
      return shop.startsWith('55') ? shop : '55$shop';
    }
    return '';
  }

  Future<void> _openBookingWhatsApp(_BookedSnapshot booked) async {
    final phone = _barberWaDigits(booked);
    if (phone.isEmpty) return;
    final uri = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(booked.whatsappText)}',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _pickPixReceipt() async {
    setState(() => _error = null);
    try {
      final file = await escolherComprovanteFunil();
      if (!mounted || file == null) return;
      setState(() => _pixReceipt = file);
    } catch (e) {
      if (!mounted) return;
      final msg = '$e'.contains('file_too_large')
          ? 'Arquivo maior que 2 MB'
          : '$e'.contains('file_type')
              ? 'Use PDF, JPG ou PNG'
              : 'Falha ao anexar: $e';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  Future<void> _sendPixReceiptToBarber() async {
    final booked = _booked;
    if (booked == null || booked.payMode != _PayMode.pix) return;
    if (_pixReceipt == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Anexe o comprovante PIX')),
      );
      return;
    }
    final digits = _barberWaDigits(booked);
    if (digits.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Profissional/loja sem WhatsApp — cadastre o telefone no app',
          ),
        ),
      );
      return;
    }
    setState(() => _sendingReceipt = true);
    try {
      final receiptUri =
          'data:${_pixReceipt!.mime};base64,${_pixReceipt!.base64}';
      await BarberCloud.instance.attachAppointmentReceipt(
        appointmentId: booked.appointmentId,
        receiptDataUri: receiptUri,
      );
      if (!mounted) return;
      await _openBookingWhatsApp(booked);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Comprovante gravado — finalize o envio no WhatsApp do barbeiro',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao enviar comprovante: $e')),
      );
    } finally {
      if (mounted) setState(() => _sendingReceipt = false);
    }
  }

  void _downloadBookingIcs(_BookedSnapshot booked) {
    downloadBarberAppointmentIcs(
      uid: booked.uid,
      startsAt: booked.startsAt,
      endsAt: booked.endsAt,
      summary: booked.icsSummary,
      description: booked.icsDescription,
      location: _shop.name,
      filename:
          'agendamento-${booked.startsAt.millisecondsSinceEpoch}.ics',
    );
  }

  void _novaSolicitacao() {
    setState(() {
      _success = false;
      _booked = null;
      _pixReceipt = null;
      _sendingReceipt = false;
      _nomeCtrl.clear();
      _telefoneCtrl.clear();
      _service = null;
      _date = null;
      _slot = null;
      _slots = [];
    });
  }

  InputDecoration _fieldDeco(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontFamily: _font, color: _muted),
      floatingLabelStyle: const TextStyle(fontFamily: _font, color: _olive),
      filled: true,
      fillColor: _surface,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _olive.withValues(alpha: 0.55)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _olive, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final padH = w < 420 ? 16.0 : 24.0;

    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        fontFamily: _font,
        scaffoldBackgroundColor: _bg,
        colorScheme: const ColorScheme.dark(
          primary: _olive,
          onPrimary: _text,
          surface: _surface,
          onSurface: _text,
        ),
      ),
      child: Scaffold(
        backgroundColor: _bg,
        body: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _bg,
                    const Color(0xFF1A1F14),
                    _olive.withValues(alpha: 0.18),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(padH, 12, padH, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        kBarberHairdresserPath,
                        style: const TextStyle(
                          fontFamily: _mono,
                          color: _muted,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _loading
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            padding: EdgeInsets.fromLTRB(padH, 12, padH, 32),
                            child: Center(
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 560),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    KeyedSubtree(
                                      key: _heroKey,
                                      child: _buildHero(),
                                    ),
                                    if (_error != null) ...[
                                      const SizedBox(height: 16),
                                      Text(
                                        _error!,
                                        textAlign: TextAlign.center,
                                        style: _mutedStyle.copyWith(
                                          color: const Color(0xFFFFB74D),
                                        ),
                                      ),
                                    ],
                                    const SizedBox(height: 28),
                                    _buildProductsVitrine(),
                                    if (_products.isNotEmpty)
                                      const SizedBox(height: 28),
                                    KeyedSubtree(
                                      key: _bookingKey,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Agendar', style: _section),
                                          ),
                                          TextButton.icon(
                                            onPressed: _scrollToInicio,
                                            icon: const Icon(
                                              Icons.arrow_upward,
                                              size: 16,
                                              color: _olive,
                                            ),
                                            label: Text(
                                              'Voltar ao início',
                                              style: _mutedStyle.copyWith(
                                                color: _olive,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    if (_success)
                                      _buildSuccess()
                                    else
                                      _buildForm(),
                                    const SizedBox(height: 36),
                                    KeyedSubtree(
                                      key: _reviewKey,
                                      child: _buildReviewSection(),
                                    ),
                                    const SizedBox(height: 36),
                                    _buildFooter(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buyProduct(BarberProductCard p) async {
    final qtyCtrl = TextEditingController(text: '1');
    final qty = await showDialog<int>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: _surface,
          title: Text(
            'Quantidade — ${p.name}',
            style: _body.copyWith(fontWeight: FontWeight.w700),
          ),
          content: TextField(
            controller: qtyCtrl,
            keyboardType: TextInputType.number,
            style: _body,
            decoration: InputDecoration(
              labelText: 'Quantidade (máx. ${p.stockQty})',
              labelStyle: _mutedStyle,
              filled: true,
              fillColor: _bg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('Cancelar', style: _mutedStyle),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: _olive),
              onPressed: () {
                final n = int.tryParse(qtyCtrl.text.trim()) ?? 0;
                if (n < 1 || n > p.stockQty) return;
                Navigator.pop(ctx, n);
              },
              child: Text('Continuar', style: _body.copyWith(fontWeight: FontWeight.w700)),
            ),
          ],
        );
      },
    );
    qtyCtrl.dispose();
    if (qty == null || !mounted) return;
    await showBarberCheckout(
      context: context,
      shop: _shop,
      product: p,
      qty: qty,
    );
  }

  Widget _buildProductsVitrine() {
    if (_products.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Produtos', style: _section),
        const SizedBox(height: 8),
        Text(
          'Produtos disponíveis para venda.',
          style: _mutedStyle.copyWith(fontSize: 13),
        ),
        const SizedBox(height: 12),
        ..._products.map((p) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _olive.withValues(alpha: 0.45)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (p.imageUrl.trim().isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      p.imageUrl,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
                        width: 64,
                        height: 64,
                        child: Icon(Icons.shopping_bag_outlined, color: _olive),
                      ),
                    ),
                  )
                else
                  const SizedBox(
                    width: 64,
                    height: 64,
                    child: Icon(Icons.shopping_bag_outlined, color: _olive),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        style: _body.copyWith(fontWeight: FontWeight.w700),
                      ),
                      if (p.description.isNotEmpty)
                        Text(
                          p.description,
                          style: _mutedStyle.copyWith(fontSize: 13),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        '${p.priceLabel} · ${p.category} · ${p.stockQty} un.',
                        style: _body.copyWith(
                          color: _olive,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FilledButton(
                          onPressed: () => _buyProduct(p),
                          style: FilledButton.styleFrom(
                            backgroundColor: _olive,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                          ),
                          child: Text(
                            'Comprar',
                            style: _body.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildHero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: _buildShopLogo(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _shop.name,
          textAlign: TextAlign.center,
          style: _title,
        ),
        if (_shop.promoText.trim().isNotEmpty) ...[
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _olive.withValues(alpha: 0.55)),
            ),
            child: Text(
              _shop.promoText.trim(),
              textAlign: TextAlign.center,
              style: _body.copyWith(color: _olive, fontWeight: FontWeight.w600),
            ),
          ),
        ],
        const SizedBox(height: 18),
        FilledButton(
          onPressed: _scrollToBooking,
          style: FilledButton.styleFrom(
            backgroundColor: _olive,
            foregroundColor: _text,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(
            'Agendar horário',
            style: _body.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Escolha o dia e um horário livre — a grade respeita o tempo do serviço.',
          textAlign: TextAlign.center,
          style: _mutedStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildShopLogo() {
    final logoUrl = _shop.logoUrl.trim();
    if (!BarberCloud.isUsableLogoUrl(
      logoUrl,
      bookingUrl: _shop.bookingUrl,
    )) {
      return _logoFallback();
    }
    if (logoUrl.startsWith('data:image/')) {
      try {
        final comma = logoUrl.indexOf(',');
        final b64 = comma >= 0 ? logoUrl.substring(comma + 1) : logoUrl;
        return Image.memory(
          base64Decode(b64),
          width: 112,
          height: 112,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _logoFallback(),
        );
      } catch (_) {
        return _logoFallback();
      }
    }
    return Image.network(
      logoUrl,
      width: 112,
      height: 112,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _logoFallback(),
    );
  }

  Widget _logoFallback() {
    return Container(
      width: 112,
      height: 112,
      color: _surface,
      alignment: Alignment.center,
      child: const Icon(Icons.content_cut, color: _olive, size: 48),
    );
  }

  Widget _buildReviewSection() {
    InputDecoration deco(String label) => InputDecoration(
          labelText: label,
          labelStyle: _mutedStyle,
          filled: true,
          fillColor: _surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        );

    return Form(
      key: _reviewFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text('Avaliar', style: _section)),
              TextButton(
                onPressed: _showPublishedReviews,
                child: Text(
                  'ver avaliações',
                  style: _mutedStyle.copyWith(
                    color: _olive,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationColor: _olive,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Deixe a sua opinião. A barbearia aprova antes de publicar.',
            style: _mutedStyle.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _reviewNomeCtrl,
            style: _body,
            decoration: deco('Seu nome'),
            validator: (v) {
              final t = v?.trim() ?? '';
              if (t.isEmpty) return 'Informe o nome';
              if (t.length > 80) return 'Nome demasiado longo';
              return null;
            },
          ),
          const SizedBox(height: 10),
          Text('Nota', style: _mutedStyle.copyWith(fontSize: 13)),
          const SizedBox(height: 4),
          Row(
            children: List.generate(5, (i) {
              final n = i + 1;
              return IconButton(
                onPressed: () => setState(() => _reviewRating = n),
                icon: Icon(
                  n <= _reviewRating ? Icons.star : Icons.star_border,
                  color: _olive,
                ),
              );
            }),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: _reviewTextoCtrl,
            style: _body,
            maxLines: 3,
            maxLength: 1000,
            decoration: deco('Sua avaliação'),
            validator: (v) {
              final t = v?.trim() ?? '';
              if (t.isEmpty) return 'Escreva a avaliação';
              return null;
            },
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: _sendingReview ? null : _submitReview,
            style: FilledButton.styleFrom(
              backgroundColor: _olive,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: _sendingReview
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    'Enviar avaliação',
                    style: _body.copyWith(fontWeight: FontWeight.w700),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Image.asset(
          'imagens/brasao_perfectgestdev.png',
          height: 40,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'imagens/brasao_emblema.png',
            height: 40,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.verified_outlined,
              color: _muted,
              size: 32,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'PerfectGest Dev',
          textAlign: TextAlign.center,
          style: _mutedStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildSuccess() {
    final booked = _booked;
    final canWa = booked != null && _barberWaDigits(booked).isNotEmpty;
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _olive.withValues(alpha: 0.55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.check_circle_outline, color: _olive, size: 44),
          const SizedBox(height: 12),
          Text(
            'Horário reservado',
            textAlign: TextAlign.center,
            style: _body.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            booked == null
                ? 'O agendamento foi gravado na nuvem e aparece na agenda do profissional.'
                : '${booked.serviceName} com ${booked.proName} — ${booked.whenLabel}.',
            textAlign: TextAlign.center,
            style: _mutedStyle,
          ),
          if (booked != null) ...[
            const SizedBox(height: 16),
            if (booked.payMode == _PayMode.payAtShop)
              Text(
                'Pagamento na barbearia',
                textAlign: TextAlign.center,
                style: _body.copyWith(
                  color: _olive,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              )
            else if (booked.payMode == _PayMode.noPixKey) ...[
              Text(
                'Sem chave PIX cadastrada para este profissional/loja. '
                'Confirme o pagamento pelo WhatsApp.',
                textAlign: TextAlign.center,
                style: _mutedStyle.copyWith(color: const Color(0xFFFFB74D)),
              ),
            ] else ...[
              Text(
                booked.amountLabel,
                textAlign: TextAlign.center,
                style: _body.copyWith(
                  color: _olive,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pague via PIX e anexe o comprovante para enviar ao barbeiro.',
                textAlign: TextAlign.center,
                style: _mutedStyle.copyWith(fontSize: 13),
              ),
              if (booked.pixPayload.isNotEmpty) ...[
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    child: QrImageView(
                      data: booked.pixPayload,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'PIX copia e cola',
                  style: _mutedStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                SelectableText(
                  booked.pixPayload,
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
                    await Clipboard.setData(
                      ClipboardData(text: booked.pixPayload),
                    );
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Código PIX copiado')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _olive,
                    side: const BorderSide(color: _olive),
                  ),
                  icon: const Icon(Icons.copy, color: _olive),
                  label: Text(
                    'Copiar código',
                    style: _body.copyWith(
                      color: _olive,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _sendingReceipt ? null : _pickPixReceipt,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _olive,
                    side: const BorderSide(color: _olive),
                  ),
                  icon: const Icon(Icons.attach_file, color: _olive),
                  label: Text(
                    _pixReceipt == null
                        ? 'Anexar comprovante PIX'
                        : 'Comprovante: ${_pixReceipt!.nome}',
                    style: _body.copyWith(
                      color: _olive,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: _sendingReceipt ? null : _sendPixReceiptToBarber,
                  style: FilledButton.styleFrom(
                    backgroundColor: _olive,
                    foregroundColor: _text,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: _sendingReceipt
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.send),
                  label: Text(
                    'Enviar comprovante no WhatsApp',
                    style: _body.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ],
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => _downloadBookingIcs(booked),
              style: FilledButton.styleFrom(
                backgroundColor: booked.payMode == _PayMode.pix
                    ? _surface
                    : _olive,
                foregroundColor: _text,
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: booked.payMode == _PayMode.pix
                    ? const BorderSide(color: _olive)
                    : BorderSide.none,
              ),
              icon: const Icon(Icons.event_available_outlined),
              label: Text(
                'Adicionar ao calendário',
                style: _body.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            if (canWa && booked.payMode != _PayMode.pix) ...[
              const SizedBox(height: 8),
              Text(
                'Abrimos o WhatsApp com o resumo do horário.',
                textAlign: TextAlign.center,
                style: _mutedStyle.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => _openBookingWhatsApp(booked),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _olive,
                  side: const BorderSide(color: _olive),
                ),
                icon: const Icon(Icons.chat, color: _olive),
                label: Text(
                  'Reabrir WhatsApp',
                  style: _body.copyWith(
                    color: _olive,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
          const SizedBox(height: 12),
          TextButton(
            onPressed: _novaSolicitacao,
            child: Text(
              'Nova solicitação',
              style: _body.copyWith(color: _olive, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_pros.length > 1) ...[
            DropdownButtonFormField<String>(
              initialValue: _pro?.id,
              dropdownColor: _surface,
              style: _body,
              decoration: _fieldDeco('Profissional'),
              items: _pros
                  .map(
                    (p) => DropdownMenuItem(
                      value: p.id,
                      child: Text(p.name, style: _body),
                    ),
                  )
                  .toList(),
              onChanged: (id) async {
                final p = _pros.firstWhere((e) => e.id == id);
                setState(() => _pro = p);
                await _loadServices();
              },
            ),
            const SizedBox(height: 12),
          ],
          TextFormField(
            controller: _nomeCtrl,
            style: _body,
            decoration: _fieldDeco('Nome'),
            validator: (v) =>
                (v == null || v.trim().length < 2) ? 'Informe o nome' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _telefoneCtrl,
            style: _body,
            keyboardType: TextInputType.phone,
            decoration: _fieldDeco('Telefone / WhatsApp'),
            validator: (v) {
              final digits = (v ?? '').replaceAll(RegExp(r'\D'), '');
              if (digits.length < 10) return 'Telefone inválido';
              return null;
            },
          ),
          const SizedBox(height: 12),
          if (_services.isEmpty)
            Text(
              'Nenhum serviço publicado para este profissional.',
              style: _mutedStyle.copyWith(color: const Color(0xFFFFB74D)),
            )
          else
            DropdownButtonFormField<String>(
              initialValue: _service?.id,
              dropdownColor: _surface,
              style: _body,
              decoration: _fieldDeco('Serviço'),
              items: _services
                  .map(
                    (s) => DropdownMenuItem(
                      value: s.id,
                      child: Text(
                        '${s.name} · ${s.priceLabel} · ${s.durationMinutes} min',
                        style: _body,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (id) async {
                final s = _services.firstWhere((e) => e.id == id);
                setState(() {
                  _service = s;
                  _slot = null;
                });
                await _reloadSlots();
              },
              validator: (v) => v == null ? 'Escolha o serviço' : null,
            ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () async {
              final now = DateTime.now();
              final picked = await showDatePicker(
                context: context,
                initialDate: _date ?? now,
                firstDate: DateTime(now.year, now.month, now.day),
                lastDate: now.add(const Duration(days: 90)),
              );
              if (picked != null) {
                setState(() {
                  _date = picked;
                  _slot = null;
                });
                await _reloadSlots();
              }
            },
            child: InputDecorator(
              decoration: _fieldDeco('Dia'),
              child: Text(
                _date == null
                    ? 'Toque para escolher o dia'
                    : '${_date!.day.toString().padLeft(2, '0')}/'
                        '${_date!.month.toString().padLeft(2, '0')}/'
                        '${_date!.year}',
                style: _body.copyWith(
                  color: _date == null ? _muted : _text,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Horários disponíveis', style: _section),
          const SizedBox(height: 8),
          if (_date == null || _service == null)
            Text(
              'Escolha serviço e dia para abrir a grade',
              style: _mutedStyle,
            )
          else if (_loadingSlots)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_slots.where((s) => s.available).isEmpty)
            Text(
              'Sem horários disponíveis para hoje. '
              'Procure horários disponíveis nos próximos dias!',
              style: _mutedStyle.copyWith(color: const Color(0xFFFFB74D)),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final s in _slots.where((s) => s.available))
                  _slotChip(s),
              ],
            ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: _saving ? null : _enviar,
            style: FilledButton.styleFrom(
              backgroundColor: _olive,
              foregroundColor: _text,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: _saving
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    'Confirmar horário',
                    style: _body.copyWith(fontWeight: FontWeight.w700),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _slotChip(TimeOfDaySlot s) {
    final selected = _slot?.startMinutes == s.startMinutes;
    return ChoiceChip(
      label: Text(s.label),
      selected: selected,
      selectedColor: _olive,
      labelStyle: TextStyle(
        color: _text,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: _surface,
      onSelected: (_) => setState(() => _slot = s),
    );
  }
}
