
import 'dart:async';

import 'package:flutter/services.dart';

class MoonyNavBarFlutter {
  static const MethodChannel _channel =
      const MethodChannel('moony_nav_bar_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
