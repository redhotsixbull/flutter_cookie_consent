/// Non-web stub for the browser localStorage backend.
///
/// The web implementation of the plugin is only ever constructed on the web
/// (guarded by `kIsWeb`), so these functions are never called at runtime on
/// other platforms. They exist so that `flutter_cookie_consent_web.dart` can be
/// imported on the Dart VM (e.g. during unit tests) without pulling in
/// `package:web`, which is web-only.
String? readLocalStorage(String key) => null;

void writeLocalStorage(String key, String value) {}
