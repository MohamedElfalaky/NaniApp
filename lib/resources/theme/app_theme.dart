import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/resources/spacings/spacings.dart';
import 'package:parent_app/resources/styles/text_styles.dart';
import 'package:parent_app/resources/theme/components_theme.dart';

import '../colors/color_palette.dart';

extension on ThemeData {
  ThemeData setCommonThemeElements() => copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

ThemeData themeLight() => ThemeData(
      primaryTextTheme: TextTheme(),
      fontFamily: 'SF-Pro',
      brightness: Brightness.light,
      primaryColor: ColorPalette.primaryL,
      colorScheme: const ColorScheme.light(
          primary: ColorPalette.primaryL,
          onPrimary: ColorPalette.white,
          secondary: ColorPalette.grey02,
          onSecondary: ColorPalette.black,
          tertiary: ColorPalette.grey01,
          error: ColorPalette.cancelRed,
          onTertiary: ColorPalette.appGreen),
      primaryColorLight: ColorPalette.primaryLightL,
      primaryColorDark: ColorPalette.primaryDarkL,
      textTheme: TextTheme(
          headlineLarge: TextStyles.headline01Bol,
          headlineMedium: TextStyles.headLine02Medium,
          headlineSmall: TextStyles.headLine03Medium,
          labelSmall: TextStyles.disclamer12Regular,
          bodyLarge: TextStyles.body16Regulat),
      scaffoldBackgroundColor: ColorPalette.scaffoldColor,

      // scaffoldBackgroundColor: Color(0xffF2F3F7), // right color

      cardColor: ColorPalette.white,
      appBarTheme: AppBarTheme(
          toolbarHeight: 80.h,
          backgroundColor: ColorPalette.white,
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              color: ColorPalette.black,
              fontSize: 22,
              fontWeight: FontWeight.w700)),
      elevatedButtonTheme: ButtonsTheme.elevatedButtonTheme,
      outlinedButtonTheme: ButtonsTheme.outLinedButtonTheme,
      textButtonTheme: ButtonsTheme.textButtonTheme,
      inputDecorationTheme: InputDecorationsTheme.inputDecorationTheme,
      expansionTileTheme: ExpansionTileThemeData(
        childrenPadding: EdgeInsets.symmetric(horizontal: AppSpaces.padding_24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(width: 1, color: Colors.black12)),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(width: 1, color: Colors.black12)),
      ),
      dividerTheme: DividerThemeData(color: ColorPalette.grey01, thickness: 2),
      dialogTheme: DialogTheme(
        surfaceTintColor: ColorPalette.white,
        titleTextStyle:
            TextStyles.headline01Bol.copyWith(color: ColorPalette.black),
        contentTextStyle:
            TextStyles.body16Regulat.copyWith(color: Color(0xff71717A)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ColorPalette.white, elevation: 0),
    ).setCommonThemeElements();

ThemeData themeDark() => ThemeData(
      fontFamily: 'SF-Pro',
      brightness: Brightness.dark,
      primaryColor: ColorPalette.primaryD,
      colorScheme: const ColorScheme.dark(secondary: ColorPalette.accentD),
      scaffoldBackgroundColor: ColorPalette.primaryLightD,
      cardColor: ColorPalette.primaryDisabledD,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorPalette.black,
          backgroundColor: ColorPalette.accentD,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorPalette.accentD,
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorPalette.white,
        ),
      ),
    ).setCommonThemeElements();
