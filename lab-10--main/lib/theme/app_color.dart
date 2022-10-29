import 'package:flutter/material.dart';

class AppColors {
  static Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static final Color white = _colorFromHex('#FFFFFF');
  static final Color red = _colorFromHex('#dd2020');
  static final Color blue = _colorFromHex('#46B5F6');
  static final Color yellow = _colorFromHex('#FFFF00');
  static final Color green = _colorFromHex('#32CD30');

  static final List<Color> redAndBlue = [
    red,
    blue,
  ];
  static final List<Color> reinbow = [
    blue,
    yellow,
    green,
    red,
  ];
}
