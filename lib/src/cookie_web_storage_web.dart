import 'package:web/web.dart' as web;

/// Web implementation of the browser localStorage backend, built on the
/// standards-based `package:web` (the modern replacement for `dart:html`).
String? readLocalStorage(String key) => web.window.localStorage.getItem(key);

void writeLocalStorage(String key, String value) =>
    web.window.localStorage.setItem(key, value);
