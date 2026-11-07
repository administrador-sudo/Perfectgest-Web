import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'company_legal.dart';
import 'site_public_urls.dart';

/// Landing isolada `/Barber_Hairdresser` — Barbear e Cortar (dark + oliva).
class BarberHairdresserPage extends StatefulWidget {
  const BarberHairdresserPage({super.key});

  @override
  State<BarberHairdresserPage> createState() => _BarberHairdresserPageState();
}

class _BarberHairdresserPageState extends State<BarberHairdresserPage> {
  static const Color _olive = Color(0xFF556B2F);
  static const Color _bg = Color(0xFF121212);
  static const Color _surface = Color(0xFF1E1E1E);
  static const Color _text = Color(0xFFF5F5F5);
  static const Color _muted = Color(0xFFB0B0B0);

  final _formKey = GlobalKey<FormState>();
  final _nomeCtrl = TextEditingController();
  final _telefoneCtrl = TextEditingController();
  final _horarioCtrl = TextEditingController();
  String? _servico;
  bool _success = false;

  static const _servicos = <({String nome, String preco})>[
    (nome: 'Corte', preco: 'R\$ 30,00'),
    (nome: 'Corte & Barba', preco: 'R\$ 45,00'),
    (nome: 'Barba', preco: 'R\$ 20,00'),
  ];

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _telefoneCtrl.dispose();
    _horarioCtrl.dispose();
    super.dispose();
  }

  void _goHome() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _enviar() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _success = true);
  }

  void _novaSolicitacao() {
    setState(() {
      _success = false;
      _nomeCtrl.clear();
      _telefoneCtrl.clear();
      _servico = null;
      _horarioCtrl.clear();
    });
  }

  InputDecoration _fieldDeco(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: _muted),
      filled: true,
      fillColor: _surface,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _olive.withValues(alpha: 0.4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _olive, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFC62828)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFC62828)),
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
        scaffoldBackgroundColor: _bg,
        colorScheme: const ColorScheme.dark(
          primary: _olive,
          surface: _surface,
        ),
        textTheme: GoogleFonts.libreBaskervilleTextTheme(
          ThemeData.dark().textTheme,
        ).apply(bodyColor: _text, displayColor: _text),
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
                    padding: EdgeInsets.fromLTRB(padH, 8, padH, 0),
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: _goHome,
                          icon: const Icon(Icons.arrow_back, color: _muted),
                          label: const Text(
                            'Início',
                            style: TextStyle(color: _muted),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          kBarberHairdresserPath,
                          style: GoogleFonts.jetBrainsMono(
                            color: _muted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(padH, 12, padH, 32),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 12),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    'imagens/barber_hairdresser_brasao.jpg',
                                    width: 112,
                                    height: 112,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      width: 112,
                                      height: 112,
                                      color: _surface,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.content_cut,
                                        color: _olive,
                                        size: 48,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Barbear e Cortar',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.libreBaskerville(
                                  color: _text,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Agenda local para barbearia — PerfectGest Dev.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sourceSans3(
                                  color: _muted,
                                  fontSize: 16,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                'Serviços',
                                style: GoogleFonts.sourceSans3(
                                  color: _olive,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ..._servicos.map(
                                (s) => Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _surface,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border(
                                      left: BorderSide(color: _olive, width: 4),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          s.nome,
                                          style: GoogleFonts.sourceSans3(
                                            color: _text,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        s.preco,
                                        style: GoogleFonts.sourceSans3(
                                          color: _olive,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                'Solicitar horário',
                                style: GoogleFonts.sourceSans3(
                                  color: _olive,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (_success)
                                _buildSuccess()
                              else
                                _buildForm(),
                              const SizedBox(height: 36),
                              Text(
                                'Logo da barbearia (placeholder)',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sourceSans3(
                                  color: _muted,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    color: _surface,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: _olive.withValues(alpha: 0.5),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.storefront_outlined,
                                    color: _muted,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                'PerfectGest Dev · $kCompanyFantasyName',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sourceSans3(
                                  color: _muted,
                                  fontSize: 12,
                                ),
                              ),
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

  Widget _buildSuccess() {
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
            'Pedido registrado localmente',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSans3(
              color: _text,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'A barbearia receberá o contato para confirmar o horário. '
            'Nada foi enviado ao servidor nesta página.',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSans3(color: _muted, height: 1.4),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _novaSolicitacao,
            style: OutlinedButton.styleFrom(
              foregroundColor: _olive,
              side: const BorderSide(color: _olive),
            ),
            child: const Text('Nova solicitação'),
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
          TextFormField(
            controller: _nomeCtrl,
            style: const TextStyle(color: _text),
            decoration: _fieldDeco('Nome'),
            validator: (v) {
              if (v == null || v.trim().length < 2) {
                return 'Informe o nome';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _telefoneCtrl,
            style: const TextStyle(color: _text),
            keyboardType: TextInputType.phone,
            decoration: _fieldDeco('Telefone / WhatsApp'),
            validator: (v) {
              final digits = (v ?? '').replaceAll(RegExp(r'\D'), '');
              if (digits.length < 10) {
                return 'Informe um telefone válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _servico,
            dropdownColor: _surface,
            decoration: _fieldDeco('Serviço'),
            items: _servicos
                .map(
                  (s) => DropdownMenuItem(
                    value: s.nome,
                    child: Text(s.nome, style: const TextStyle(color: _text)),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => _servico = v),
            validator: (v) {
              if ((_servico == null || _servico!.isEmpty) &&
                  (v == null || v.isEmpty)) {
                return 'Escolha o serviço';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _horarioCtrl,
            style: const TextStyle(color: _text),
            decoration: _fieldDeco('Dia e horário desejados'),
            validator: (v) {
              if (v == null || v.trim().length < 3) {
                return 'Informe o horário preferido';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: _enviar,
            style: FilledButton.styleFrom(
              backgroundColor: _olive,
              foregroundColor: _text,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Solicitar horário',
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
