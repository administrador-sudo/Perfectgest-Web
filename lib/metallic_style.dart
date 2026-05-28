import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Paleta inspirada no logo Play Dev / PerfectGestDev (prata, cobre, ouro, fundo carvão).
abstract final class MetallicPalette {
  static const charcoal = Color(0xFF141414);
  static const charcoalDeep = Color(0xFF0A0A0A);
  static const panel = Color(0xFF1E1E1E);
  static const panelHighlight = Color(0xFF2A2A2A);

  static const silverLight = Color(0xFFF0F0F0);
  static const silverMid = Color(0xFFB8B8B8);
  static const silverDark = Color(0xFF6B6B6B);

  static const copper = Color(0xFFB87333);
  static const copperDeep = Color(0xFF8B5A2B);

  static const gold = Color(0xFFD4AF37);
  static const goldDim = Color(0xFF9A7B2F);

  static const List<Color> heroGradient = [gold, silverLight, copper, silverMid];
}

/// Fundo com brilho dourado suave (como na imagem do logo).
BoxDecoration metallicScaffoldDecoration() {
  return const BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(0.1, 1.1),
      radius: 1.35,
      colors: [
        Color(0xFF3D3218),
        MetallicPalette.charcoalDeep,
        MetallicPalette.charcoal,
      ],
      stops: [0.0, 0.42, 1.0],
    ),
  );
}

/// Sombra sob texto «em relevo» (logo 3D).
List<Shadow> metallicRaisedTextShadows({double lift = 2.5}) {
  return [
    Shadow(
      color: Colors.black.withValues(alpha: 0.92),
      blurRadius: 1,
      offset: Offset(0, 1 + lift),
    ),
    Shadow(
      color: Colors.black.withValues(alpha: 0.75),
      blurRadius: 4,
      offset: Offset(0, 3 + lift),
    ),
    Shadow(
      color: MetallicPalette.charcoalDeep.withValues(alpha: 0.95),
      blurRadius: 8,
      offset: Offset(0, 5 + lift),
    ),
    Shadow(
      color: MetallicPalette.gold.withValues(alpha: 0.35),
      blurRadius: 12,
      offset: Offset(0, 6 + lift),
    ),
  ];
}

/// Espessura padrão da borda prata (2× em relação à versão inicial 1.2 → 2.4 → 4.8).
const double kMetallicSilverBorderWidth = 4.8;

/// Painel com borda metálica e sombra quente.
BoxDecoration metallicPanelDecoration({
  double radius = 20,
  double borderWidth = kMetallicSilverBorderWidth,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        MetallicPalette.panelHighlight,
        MetallicPalette.panel,
        MetallicPalette.charcoalDeep,
      ],
    ),
    border: Border.all(
      width: borderWidth,
      color: MetallicPalette.silverLight.withValues(alpha: 0.72),
    ),
    boxShadow: [
      BoxShadow(
        color: MetallicPalette.gold.withValues(alpha: 0.22),
        blurRadius: 28,
        offset: const Offset(0, 12),
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.55),
        blurRadius: 18,
        offset: const Offset(0, 6),
      ),
    ],
  );
}

/// Texto com reflexo cromado e leve relevo (sombra por baixo).
Widget metallicChromeText(
  String text, {
  double fontSize = 28,
  FontWeight fontWeight = FontWeight.w800,
  double lift = 2.5,
}) {
  final baseStyle = GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 1.15,
  );
  final shadows = metallicRaisedTextShadows(lift: lift);
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Transform.translate(
        offset: Offset(0, 2 + lift),
        child: Text(
          text,
          style: baseStyle.copyWith(
            color: Colors.black.withValues(alpha: 0.55),
            shadows: shadows,
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(0, -lift),
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MetallicPalette.silverLight,
                MetallicPalette.silverMid,
                MetallicPalette.silverLight,
                MetallicPalette.gold,
              ],
              stops: [0.0, 0.35, 0.7, 1.0],
            ).createShader(bounds);
          },
          child: Text(
            text,
            style: baseStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

/// Destaque cobre (como «DEV» no logo) com relevo.
Widget metallicCopperText(String text, {double fontSize = 22, double lift = 2}) {
  final baseStyle = GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: FontWeight.w800,
    height: 1.1,
  );
  final shadows = metallicRaisedTextShadows(lift: lift);
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Transform.translate(
        offset: Offset(0, 2 + lift),
        child: Text(
          text,
          style: baseStyle.copyWith(
            color: Colors.black.withValues(alpha: 0.5),
            shadows: shadows,
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(0, -lift),
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [MetallicPalette.copper, MetallicPalette.gold, MetallicPalette.copperDeep],
            ).createShader(bounds);
          },
          child: Text(
            text,
            style: baseStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

/// Botão amostra estilo «chrome».
Widget metallicSampleButton({required String label, required VoidCallback onPressed}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [MetallicPalette.silverLight, MetallicPalette.silverMid, MetallicPalette.silverDark],
      ),
      border: Border.all(
        width: kMetallicSilverBorderWidth,
        color: MetallicPalette.silverLight.withValues(alpha: 0.88),
      ),
      boxShadow: [
        BoxShadow(
          color: MetallicPalette.gold.withValues(alpha: 0.35),
          blurRadius: 14,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              color: MetallicPalette.charcoalDeep,
            ),
          ),
        ),
      ),
    ),
  );
}

/// Overlay subtil de «escovado» (radial).
class MetallicBrushedOverlay extends StatelessWidget {
  const MetallicBrushedOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _BrushedMetalPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class _BrushedMetalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.35);
    for (var i = 0; i < 48; i++) {
      final angle = (i / 48) * math.pi * 2;
      final paint = Paint()
        ..color = Colors.white.withValues(alpha: 0.018 + (i % 3) * 0.006)
        ..strokeWidth = 1.2;
      final r = size.shortestSide * 0.55;
      canvas.drawLine(
        center + Offset(math.cos(angle) * r * 0.2, math.sin(angle) * r * 0.2),
        center + Offset(math.cos(angle) * r, math.sin(angle) * r),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
