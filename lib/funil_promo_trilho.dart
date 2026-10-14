import 'package:flutter/material.dart';

import 'brand_palette.dart';

const Color kFunilSeloVerde = Color(0xFF1B8A4A);

/// Selo redondo verde no canto do cartão.
class FunilSeloDescontoVerde extends StatelessWidget {
  const FunilSeloDescontoVerde({
    super.key,
    required this.texto,
    this.diametro = 84,
  });

  final String texto;
  final double diametro;

  static Widget sobre({required Widget child, required String texto}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          bottom: 8,
          right: 8,
          child: FunilSeloDescontoVerde(texto: texto),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: texto,
      child: SizedBox(
        width: diametro,
        height: diametro,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: kFunilSeloVerde,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.4),
            boxShadow: [
              BoxShadow(
                color: kFunilSeloVerde.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                texto,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                  height: 1.15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Trilho promocional fixo à esquerda (carvão / ouro / prata).
class FunilPromoTrilho extends StatelessWidget {
  const FunilPromoTrilho({
    super.key,
    required this.texto,
    required this.selo,
    required this.jaNoPreco,
  });

  final String texto;
  final String selo;
  final String jaNoPreco;

  static double larguraDe(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 720 ? 56.0 : 68.0;
  }

  static double recuoConteudo(BuildContext context, bool narrow) {
    return larguraDe(context) + (narrow ? 16.0 : 24.0);
  }

  @override
  Widget build(BuildContext context) {
    final w = larguraDe(context);
    return Semantics(
      label: '$selo $jaNoPreco. $texto',
      child: SizedBox(
        width: w,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                BrandPalette.charcoal,
                BrandPalette.charcoalDeep,
                BrandPalette.charcoal,
              ],
            ),
            border: Border(
              left: BorderSide(color: BrandPalette.silverMid, width: 1),
              right: BorderSide(color: BrandPalette.goldWarm, width: 1.6),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 2, 6),
                child: Column(
                  children: [
                    Text(
                      selo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: BrandPalette.goldWarm,
                        fontWeight: FontWeight.w800,
                        fontSize: 19,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      jaNoPreco,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: BrandPalette.silverLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, c) {
                    return RotatedBox(
                      quarterTurns: 3,
                      child: SizedBox(
                        width: c.maxHeight,
                        height: c.maxWidth,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              texto,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                color: BrandPalette.silverLight,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.4,
                                height: 1.2,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
