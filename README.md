# Flutter Cookie Consent

[![pub package](https://img.shields.io/pub/v/flutter_cookie_consent.svg)](https://pub.dev/packages/flutter_cookie_consent)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A Flutter plugin for displaying cookie consent banners and managing cookie preferences in your Flutter applications. This plugin helps you comply with GDPR, CCPA, and other privacy regulations by providing a customizable cookie consent solution.

## Features

- Display customizable cookie consent banners
- Support for multiple cookie categories (Essential, Analytics, Marketing)
- Customizable banner position (top or bottom)
- Settings dialog for detailed cookie preferences
- Persistent storage of user preferences
- Web platform implementation
- Accessibility support

## Platform Support

| Platform | Support |
|----------|---------|
| Web      | ✅      |
| Android  | ✅      |
| iOS      | ✅      |
| Windows  | ❌      |
| macOS    | ❌      |
| Linux    | ❌      |

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_cookie_consent: ^1.0.0
```

Then run:
```bash
flutter pub get
```

### Flutter Version Compatibility

| Flutter Version | Package Version |
|----------------|-----------------|
| >=3.3.0        | ^1.0.0         |

## Usage

### Example Project
Here's a simple example showing how to use the `createBanner` method to display a cookie consent banner:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_cookie_consent/flutter_cookie_consent.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterCookieConsent _cookieConsent = FlutterCookieConsent();
  late final Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = _cookieConsent.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _initFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return Stack(
              children: [
                // Your app content
                const Center(
                  child: Text('Welcome to our app!'),
                ),
                // Cookie consent banner
                _cookieConsent.createBanner(
                  context: context,
                  title: 'Cookie Settings',
                  message: 'We use cookies to enhance your browsing experience...',
                  acceptButtonText: 'Accept',
                  declineButtonText: 'Decline',
                  settingsButtonText: 'Settings',
                  showSettings: true,
                  position: BannerPosition.top,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
```

### Basic Usage

The following is a minimal implementation that you can use with the example code above:

```dart
import 'package:flutter_cookie_consent/flutter_cookie_consent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CookieConsentBanner(
          title: 'Cookie Consent',
          message: 'We use cookies to enhance your experience...',
          acceptButtonText: 'Accept All',
          declineButtonText: 'Decline',
          settingsButtonText: 'Settings',
        ),
      ),
    );
  }
}

### Advanced Usage

You can also customize the banner with more options. Here's an example that you can integrate with the main example code:

```dart
CookieConsentBanner(
  title: 'Cookie Consent',
  message: 'We use cookies to enhance your experience...',
  acceptButtonText: 'Accept All',
  declineButtonText: 'Decline',
  settingsButtonText: 'Settings',
  showSettings: true,
  position: BannerPosition.bottom,
  style: CookieConsentStyle(
    backgroundColor: Colors.white,
    textColor: Colors.black,
    buttonColor: Colors.blue,
    buttonTextColor: Colors.white,
    borderRadius: 8.0,
    padding: const EdgeInsets.all(16.0),
  ),
  categories: [
    CookieCategory(
      id: 'essential',
      title: 'Essential',
      description: 'Required for the website to function',
      isRequired: true,
    ),
    CookieCategory(
      id: 'analytics',
      title: 'Analytics',
      description: 'Help us understand how visitors interact',
    ),
    CookieCategory(
      id: 'marketing',
      title: 'Marketing',
      description: 'Used for advertising purposes',
    ),
  ],
  onAccept: (Map<String, bool> preferences) {
    // Handle accept
    print('Accepted preferences: $preferences');
  },
  onDecline: (Map<String, bool> preferences) {
    // Handle decline
    print('Declined preferences: $preferences');
  },
  onSettings: () {
    // Handle settings
    print('Settings opened');
  },
);
```

### Checking Consent Status

You can check the consent status in your app like this:

```dart
final cookieConsent = FlutterCookieConsent();

// Check if user has given consent
if (cookieConsent.hasConsent) {
  final preferences = cookieConsent.preferences;
  // Use preferences to determine which cookies to set
}

// Check if banner should be shown
if (cookieConsent.shouldShowBanner) {
  // Show banner
}
```

These examples can be integrated with the main example code to create a complete cookie consent solution for your app.

## API Reference

### FlutterCookieConsent

The main class for managing cookie consent.

#### Methods

- `initialize()`: Initialize the cookie consent manager
- `savePreferences(Map<String, bool> preferences)`: Save user cookie preferences
- `createBanner({...})`: Create a cookie consent banner
- `resetPreferences()`: Reset all cookie preferences
- `getPreferences()`: Get current cookie preferences
- `setLanguage(String languageCode)`: Set the language for the banner

#### Properties

- `hasConsent`: Check if user has given consent
- `preferences`: Get current cookie preferences
- `shouldShowBanner`: Check if banner should be shown
- `isInitialized`: Check if the consent manager is initialized

### BannerPosition

Enum for specifying banner position:
- `BannerPosition.top`: Display banner at the top of the screen
- `BannerPosition.bottom`: Display banner at the bottom of the screen

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
