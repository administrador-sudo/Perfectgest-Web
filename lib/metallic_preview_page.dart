import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'metallic_style.dart';
import 'web_site_root_stub.dart' if (dart.library.html) 'web_site_root_web.dart' as web_site_root;

/// Página de **amostra** — não altera o site principal. Rota: `/amostra-metal`.
class MetallicPreviewPage extends StatelessWidget {
  const MetallicPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(decoration: metallicScaffoldDecoration()),
          const MetallicBrushedOverlay(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: metallicPanelDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: metallicChromeText('PerfectGest', fontSize: 26, lift: 3),
                            ),
                            IconButton(
                              tooltip: 'Voltar ao site',
                              onPressed: () => web_site_root.navigateToSameOriginRoot(),
                              icon: const Icon(Icons.close_rounded, color: MetallicPalette.silverMid),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        metallicCopperText('DEV', fontSize: 18, lift: 2.5),
                        const SizedBox(height: 4),
                        Text(
                          'Amostra visual — tema metálico',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            letterSpacing: 0.4,
                            color: MetallicPalette.silverMid,
                            shadows: metallicRaisedTextShadows(lift: 0.8),
                          ),
                        ),
                        const SizedBox(height: 20),
                        metallicChromeText('Codificando o Amanhã', fontSize: 22, lift: 2.8),
                        const SizedBox(height: 8),
                        Transform.translate(
                          offset: const Offset(0, -0.5),
                          child: Text(
                            'Fundo carvão, painéis com borda prata, brilho dourado e acentos cobre — '
                            'inspirado no logo Play Dev / PerfectGestDev.',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              height: 1.5,
                              color: MetallicPalette.silverLight.withValues(alpha: 0.88),
                              shadows: metallicRaisedTextShadows(lift: 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _SwatchRow(label: 'Prata / chrome', colors: const [
                          MetallicPalette.silverLight,
                          MetallicPalette.silverMid,
                          MetallicPalette.silverDark,
                        ]),
                        const SizedBox(height: 10),
                        _SwatchRow(label: 'Cobre + ouro', colors: const [
                          MetallicPalette.copper,
                          MetallicPalette.gold,
                          MetallicPalette.goldDim,
                        ]),
                        const SizedBox(height: 24),
                        metallicSampleButton(
                          label: 'Botão estilo metal polido',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Isto é só uma pré-visualização. Se aprovar, aplicamos o mesmo '
                          'linguagem ao hero, cartões e rodapé do site completo.',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: MetallicPalette.silverDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SwatchRow extends StatelessWidget {
  const _SwatchRow({required this.label, required this.colors});

  final String label;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(fontSize: 12, color: MetallicPalette.silverMid),
          ),
        ),
        for (final c in colors)
          Container(
            width: 36,
            height: 22,
            margin: const EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              color: c,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: MetallicPalette.silverDark.withValues(alpha: 0.5)),
            ),
          ),
      ],
    );
  }
}
