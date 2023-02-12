import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;

  static double profileDrawerWidth = 0;
  static double refHeight = 0;
  static double refWidth = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    refHeight = 812;
    refWidth = 375;

    if (screenHeight < 1200) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;
    }
  }

  static double getWidthRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = res * blockSizeHorizontal;

    return temp;
  }

  static double getHeightRatio(double val) {
    double res = (val / refHeight) * 100;
    double temp = res * blockSizeVertical;
    return temp;
  }

  static double getFontRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = 0.0;
    if (screenWidth < screenHeight) {
      temp = res * safeBlockHorizontal;
    } else {
      temp = res * safeBlockVertical;
    }

    return temp;
  }
}

extension SizeUtils on num {
  double get toWidth => SizeConfig.getWidthRatio(toDouble());

  double get toHeight => SizeConfig.getHeightRatio(toDouble());

  double get toFont => SizeConfig.getFontRatio(toDouble());
}
