import 'dart:js_interop';

import 'package:web/web.dart' as web;

@JS('Function')
external JSFunction _jsFun(String args, String body);

const String _printOnceScript = r'''
<script>
(function () {
  function go() {
    try { window.focus(); window.print(); } catch (e) {}
  }
  if (document.readyState === 'complete') go();
  else window.addEventListener('load', go, { once: true });
})();
</script>
''';

bool printOrcamentoHtml(String html) {
  try {
    web.document.getElementById('pg-orcamento-print')?.remove();
    final win = web.window.open('', '_blank');
    if (win == null) return false;
    final payload = html.contains('</body>')
        ? html.replaceFirst('</body>', '$_printOnceScript</body>')
        : '$html$_printOnceScript';
    _jsFun('w,h', 'w.document.open();w.document.write(h);w.document.close();')
        .callAsFunction(null, win, payload.toJS);
    return true;
  } catch (_) {
    return false;
  }
}
