// ignore_for_file: avoid_print
/// Gera PNG do brasão + favicons a partir do logo canónico.
/// Uso: dart run tool/generate_brand_icons.dart
import 'dart:io';
import 'dart:math' as math;

import 'package:image/image.dart' as img;

const _sourceJpg = 'imagens/Logo_da_Empreesa_PerfectGestDev.jpg';
const _emblemSource = 'imagens/perfect_brasao2_emblem.png';
const _emblemIcoSource = 'web/favicon.ico';
const _wordmarkSource = 'imagens/PERFECTGESTDEV.png';
const _heroOut = 'imagens/brasao_perfectgestdev.png';
const _emblemOut = 'imagens/brasao_emblema.png';
const _webHeroOut = 'web/brasao-perfectgestdev.png';
const _webEmblemOut = 'web/brasao-emblema.png';
const _webWordmarkOut = 'web/perfectgestdev-wordmark.png';
const _webEmblem192 = 'web/icons/brasao-emblema-192.png';

Future<void> main() async {
  final src = File(_sourceJpg);
  if (!src.existsSync()) {
    print('ERRO: fonte em falta: $_sourceJpg');
    exit(1);
  }

  final decoded = img.decodeImage(src.readAsBytesSync());
  if (decoded == null) {
    print('ERRO: não foi possível decodificar $_sourceJpg');
    exit(1);
  }

  final hero = decoded.width > 720 ? img.copyResize(decoded, width: 720) : decoded;
  _writePng(_heroOut, hero);
  _writePng(_webHeroOut, hero);

  final emblemFile = File(_emblemSource);
  if (!emblemFile.existsSync()) {
    print('ERRO: emblema em falta: $_emblemSource');
    exit(1);
  }
  final emblemRaw = img.decodeImage(emblemFile.readAsBytesSync());
  if (emblemRaw == null) {
    print('ERRO: não foi possível decodificar $_emblemSource');
    exit(1);
  }

  final emblem = _prepareEmblem(emblemRaw);
  _writePng(_emblemOut, emblem);
  _writePng(_webEmblemOut, img.copyResize(emblem, width: 256));

  _syncWordmarkToWeb();
  _ensureFaviconIco();

  _writePng('web/favicon.png', _fitInsideSquare(emblem, 48));
  _writePng('web/favicon.webp', _fitInsideSquare(emblem, 48), webp: true);
  _writePng('web/icons/Icon-192.png', _fitInsideSquare(emblem, 192));
  _writePng('web/icons/Icon-512.png', _fitInsideSquare(emblem, 512));
  _writePng('web/icons/Icon-maskable-192.png', _maskableIcon(emblem, 192));
  _writePng('web/icons/Icon-maskable-512.png', _maskableIcon(emblem, 512));
  _writePng(_webEmblem192, _fitInsideSquare(emblem, 192));

  print('OK: $_emblemOut, $_webEmblemOut, web/favicon.ico, web/favicon.png, web/icons/*');
}

img.Image _prepareEmblem(img.Image source) {
  final trimmed = img.trim(source);
  return trimmed;
}

/// Encaixa o escudo inteiro no quadrado (sem cortar laterais/topo).
img.Image _fitInsideSquare(img.Image source, int size, {double paddingRatio = 0.07}) {
  final canvas = img.Image(width: size, height: size, numChannels: 4);
  final pad = (size * paddingRatio).round().clamp(1, size ~/ 4);
  final inner = size - pad * 2;
  final scale = math.min(inner / source.width, inner / source.height);
  final w = math.max(1, (source.width * scale).round());
  final h = math.max(1, (source.height * scale).round());
  final resized = img.copyResize(source, width: w, height: h);
  img.compositeImage(
    canvas,
    resized,
    dstX: ((size - w) / 2).round(),
    dstY: ((size - h) / 2).round(),
  );
  return canvas;
}

img.Image _maskableIcon(img.Image emblem, int size) {
  final canvas = img.Image(width: size, height: size, numChannels: 4);
  img.fill(canvas, color: img.ColorRgba8(61, 61, 61, 255));
  final inner = (size * 0.76).round();
  final icon = _fitInsideSquare(emblem, inner, paddingRatio: 0.04);
  img.compositeImage(
    canvas,
    icon,
    dstX: ((size - inner) / 2).round(),
    dstY: ((size - inner) / 2).round(),
  );
  return canvas;
}

void _syncWordmarkToWeb() {
  final src = File(_wordmarkSource);
  if (!src.existsSync()) {
    print('AVISO: wordmark em falta: $_wordmarkSource');
    return;
  }
  final out = File(_webWordmarkOut);
  out.parent.createSync(recursive: true);
  out.writeAsBytesSync(src.readAsBytesSync());
}

void _ensureFaviconIco() {
  final ico = File(_emblemIcoSource);
  if (!ico.existsSync()) {
    print('AVISO: favicon.ico em falta em $_emblemIcoSource');
  }
}

void _writePng(String path, img.Image image, {bool webp = false}) {
  final file = File(path);
  file.parent.createSync(recursive: true);
  if (webp) {
    file.writeAsBytesSync(img.encodeWebP(image));
  } else {
    file.writeAsBytesSync(img.encodePng(image));
  }
}
