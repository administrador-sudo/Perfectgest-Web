// ignore_for_file: avoid_print
/// Gera WebP dos screenshots usados no site (Fase 3 PageSpeed).
/// Uso: dart run tool/convert_screenshots_webp.dart
import 'dart:io';

import 'package:image/image.dart' as img;

const _sources = <String>[
  'IMAGENS_APP/Screenshot/phone_03_inicio.png',
  'IMAGENS_APP/Screenshot/PerfectGest (1).png',
  'IMAGENS_APP/Screenshot/tablet_01_inicio.jpg',
  'IMAGENS_APP/Screenshot/contabil_phone_empresa.png',
  'IMAGENS_APP/Screenshot/contabil_tablet_lancar.jpg',
];

Future<void> main() async {
  var ok = 0;
  for (final rel in _sources) {
    final src = File(rel);
    if (!src.existsSync()) {
      print('SKIP (ausente): $rel');
      continue;
    }
    final dot = rel.lastIndexOf('.');
    final outPath = '${rel.substring(0, dot)}.webp';
    final bytes = src.readAsBytesSync();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      print('FAIL decode: $rel');
      continue;
    }
    // Largura máx. ~960 px — suficiente para mockups no site.
    final resized = decoded.width > 960 ? img.copyResize(decoded, width: 960) : decoded;
    final webp = img.encodeWebP(resized);
    File(outPath).writeAsBytesSync(webp);
    final kbIn = (bytes.length / 1024).toStringAsFixed(1);
    final kbOut = (webp.length / 1024).toStringAsFixed(1);
    print('OK $outPath ($kbIn KiB -> $kbOut KiB)');
    ok++;
  }
  print('Concluido: $ok ficheiro(s) WebP.');
}
