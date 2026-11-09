import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'barber_checkout_sheet.dart';
import 'barber_cloud.dart';
import 'barber_slot_engine.dart';
import 'site_public_urls.dart';

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
  final _bookingKey = GlobalKey();
  final _heroKey = GlobalKey();
  final _nomeCtrl = TextEditingController();
  final _telefoneCtrl = TextEditingController();

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
    super.dispose();
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
      await BarberCloud.instance.book(
        professionalId: _pro!.id,
        serviceId: _service!.id,
        clientName: _nomeCtrl.text.trim(),
        phone: _telefoneCtrl.text.trim(),
        startsAt: starts,
        endsAt: ends,
      );
      if (!mounted) return;
      _slotsPoll?.cancel();
      await _reloadSlots();
      if (!mounted) return;
      setState(() {
        _success = true;
        _saving = false;
      });
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

  void _novaSolicitacao() {
    setState(() {
      _success = false;
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
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _olive.withValues(alpha: 0.55)),
      ),
      child: Column(
        children: [
          const Icon(Icons.check_circle_outline, color: _olive, size: 44),
          const SizedBox(height: 12),
          Text(
            'Horário reservado',
            style: _body.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            'O agendamento foi gravado na nuvem e aparece na agenda do profissional.',
            textAlign: TextAlign.center,
            style: _mutedStyle,
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _novaSolicitacao,
            style: OutlinedButton.styleFrom(
              foregroundColor: _olive,
              side: const BorderSide(color: _olive),
            ),
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
