import 'dart:convert';

import 'package:flutter/foundation.dart';

// Use the standards-based package:web backend on web, and a no-op stub
// elsewhere so this file can still be imported on the Dart VM (e.g. in tests).
import 'src/cookie_web_storage_stub.dart'
    if (dart.library.ui_web) 'src/cookie_web_storage_web.dart';
// Use typed Registrar on web, empty stub on other platforms (e.g., tests)
import 'src/web_registrar_stub.dart'
    if (dart.library.ui_web) 'src/web_registrar_real.dart';

import 'flutter_cookie_consent_platform_interface.dart';

/// A web implementation of the FlutterCookieConsentPlatform of the FlutterCookieConsent plugin.
class FlutterCookieConsentWeb extends FlutterCookieConsentPlatform {
  static const String _storageKey = 'flutter_cookie_consent_preferences';

  /// Constructs a FlutterCookieConsentWeb
  FlutterCookieConsentWeb();

  static void registerWith(Registrar registrar) {
    FlutterCookieConsentPlatform.instance = FlutterCookieConsentWeb();
  }

  @override
  Future<Map<String, dynamic>?> getCookiePreferences() async {
    try {
      final preferences = readLocalStorage(_storageKey);
      if (preferences == null) {
        debugPrint('No cookie preferences found in local storage');
        return null;
      }

      try {
        return Map<String, dynamic>.from(
          const JsonDecoder().convert(preferences) as Map,
        );
      } on FormatException catch (e) {
        debugPrint('Error parsing cookie preferences: ${e.message}');
        return null;
      }
    } on Exception catch (e) {
      debugPrint('Error accessing local storage: $e');
      return null;
    }
  }

  @override
  Future<void> saveCookiePreferences(Map<String, dynamic> preferences) async {
    try {
      final jsonString = const JsonEncoder().convert(preferences);
      writeLocalStorage(_storageKey, jsonString);
    } on Exception catch (e) {
      debugPrint('Error saving cookie preferences: $e');
      rethrow;
    }
  }
}
