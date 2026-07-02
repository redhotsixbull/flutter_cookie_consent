#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_cookie_consent.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_cookie_consent'
  s.version          = '1.1.0'
  s.summary          = 'A Flutter package for GDPR-compliant cookie consent banners and privacy preferences.'
  s.description      = <<-DESC
A Flutter package for implementing GDPR-compliant cookie consent banners and privacy preferences.
                       DESC
  s.homepage         = 'https://github.com/redhotsixbull/flutter_cookie_consent'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'redhotsixbull' => 'ccomekdj@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_cookie_consent/Sources/flutter_cookie_consent/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # This plugin ships a privacy manifest describing its (empty) required-reason
  # API usage. See https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  s.resource_bundles = {'flutter_cookie_consent_privacy' => ['flutter_cookie_consent/Sources/flutter_cookie_consent/PrivacyInfo.xcprivacy']}
end
