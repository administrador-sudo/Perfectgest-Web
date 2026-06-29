import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'brand_palette.dart';
import 'company_legal.dart';

/// Paleta metálica — alias de [BrandPalette] (compatibilidade interna).
abstract final class MetallicPalette {
  static const charcoal = BrandPalette.charcoal;
  static const charcoalDeep = BrandPalette.charcoalDeep;
  static const panel = BrandPalette.panel;
  static const panelHighlight = BrandPalette.panelHighlight;

  static const silverPeak = BrandPalette.silverPeak;
  static const silverLight = BrandPalette.silverLight;
  static const silverMid = BrandPalette.silverMid;
  static const silverDark = BrandPalette.silverDark;

  static const copper = BrandPalette.copper;
  static const copperBright = BrandPalette.copperBright;
  static const copperDeep = Color(0xFF7A4E22);

  static const gold = BrandPalette.gold;
  static const goldWarm = BrandPalette.goldWarm;
  static const goldDim = BrandPalette.goldDim;

  @Deprecated('Use BrandPalette.heroGlowCycle for hero animations')
  static const rainbowPlay = [
    BrandPalette.silverPeak,
    BrandPalette.gold,
    BrandPalette.goldWarm,
    BrandPalette.silverMid,
  ];
}

const double kMetallicSilverBorderWidth = 5.2;

const LinearGradient kMetallicRimGradient = BrandPalette.chromeGradient;

/// Fundo escuro + luz dourada (como no render 3D do logo).
BoxDecoration metallicScaffoldDecoration() {
  return const BoxDecoration(color: MetallicPalette.charcoalDeep);
}

/// Cena completa: ouro ambiente, reflexo no «chão», textura escovada.
class MetallicVividBackground extends StatelessWidget {
  const MetallicVividBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.55, 0.95),
              radius: 1.45,
              colors: [
                BrandPalette.goldAmbient,
                BrandPalette.goldAmbientDeep,
                MetallicPalette.charcoalDeep,
                Color(0xFF000000),
              ],
              stops: [0.0, 0.28, 0.55, 1.0],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.5, -0.35),
              radius: 0.95,
              colors: [
                MetallicPalette.gold.withValues(alpha: 0.42),
                MetallicPalette.goldWarm.withValues(alpha: 0.18),
                Colors.transparent,
              ],
              stops: const [0.0, 0.35, 1.0],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.85, 0.2),
              radius: 0.7,
              colors: [
                Colors.white.withValues(alpha: 0.06),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.38,
            widthFactor: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    MetallicPalette.gold.withValues(alpha: 0.12),
                    Colors.black.withValues(alpha: 0.75),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),
        ),
        const MetallicBrushedOverlay(density: 0.55),
        const _MetallicSparkleOverlay(),
      ],
    );
  }
}

List<Shadow> metallicRaisedTextShadows({double lift = 3}) {
  return [
    Shadow(
      color: Colors.black,
      blurRadius: 0,
      offset: Offset(1, 1 + lift),
    ),
    Shadow(
      color: Colors.black.withValues(alpha: 0.92),
      blurRadius: 2,
      offset: Offset(0, 2 + lift),
    ),
    Shadow(
      color: Colors.black.withValues(alpha: 0.85),
      blurRadius: 8,
      offset: Offset(0, 5 + lift),
    ),
    Shadow(
      color: MetallicPalette.goldWarm.withValues(alpha: 0.55),
      blurRadius: 22,
      offset: Offset(0, 8 + lift),
    ),
    Shadow(
      color: MetallicPalette.gold.withValues(alpha: 0.25),
      blurRadius: 36,
      offset: Offset(0, 12 + lift),
    ),
  ];
}

/// Painel badge — escovado circular, verniz forte, glint nas arestas.
class MetallicPolishedPanel extends StatelessWidget {
  const MetallicPolishedPanel({
    super.key,
    required this.child,
    this.radius = 22,
    this.padding = const EdgeInsets.all(28),
  });

  final Widget child;
  final double radius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final innerRadius = radius - kMetallicSilverBorderWidth * 0.6;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: MetallicPalette.gold.withValues(alpha: 0.5),
            blurRadius: 48,
            spreadRadius: 2,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            color: MetallicPalette.goldWarm.withValues(alpha: 0.35),
            blurRadius: 28,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.85),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
        gradient: kMetallicRimGradient,
      ),
      padding: const EdgeInsets.all(kMetallicSilverBorderWidth),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(innerRadius),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.5, 0.38),
                    radius: 1.05,
                    colors: [
                      const Color(0xFF3A3A3A),
                      MetallicPalette.panel,
                      MetallicPalette.charcoalDeep,
                    ],
                  ),
                ),
              ),
            ),
            const Positioned.fill(child: _CircularBrushedOverlay()),
            const Positioned.fill(child: MetallicBrushedOverlay(density: 1.1)),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 165,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0.42),
                      Colors.white.withValues(alpha: 0.16),
                      Colors.white.withValues(alpha: 0.04),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.25, 0.55, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 6,
              left: 10,
              child: Container(
                width: 130,
                height: 68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.72),
                      Colors.white.withValues(alpha: 0.22),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.35, 1.0],
                  ),
                ),
              ),
            ),
            const Positioned.fill(child: _EdgeGlintOverlay()),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-1.1, -1.0),
                    end: const Alignment(0.7, 0.65),
                    colors: [
                      Colors.white.withValues(alpha: 0.22),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.35),
                    ],
                    stops: const [0.0, 0.32, 0.68, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 90,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.45),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: padding, child: child),
          ],
        ),
      ),
    );
  }
}

/// Cromado vivo — relevo 3D + bandas de chrome + capa especular.
Widget metallicChromeText(
  String text, {
  double fontSize = 28,
  FontWeight fontWeight = FontWeight.w900,
  double lift = 3.5,
}) {
  final baseStyle = GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 1.12,
    letterSpacing: -0.5,
  );
  return _MetallicEmbossedText(
    text: text,
    baseStyle: baseStyle,
    lift: lift,
    fill: (bounds) => const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFF0F0F0),
        Color(0xFF6A6A6A),
        Color(0xFFFFFFFF),
        Color(0xFFC0C0C0),
        Color(0xFFFFE082),
      ],
      stops: [0.0, 0.12, 0.38, 0.52, 0.78, 1.0],
    ).createShader(bounds),
    specularStrength: 0.75,
    glowColor: MetallicPalette.goldWarm,
  );
}

/// Ouro polido (títulos e destaques).
Widget metallicGoldText(
  String text, {
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.w900,
  double lift = 3,
}) {
  final baseStyle = GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 1.1,
    letterSpacing: -0.2,
  );
  return _MetallicEmbossedText(
    text: text,
    baseStyle: baseStyle,
    lift: lift,
    fill: (bounds) => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFF9C4),
        MetallicPalette.gold,
        MetallicPalette.goldWarm,
        MetallicPalette.goldDim,
        Color(0xFF4A3808),
      ],
      stops: [0.0, 0.25, 0.55, 0.8, 1.0],
    ).createShader(bounds),
    specularStrength: 0.7,
    glowColor: MetallicPalette.gold,
  );
}

/// Cobre escovado polido (DEV).
Widget metallicCopperText(
  String text, {
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.w900,
  double lift = 3,
}) {
  final baseStyle = GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 1.1,
    letterSpacing: 0.5,
  );
  return _MetallicEmbossedText(
    text: text,
    baseStyle: baseStyle,
    lift: lift,
    fill: (bounds) => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFF3D6),
        MetallicPalette.copperBright,
        MetallicPalette.copper,
        MetallicPalette.copperDeep,
        Color(0xFF3D2410),
      ],
      stops: [0.0, 0.22, 0.5, 0.78, 1.0],
    ).createShader(bounds),
    specularStrength: 0.65,
    glowColor: MetallicPalette.copperBright,
  );
}

class _MetallicEmbossedText extends StatelessWidget {
  const _MetallicEmbossedText({
    required this.text,
    required this.baseStyle,
    required this.lift,
    required this.fill,
    required this.specularStrength,
    required this.glowColor,
  });

  final String text;
  final TextStyle baseStyle;
  final double lift;
  final Shader Function(Rect bounds) fill;
  final double specularStrength;
  final Color glowColor;

  static const _bevelOffsets = [
    Offset(1.2, 1.2),
    Offset(2, 2.5),
    Offset(-1, -1),
    Offset(-1.5, -2),
  ];

  @override
  Widget build(BuildContext context) {
    final shadows = metallicRaisedTextShadows(lift: lift);
    final capHeight = (baseStyle.fontSize ?? 24) * 0.52;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (final o in _bevelOffsets.take(2))
          Transform.translate(
            offset: Offset(o.dx, o.dy + lift),
            child: Text(
              text,
              style: baseStyle.copyWith(
                color: Colors.black.withValues(alpha: 0.75),
              ),
            ),
          ),
        Transform.translate(
          offset: Offset(0, 2.8 + lift),
          child: Text(
            text,
            style: baseStyle.copyWith(
              color: Colors.black.withValues(alpha: 0.5),
              shadows: shadows,
            ),
          ),
        ),
        for (final o in _bevelOffsets.skip(2))
          Transform.translate(
            offset: o,
            child: Text(
              text,
              style: baseStyle.copyWith(
                color: Colors.white.withValues(alpha: 0.18),
              ),
            ),
          ),
        Transform.translate(
          offset: Offset(0, -lift * 0.35),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: fill,
            child: Text(text, style: baseStyle.copyWith(color: Colors.white)),
          ),
        ),
        Positioned(
          left: 0,
          top: -lift * 0.35,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              heightFactor: 1,
              child: SizedBox(
                height: capHeight,
                child: Text(
                  text,
                  style: baseStyle.copyWith(
                    color: Colors.white.withValues(alpha: specularStrength),
                    shadows: [
                      Shadow(
                        color: glowColor.withValues(alpha: 0.35),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(-0.8, -2.2),
          child: Text(
            text,
            style: baseStyle.copyWith(
              color: Colors.white.withValues(alpha: 0.35),
            ),
          ),
        ),
      ],
    );
  }
}

/// Ícone play com gradiente arco-íris (acento do logo).
Widget metallicRainbowPlayIcon({double size = 22}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: const SweepGradient(colors: MetallicPalette.rainbowPlay),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.5),
          blurRadius: 6,
        ),
      ],
    ),
    child: Icon(
      Icons.play_arrow_rounded,
      size: size * 0.72,
      color: Colors.white,
    ),
  );
}

/// Logo de referência com halo dourado (comparar vividez).
Widget metallicReferenceLogo({
  String asset = kSiteBrandLogoAsset,
  double width = 220,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: MetallicPalette.gold.withValues(alpha: 0.55),
          blurRadius: 42,
          spreadRadius: 4,
        ),
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.2),
          blurRadius: 18,
          offset: const Offset(-3, -4),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.7),
          blurRadius: 28,
          offset: const Offset(0, 14),
        ),
      ],
    ),
    child: Image.asset(asset, width: width, fit: BoxFit.contain),
  );
}

Widget metallicPolishedButton({
  required String label,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: kMetallicRimGradient,
      boxShadow: [
        BoxShadow(
          color: MetallicPalette.gold.withValues(alpha: 0.45),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.6),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    padding: const EdgeInsets.all(3),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFFFFFF),
                    MetallicPalette.silverMid,
                    MetallicPalette.silverDark,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 26,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.75),
                    Colors.white.withValues(alpha: 0.12),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                child: Center(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      color: MetallicPalette.charcoalDeep,
                      shadows: [
                        Shadow(
                          color: Colors.white.withValues(alpha: 0.9),
                          offset: const Offset(0, -1.5),
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
    ),
  );
}

@Deprecated('Use metallicPolishedButton')
Widget metallicSampleButton({required String label, required VoidCallback onPressed}) =>
    metallicPolishedButton(label: label, onPressed: onPressed);

@Deprecated('Use MetallicPolishedPanel')
BoxDecoration metallicPanelDecoration({
  double radius = 20,
  double borderWidth = kMetallicSilverBorderWidth,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    gradient: const LinearGradient(
      colors: [MetallicPalette.panelHighlight, MetallicPalette.panel, MetallicPalette.charcoalDeep],
    ),
    border: Border.all(width: borderWidth, color: MetallicPalette.silverLight),
  );
}

class MetallicBrushedOverlay extends StatelessWidget {
  const MetallicBrushedOverlay({super.key, this.density = 1});

  final double density;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _BrushedMetalPainter(density: density),
        size: Size.infinite,
      ),
    );
  }
}

class _CircularBrushedOverlay extends StatelessWidget {
  const _CircularBrushedOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _CircularBrushedPainter(), size: Size.infinite),
    );
  }
}

class _EdgeGlintOverlay extends StatelessWidget {
  const _EdgeGlintOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _EdgeGlintPainter(), size: Size.infinite),
    );
  }
}

class _MetallicSparkleOverlay extends StatelessWidget {
  const _MetallicSparkleOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _SparklePainter(), size: Size.infinite),
    );
  }
}

class _BrushedMetalPainter extends CustomPainter {
  _BrushedMetalPainter({this.density = 1});
  final double density;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.3);
    for (var i = 0; i < 72; i++) {
      final angle = (i / 72) * math.pi * 2;
      final paint = Paint()
        ..color = Colors.white.withValues(alpha: (0.02 + (i % 4) * 0.008) * density)
        ..strokeWidth = 1.15;
      final r = size.shortestSide * 0.62;
      canvas.drawLine(
        center + Offset(math.cos(angle) * r * 0.12, math.sin(angle) * r * 0.12),
        center + Offset(math.cos(angle) * r, math.sin(angle) * r),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BrushedMetalPainter old) => old.density != density;
}

class _CircularBrushedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.42);
    final maxR = size.shortestSide * 0.55;
    for (var r = 8.0; r < maxR; r += 5.5) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.9
        ..color = Colors.white.withValues(alpha: 0.028 + (r % 22) * 0.001);
      canvas.drawCircle(center, r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _EdgeGlintPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.08)
      ..lineTo(size.width * 0.42, 0)
      ..lineTo(0, 0)
      ..close();
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.55),
          Colors.white.withValues(alpha: 0.08),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width * 0.5, size.height * 0.2));
    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = Colors.white.withValues(alpha: 0.35)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(4, 4), Offset(size.width * 0.35, 4), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SparklePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final spots = [
      Offset(size.width * 0.15, size.height * 0.22),
      Offset(size.width * 0.82, size.height * 0.18),
      Offset(size.width * 0.7, size.height * 0.75),
    ];
    for (final p in spots) {
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.white.withValues(alpha: 0.12),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCircle(center: p, radius: 40));
      canvas.drawCircle(p, 40, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
