import 'package:flutter/material.dart';

/// Caminho WebP paralelo ao PNG/JPG do screenshot (Fase 3 PageSpeed).
String? screenshotWebpAsset(String assetPath) {
  if (assetPath.endsWith('.png')) {
    return '${assetPath.substring(0, assetPath.length - 4)}.webp';
  }
  if (assetPath.endsWith('.jpg') || assetPath.endsWith('.jpeg')) {
    final dot = assetPath.lastIndexOf('.');
    if (dot > 0) return '${assetPath.substring(0, dot)}.webp';
  }
  return null;
}

/// Imagem de screenshot: tenta WebP, depois original e fallback.
Widget buildScreenshotAssetImage({
  required String assetPath,
  String? fallbackAssetPath,
  required BoxFit fit,
  Alignment alignment = Alignment.center,
  double? width,
  double? height,
  int? cacheWidth,
  int? cacheHeight,
  FilterQuality filterQuality = FilterQuality.medium,
  Widget? brokenPlaceholder,
}) {
  final paths = <String>[
    ?screenshotWebpAsset(assetPath),
    assetPath,
    ?fallbackAssetPath,
    ?screenshotWebpAsset(fallbackAssetPath ?? ''),
  ].whereType<String>().where((p) => p.isNotEmpty).toList();

  Widget buildAt(int index) {
    if (index >= paths.length) {
      return brokenPlaceholder ?? const ColoredBox(color: Color(0xFFE4E7EA));
    }
    return Image.asset(
      paths[index],
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      filterQuality: filterQuality,
      errorBuilder: (context, error, stackTrace) => buildAt(index + 1),
    );
  }

  return buildAt(0);
}
