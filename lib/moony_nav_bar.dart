
import 'dart:async';

import 'package:flutter/services.dart';

class MoonyNavBar {
  static const MethodChannel _channel =
      const MethodChannel('moony_nav_bar');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
