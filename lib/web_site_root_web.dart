import 'package:web/web.dart' as web;

/// Navega para a raiz do site no **mesmo host** (`https://host/`), sem depender do `url_launcher`.
void navigateToSameOriginRoot() {
  final origin = web.window.location.origin;
  if (origin.isEmpty) return;
  web.window.location.href = '$origin/';
}
