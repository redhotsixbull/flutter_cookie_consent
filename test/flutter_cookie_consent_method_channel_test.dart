import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cookie_consent/flutter_cookie_consent_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MethodChannelFlutterCookieConsent platform =
      MethodChannelFlutterCookieConsent();

  setUp(() {
    // The mobile/desktop implementation persists preferences through
    // shared_preferences, so provide an in-memory backend for the test.
    SharedPreferences.setMockInitialValues({});
  });

  test('getCookiePreferences returns an empty map when nothing is stored',
      () async {
    final preferences = await platform.getCookiePreferences();
    expect(preferences, isEmpty);
  });

  test('saveCookiePreferences persists and getCookiePreferences reads back',
      () async {
    final saved = {
      'essential': true,
      'analytics': true,
      'marketing': false,
    };

    await expectLater(platform.saveCookiePreferences(saved), completes);

    final preferences = await platform.getCookiePreferences();
    expect(preferences, isNotNull);
    expect(preferences!['essential'], true);
    expect(preferences['analytics'], true);
    expect(preferences['marketing'], false);
  });
}
