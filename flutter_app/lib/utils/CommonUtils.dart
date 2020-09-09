import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

class CommonUtils {
  static toast(String msg) {
    Fluttertoast.showToast(msg: msg, fontSize: 14);
  }

  static double _navigationBarHeight = 44.0;
  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _statusBarHeight = 0.0;
  static double _bottomEdgeInset = 0.0;
  static double _pixelRatio = 1.0;

  static void setup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _screenWidth = screenSize.width;
    _screenHeight = screenSize.height;
    _statusBarHeight = MediaQuery.of(context).padding.top;
    _bottomEdgeInset = MediaQuery.of(context).padding.bottom;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
  }

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
  static double get statusBarHeight => _statusBarHeight;
  static double get navigationBarHeight => _navigationBarHeight;
  static double get appBarHeight => _navigationBarHeight + _statusBarHeight;
  static double get bottomEdgeInset => _bottomEdgeInset;
  static double get pixelRatio => _pixelRatio;
  static double get onePixel => 1 / _pixelRatio;

  /// 以 iPhone 6 屏幕宽度(物理像素750px，逻辑像素375)为基准进行缩放
  static double hotelR(double value) {
    final newValue = value * screenWidth / 375;
    return newValue.ceilToDouble();
  }

  ///IOS 平台
  static bool isIOS() {
    return Platform.isIOS;
  }

  ///android平台
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  ///是否空字符串
  static bool isEmptyString(String str) {
    return str?.isEmpty ?? true;
  }

  /// 是否为非空字符串
  static bool isNotEmptyString(String str) {
    if (str == null || str is String == false) {
      return false;
    }

    return str.isNotEmpty;
  }

  ///是否空List
  static bool isEmptyList(List list) {
    return list?.isEmpty ?? true;
  }

  ///是否空map
  static bool isEmptyMap(Map map) {
    return map?.isEmpty ?? true;
  }

  ///返回当前时间戳
  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch; //单位毫秒，13位时间戳
  }
}
