import 'package:flutter/material.dart';

import '../colors/color_palette.dart';

final class ButtonsTheme {
  ButtonsTheme._();

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        disabledBackgroundColor: ColorPalette.grey01,
        textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat'),
        foregroundColor: ColorPalette.white,
        backgroundColor: ColorPalette.primaryL,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12)),
  );
  static OutlinedButtonThemeData outLinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat'),
        side: const BorderSide(color: ColorPalette.primaryL, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12)),
  );
  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
    ),
  );
}

final class InputDecorationsTheme {
  InputDecorationsTheme._();

  static InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
    isDense: true,
    filled: true,
    // contentPadding: EdgeInsets.all(16),
    fillColor: ColorPalette.primaryFilledTextFieldL,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: ColorPalette.primaryL)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: ColorPalette.grey02)),
    labelStyle: TextStyle(color: ColorPalette.grey02),
    floatingLabelStyle: TextStyle(color: ColorPalette.primaryL),
    hintStyle: TextStyle(color: ColorPalette.grey02, fontSize: 16),
    suffixIconColor: ColorPalette.primaryL,

    suffixStyle: TextStyle(color: ColorPalette.primaryL),
  );
}
