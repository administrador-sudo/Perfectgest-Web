import 'package:web/web.dart' as web;

bool printOrcamentoHtml(String html) {
  try {
    web.document.getElementById('pg-orcamento-print')?.remove();
    final iframe = web.HTMLIFrameElement()..id = 'pg-orcamento-print';
    iframe.style
      ..setProperty('position', 'fixed')
      ..setProperty('left', '-10000px')
      ..setProperty('top', '0')
      ..setProperty('width', '210mm')
      ..setProperty('height', '297mm')
      ..setProperty('border', '0');
    var printed = false;
    iframe.onLoad.listen((_) {
      if (printed) return;
      final doc = iframe.contentDocument;
      if (doc == null || doc.querySelector('.sheet') == null) return;
      printed = true;
      iframe.contentWindow?.print();
    });
    web.document.body?.append(iframe);
    iframe.setAttribute('srcdoc', html);
    return true;
  } catch (_) {
    return false;
  }
}
