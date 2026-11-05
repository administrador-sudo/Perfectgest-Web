import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

const int _kMaxArquivoBytes = 2 * 1024 * 1024;
const int _kAlvoImagemBytes = 400 * 1024;
const int _kMaxLadoPx = 1600;

class FunilComprovanteArquivo {
  const FunilComprovanteArquivo({
    required this.nome,
    required this.mime,
    required this.base64,
  });

  final String nome;
  final String mime;
  final String base64;
}

Future<FunilComprovanteArquivo?> escolherComprovanteFunil() async {
  final input = web.HTMLInputElement()
    ..type = 'file'
    ..accept = '.pdf,.jpg,.jpeg,.png,application/pdf,image/jpeg,image/png';
  final chosen = Completer<web.File?>();
  input.addEventListener(
    'change',
    (web.Event _) {
      chosen.complete(input.files?.item(0));
    }.toJS,
  );
  input.click();
  final file = await chosen.future;
  if (file == null) return null;
  if (file.size > _kMaxArquivoBytes) {
    throw StateError('file_too_large');
  }
  final mime = file.type;
  if (mime != 'application/pdf' &&
      mime != 'image/jpeg' &&
      mime != 'image/png') {
    throw StateError('file_type');
  }
  if (mime == 'application/pdf') {
    final b64 = _base64DeDataUrl(await _lerDataUrl(file));
    return FunilComprovanteArquivo(nome: file.name, mime: mime, base64: b64);
  }
  final compacto = await _imagemParaEnvio(file, mime);
  return FunilComprovanteArquivo(
    nome: compacto.mime == 'image/jpeg' ? _nomeJpeg(file.name) : file.name,
    mime: compacto.mime,
    base64: compacto.base64,
  );
}

String _nomeJpeg(String nome) {
  final i = nome.lastIndexOf('.');
  if (i <= 0) return '$nome.jpg';
  return '${nome.substring(0, i)}.jpg';
}

String _base64DeDataUrl(String dataUrl) {
  final i = dataUrl.indexOf('base64,');
  final b64 = i >= 0 ? dataUrl.substring(i + 7) : dataUrl;
  if (b64.isEmpty) throw StateError('file_type');
  return b64;
}

int _bytesAproxBase64(String b64) => (b64.length * 3) ~/ 4;

Future<String> _lerDataUrl(web.File file) async {
  final reader = web.FileReader();
  final loaded = Completer<String>();
  reader.addEventListener(
    'load',
    (web.Event _) {
      final r = reader.result;
      loaded.complete(r != null && r.isA<JSString>() ? (r as JSString).toDart : '');
    }.toJS,
  );
  reader.readAsDataURL(file);
  return loaded.future;
}

Future<({String mime, String base64})> _imagemParaEnvio(web.File file, String mime) async {
  final originalB64 = _base64DeDataUrl(await _lerDataUrl(file));
  if (file.size <= _kAlvoImagemBytes) {
    return (mime: mime, base64: originalB64);
  }
  try {
    final jpegB64 = await _canvasJpeg(file);
    if (jpegB64 == null) return (mime: mime, base64: originalB64);
    if (_bytesAproxBase64(jpegB64) >= file.size) {
      return (mime: mime, base64: originalB64);
    }
    return (mime: 'image/jpeg', base64: jpegB64);
  } catch (_) {
    return (mime: mime, base64: originalB64);
  }
}

Future<String?> _canvasJpeg(web.File file) async {
  final blobUrl = web.URL.createObjectURL(file);
  try {
    final img = web.document.createElement('img') as web.HTMLImageElement;
    final done = Completer<void>();
    img.addEventListener('load', ((web.Event _) => done.complete()).toJS);
    img.addEventListener(
      'error',
      ((web.Event _) => done.completeError(StateError('file_type'))).toJS,
    );
    img.src = blobUrl;
    await done.future.timeout(const Duration(seconds: 12));
    var w = img.naturalWidth;
    var h = img.naturalHeight;
    if (w < 1 || h < 1) return null;
    if (w > _kMaxLadoPx || h > _kMaxLadoPx) {
      final scale = _kMaxLadoPx / (w > h ? w : h);
      w = (w * scale).round();
      h = (h * scale).round();
    }
    final canvas = web.document.createElement('canvas') as web.HTMLCanvasElement;
    canvas.width = w;
    canvas.height = h;
    final ctx = canvas.getContext('2d');
    if (ctx == null) return null;
    final c2d = ctx as web.CanvasRenderingContext2D;
    c2d.drawImage(img, 0, 0, w, h);
    var q = 0.82;
    String? best;
    for (var i = 0; i < 6; i++) {
      final dataUrl = canvas.toDataURL('image/jpeg', q.toJS);
      final b64 = _base64DeDataUrl(dataUrl);
      best = b64;
      if (_bytesAproxBase64(b64) <= _kAlvoImagemBytes || q <= 0.45) break;
      q -= 0.08;
    }
    return best;
  } finally {
    web.URL.revokeObjectURL(blobUrl);
  }
}
