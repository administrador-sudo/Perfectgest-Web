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

  static double recuoConteudo(BuildContext context, bool narrow) {
    return narrow ? 16.0 : 24.0;
  }

  @override
  Widget build(BuildContext context) {
    final linhas = texto.split('\n');
    const estiloLinha = TextStyle(
      color: BrandPalette.silverLight,
      fontWeight: FontWeight.w700,
      fontSize: 20.4,
      height: 1.25,
    );
    return Semantics(
      label: '$selo $jaNoPreco. $texto',
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: BrandPalette.charcoalDeep,
          border: Border(
            top: BorderSide(color: BrandPalette.silverMid, width: 1),
            bottom: BorderSide(color: BrandPalette.goldWarm, width: 1.6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selo,
                    style: const TextStyle(
                      color: BrandPalette.goldWarm,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      height: 1,
                    ),
                  ),
                  Text(
                    jaNoPreco,
                    style: const TextStyle(
                      color: BrandPalette.silverLight,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      linhas.first,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: estiloLinha,
                    ),
                    if (linhas.length > 1)
                      Text(
                        linhas.sublist(1).join(' '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: estiloLinha,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
