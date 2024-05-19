import 'dart:core';

import 'package:flutter/material.dart';

class ColorPalette {
  // Light Theme
  static const Color primaryL = Color(0xFF2C80E3);
  static const Color primaryLightL = Color(0xFFE2F2FF);
  static const Color primaryDarkL = Color(0xFF6693CC);
  static const Color grey01 = Color(0xFFEDEDED);
  static const Color grey02 = Colors.grey;
  static const Color primaryFilledTextFieldL = Color.fromRGBO(252, 252, 252, 1);
  static const Color appYellow = Color(0xffFFF0B0);
  static const Color appGreen = Color(0xff22C55E);
  static const Color cancelRed = Color(0xffEF4444);

  static const Color accentL = Color(0xFF03DAC6);
  static const Color scaffoldColor = Color(0xFFF2F3F7);

  // Dark Theme
  static const Color primaryD = Color(0xFF121212);
  static const Color primaryDarkD = Color(0xFF000000);
  static const Color primaryLightD = Color(0xFF383838);
  static const Color primaryDisabledD = Color(0x33121212);
  static const Color accentD = Color(0xFFbb86fc);

  static const Color backgroundLightGreen = Color(0xFFE2F0F1);
  static const Color backgroundLightGray = Color(0xFFF5F5F5);
  static const Color backgroundGray = Color(0xFFD8D8D8);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color textGray = Color(0xFF8E9094);
  static const Color errorColor = Colors.red;

  ColorPalette._();
}

Color colorFromHex(String code) {
  String colorString = code.replaceAll(RegExp('#'), '');
  print(int.parse(colorString, radix: 16) + 0xFF000000);
  return Color(int.parse(colorString, radix: 16) + 0xFF000000);
}
