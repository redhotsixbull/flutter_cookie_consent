import Flutter
import UIKit

public class FlutterCookieConsentPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_cookie_consent", binaryMessenger: registrar.messenger())
    let instance = FlutterCookieConsentPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getCookiePreferences":
      result(nil)
    case "saveCookiePreferences":
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
