import Flutter
import UIKit

public class SwiftMoonyNavBarFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "moony_nav_bar_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftMoonyNavBarFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
