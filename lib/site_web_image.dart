import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// URL absoluta respeitando `<base href>` (Flutter Web).
String siteWebRootUrl(String webRelativePath) {
  final clean = webRelativePath.startsWith('/')
      ? webRelativePath.substring(1)
      : webRelativePath;
  return Uri.base.resolve(clean).toString();
}

/// Web: ficheiro em [web/] na raiz do site. Outras plataformas: [assetPath].
Widget siteWebOrAssetImage({
  required String assetPath,
  required String webPath,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  Alignment alignment = Alignment.center,
  FilterQuality filterQuality = FilterQuality.medium,
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
}) {
  if (kIsWeb) {
    return Image.network(
      siteWebRootUrl(webPath),
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      filterQuality: filterQuality,
      webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
      errorBuilder: (context, error, stackTrace) {
        if (kDebugMode) {
          debugPrint('siteWebOrAssetImage web falhou ($webPath): $error');
        }
        return Image.asset(
          assetPath,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          filterQuality: filterQuality,
          errorBuilder: errorBuilder,
        );
      },
    );
  }

  return Image.asset(
    assetPath,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    filterQuality: filterQuality,
    errorBuilder: errorBuilder,
  );
}
