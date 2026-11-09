import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Descarrega `.ics` no browser (Blob + âncora download).
void downloadBarberIcs(String content, String filename) {
  final parts = <JSAny>[content.toJS].toJS;
  final blob = web.Blob(
    parts,
    web.BlobPropertyBag(type: 'text/calendar;charset=utf-8'),
  );
  final url = web.URL.createObjectURL(blob);
  final a = web.HTMLAnchorElement()
    ..href = url
    ..download = filename;
  web.document.body?.append(a);
  a.click();
  a.remove();
  web.URL.revokeObjectURL(url);
}
