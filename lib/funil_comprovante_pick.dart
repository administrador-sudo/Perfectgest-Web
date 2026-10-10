import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

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
  if (file.size > 2 * 1024 * 1024) {
    throw StateError('file_too_large');
  }
  final mime = file.type;
  if (mime != 'application/pdf' &&
      mime != 'image/jpeg' &&
      mime != 'image/png') {
    throw StateError('file_type');
  }
  final reader = web.FileReader();
  final loaded = Completer<String>();
  reader.addEventListener(
    'load',
    (web.Event _) {
      loaded.complete((reader.result as String?) ?? '');
    }.toJS,
  );
  reader.readAsDataURL(file);
  final dataUrl = await loaded.future;
  final i = dataUrl.indexOf('base64,');
  final b64 = i >= 0 ? dataUrl.substring(i + 7) : dataUrl;
  if (b64.isEmpty) throw StateError('file_type');
  return FunilComprovanteArquivo(nome: file.name, mime: mime, base64: b64);
}
