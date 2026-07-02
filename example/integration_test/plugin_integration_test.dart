// Integration tests run inside a full Flutter application, so they exercise the
// real platform implementation of the plugin: shared_preferences on
// mobile/desktop and browser localStorage (via package:web) on the web.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_cookie_consent/flutter_cookie_consent_platform_interface.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('cookie preferences round-trip through platform storage',
      (WidgetTester tester) async {
    final platform = FlutterCookieConsentPlatform.instance;

    const preferences = <String, dynamic>{
      'essential': true,
      'analytics': true,
      'marketing': false,
    };

    await platform.saveCookiePreferences(preferences);
    final loaded = await platform.getCookiePreferences();

    expect(loaded, isNotNull);
    expect(loaded!['essential'], true);
    expect(loaded['analytics'], true);
    expect(loaded['marketing'], false);
  });
}
