import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPlugin_a {
  static const MethodChannel _channel = const MethodChannel('flutter_plugin_a');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 弹出 Toast
  /// [message] Toast 的内容
  static Future<void> showToast({String message}) async {
    await _channel.invokeMethod("showToast", message);
  }
}
