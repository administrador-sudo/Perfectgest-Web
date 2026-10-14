import 'dart:async';

import 'package:flutter/material.dart';

import 'brand_palette.dart';

const Color kFunilSeloVerde = Color(0xFF1B8A4A);

/// Selo verde compacto (não sobrepõe o preço).
class FunilSeloDescontoVerde extends StatelessWidget {
  const FunilSeloDescontoVerde({
    super.key,
    required this.texto,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: texto,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: kFunilSeloVerde,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 1.6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 12,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

const Color kFunilPromoAlertaVermelho = Color(0xFFFF1744);
const double kFunilPromoRodapeReserva = 56.0;

/// Banner promocional no rodapé (carvão / ouro / prata).
class FunilPromoTrilho extends StatefulWidget {
  const FunilPromoTrilho({
    super.key,
    required this.texto,
    required this.texto2,
    required this.selo,
    required this.jaNoPreco,
  });

  final String texto;
  final String texto2;
  final String selo;
  final String jaNoPreco;

  static double recuoConteudo(BuildContext context, bool narrow) {
    return narrow ? 16.0 : 24.0;
  }

  @override
  State<FunilPromoTrilho> createState() => _FunilPromoTrilhoState();
}

class _FunilPromoTrilhoState extends State<FunilPromoTrilho> {
  bool _fechado = false;
  bool _fraseB = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 7), (_) {
      if (!mounted || _fechado) return;
      setState(() => _fraseB = !_fraseB);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_fechado) return const SizedBox.shrink();
    const estilo = TextStyle(
      color: BrandPalette.silverPeak,
      fontWeight: FontWeight.w700,
      fontSize: 14.3,
      height: 1.25,
    );
    return Semantics(
      label: '${widget.selo} OFF. ${widget.texto} ${widget.texto2}',
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: BrandPalette.goldWarm,
          border: Border(
            top: BorderSide(color: BrandPalette.silverMid, width: 1.6),
            bottom: BorderSide(color: BrandPalette.silverPeak, width: 1),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 4, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Row(
                      key: ValueKey<bool>(_fraseB),
                      children: [
                        if (!_fraseB) ...[
                          const Icon(
                            Icons.warning_rounded,
                            color: kFunilPromoAlertaVermelho,
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Text(
                            _fraseB ? widget.texto2 : widget.texto,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: estilo,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.selo,
                      style: const TextStyle(
                        color: BrandPalette.charcoalDeep,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                    const Text(
                      'OFF',
                      style: TextStyle(
                        color: BrandPalette.charcoalDeep,
                        fontWeight: FontWeight.w800,
                        fontSize: 10,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  tooltip: 'Fechar',
                  onPressed: () {
                    _timer?.cancel();
                    setState(() => _fechado = true);
                  },
                  icon: const Icon(Icons.close, color: BrandPalette.charcoalDeep, size: 20),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
