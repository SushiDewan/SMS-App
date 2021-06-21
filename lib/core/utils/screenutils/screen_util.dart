import 'dart:ui' as ui;

import 'dart:math';

import 'package:flutter/material.dart';

part 'size_extension.dart';
part 'size_constants.dart';


class ScreenUtil {
  static const Size defaultSize = Size(360, 690);
  static ScreenUtil _instance;

  Size uiSize;

  bool allowFontScaling;

  static double _pixelRatio;
  static double _textScaleFactor;
  static double _screenWidth;
  static double _screenHeight;
  static double _statusBarHeight;
  static double _bottomBarHeight;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  static void init(
    BoxConstraints constraints,
    Orientation orientation, {
    Size designSize = defaultSize,
    bool allowFontScaling = false,
  }) {
    _instance = ScreenUtil._();
    _instance
      ..uiSize = designSize
      ..allowFontScaling = allowFontScaling;
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    var window = WidgetsBinding.instance?.window ?? ui.window;
    _pixelRatio = window.devicePixelRatio;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  double get textScaleFactor => _textScaleFactor;

  double get pixelRatio => _pixelRatio;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  double get statusBarHeight => _statusBarHeight / _pixelRatio;

  double get bottomBarHeight => _bottomBarHeight / _pixelRatio;

  double get scaleWidth => _screenWidth / uiSize.width;

  double get scaleHeight => _screenHeight / uiSize.height;

  double get scaleText => min(scaleWidth, scaleHeight);

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double radius(num r) => r * scaleText;

  double setSp(num fontSize, {bool allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText) * _textScaleFactor
              : (fontSize * scaleText))
          : (allowFontScalingSelf
              ? (fontSize * scaleText) * _textScaleFactor
              : (fontSize * scaleText));
}
