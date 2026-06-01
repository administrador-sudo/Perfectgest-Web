import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'company_legal.dart';
import 'metallic_style.dart';
import 'web_site_root_stub.dart' if (dart.library.html) 'web_site_root_web.dart' as web_site_root;

/// Amostra v3 — vividez e brilho do logo 3D. Rota: `/amostra-metal`.
class MetallicPreviewPage extends StatelessWidget {
  const MetallicPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MetallicPalette.charcoalDeep,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const MetallicVividBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Column(
                    children: [
                      Center(child: metallicReferenceLogo(width: 240)),
                      const SizedBox(height: 8),
                      Text(
                        'Referência (render 3D)',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: MetallicPalette.silverMid,
                        ),
                      ),
                      const SizedBox(height: 28),
                      MetallicPolishedPanel(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      metallicChromeText(kCompanyFantasyName, fontSize: 30, lift: 4),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          metallicCopperText('DEV', fontSize: 22, lift: 3.5),
                                          const SizedBox(width: 10),
                                          metallicRainbowPlayIcon(size: 24),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Voltar ao site',
                                  onPressed: () => web_site_root.navigateToSameOriginRoot(),
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: MetallicPalette.silverPeak.withValues(alpha: 0.95),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Amostra v3 — UI com o mesmo brilho',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: MetallicPalette.silverLight,
                                shadows: metallicRaisedTextShadows(lift: 1),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                metallicChromeText('PLAY', fontSize: 20, lift: 3),
                                const SizedBox(width: 8),
                                metallicRainbowPlayIcon(size: 20),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: metallicChromeText(
                                    'Codificando o Amanhã',
                                    fontSize: 20,
                                    lift: 3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Cromado com bandas de luz, cobre polido, ouro ambiente e verniz — '
                              'mais perto da vividez do badge acima.',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                height: 1.55,
                                fontWeight: FontWeight.w500,
                                color: MetallicPalette.silverLight.withValues(alpha: 0.95),
                                shadows: metallicRaisedTextShadows(lift: 1.2),
                              ),
                            ),
                            const SizedBox(height: 22),
                            metallicPolishedButton(
                              label: 'Botão cromado envernizado',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Teste local (8080). Aprovar antes de aplicar ao site completo.',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: MetallicPalette.silverMid,
                              ),
                            ),
                          ],
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
    );
  }
}
