import 'package:web/web.dart' as web;

bool printOrcamentoHtml(String html) {
  try {
    web.document.getElementById('pg-orcamento-print')?.remove();
    final iframe = web.HTMLIFrameElement()..id = 'pg-orcamento-print';
    iframe.style
      ..setProperty('position', 'fixed')
      ..setProperty('right', '0')
      ..setProperty('bottom', '0')
      ..setProperty('width', '0')
      ..setProperty('height', '0')
      ..setProperty('border', '0');
    iframe.onLoad.listen((_) {
      iframe.contentWindow?.print();
    });
    web.document.body?.append(iframe);
    iframe.setAttribute('srcdoc', html);
    return true;
  } catch (_) {
    return false;
  }
}
