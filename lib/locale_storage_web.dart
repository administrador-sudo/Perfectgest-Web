import 'package:web/web.dart' as web;

const String _kKey = 'pp_locale';

String? readStoredLocaleTag() {
  try {
    final v = web.window.localStorage.getItem(_kKey);
    if (v == null || v.isEmpty) return null;
    return v;
  } catch (_) {
    return null;
  }
}

void writeStoredLocaleTag(String? tag) {
  try {
    if (tag == null || tag.isEmpty) {
      web.window.localStorage.removeItem(_kKey);
    } else {
      web.window.localStorage.setItem(_kKey, tag);
    }
  } catch (_) {}
}
