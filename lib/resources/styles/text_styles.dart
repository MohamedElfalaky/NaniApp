import 'package:flutter/material.dart';

import '../colors/color_palette.dart';

final class TextStyles {
  TextStyles._();
  static var headline01Bol = TextStyle(
      fontFamily: 'Montserrat', fontSize: 22, fontWeight: FontWeight.w700);
  static var headLine02Medium =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static var headLine03Medium =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static var disclamer12Regular = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: ColorPalette.grey02);
  static var body16Regulat =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  //////////////////////////
  static const kSmallErrorTextStyle = TextStyle(
    fontSize: 10.0,
    color: Colors.red,
  );

  static const kGreyTextStyle = TextStyle(
    color: ColorPalette.textGray,
    fontSize: 12.0,
  );

  static const kWhiteSmallTextStyle = TextStyle(
    color: ColorPalette.white,
    fontSize: 12.0,
  );

  static const kMediumErrorTextStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.red,
  );

  static const kPrimaryLightSmallTextStyle = TextStyle(
    fontSize: 13.0,
    color: ColorPalette.primaryLightL,
  );

  static const kWhiteSmallBoldTextStyle = TextStyle(
    fontSize: 13.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const kDescriptionTextStyle = TextStyle(
    fontSize: 13.0,
    color: ColorPalette.primaryDarkL,
  );

  static const kPrimarySmallTextStyle = TextStyle(
    fontSize: 13.0,
    color: ColorPalette.primaryL,
    fontWeight: FontWeight.bold,
  );

  static const kAccentBoldSmallTextStyle = TextStyle(
    fontSize: 13.0,
    color: ColorPalette.accentL,
    fontWeight: FontWeight.bold,
  );

  static const kAccentBoldTextStyle = TextStyle(
    fontSize: 14.0,
    color: ColorPalette.accentL,
    fontWeight: FontWeight.bold,
  );

  static const kAccentTextStyle = TextStyle(
    fontSize: 14.0,
    color: ColorPalette.accentL,
  );

  static const kBlackSmallTextStyle = TextStyle(
    fontSize: 14.0,
    color: ColorPalette.black,
  );

  static const kBlackBoldSmallTextStyle = TextStyle(
    fontSize: 14.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
  );

  static const kPrimaryDarkBoldTextStyle = TextStyle(
    fontSize: 15.0,
    color: ColorPalette.primaryDarkL,
    fontWeight: FontWeight.bold,
  );

  static const kPrimaryWhiteTextStyle = TextStyle(
    fontSize: 15.0,
    color: ColorPalette.white,
  );

  static const kPrimaryDarkTextStyle = TextStyle(
    fontSize: 15.0,
    color: ColorPalette.primaryDarkL,
  );

  static const kInputFieldTextStyle = TextStyle(
    fontSize: 15.0,
    color: ColorPalette.primaryL,
    fontWeight: FontWeight.bold,
  );

  static const kDescriptionGrayTextStyle = TextStyle(
    fontSize: 16.0,
    color: ColorPalette.textGray,
  );

  static const kMediumWhiteButtonTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const kPrimaryTextStyle = TextStyle(
    fontSize: 16.0,
    color: ColorPalette.primaryL,
  );

  static const kPrimaryBoldTextStyle = TextStyle(
    fontSize: 16.0,
    color: ColorPalette.primaryL,
    fontWeight: FontWeight.bold,
  );

  static const kMediumAccentTextStyle = TextStyle(
    fontSize: 16.0,
    color: ColorPalette.accentL,
  );

  static const kBlackTextStyle = TextStyle(
    fontSize: 16.0,
    color: ColorPalette.black,
  );

  static const kWhiteTextStyle = TextStyle(
    fontSize: 16.0,
    color: ColorPalette.white,
  );

  static const kProfileDetailTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const kAppBarTextStyle = TextStyle(
    fontSize: 17.0,
    color: Colors.black,
  );

  static const kAppBarWhiteTextStyle = TextStyle(
    fontSize: 17.0,
    color: Colors.white,
  );

  static const kBlackBoldNameTextStyle = TextStyle(
    fontSize: 17.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
  );

  static const kPrimaryDarkHeadingTextStyle = TextStyle(
    fontSize: 20.0,
    color: ColorPalette.primaryDarkL,
    fontWeight: FontWeight.bold,
  );

  static const kButtonTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const kBlackBoldTextStyle = TextStyle(
    fontSize: 20.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
  );

  static const kBlackBoldHeadingTextStyle = TextStyle(
    fontSize: 20.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
  );

  static const kAccentButtonTextStyle = TextStyle(
    fontSize: 20.0,
    color: ColorPalette.accentL,
    fontWeight: FontWeight.bold,
  );

  static const kWhiteBoldTextStyle = TextStyle(
    fontSize: 20.0,
    color: ColorPalette.white,
    fontWeight: FontWeight.bold,
  );

  static const kWhiteBoldNameTextStyle = TextStyle(
    fontSize: 20.0,
    color: ColorPalette.white,
    fontWeight: FontWeight.bold,
  );

  static const kPrimaryLargeTextStyle = TextStyle(
    fontSize: 22.0,
    color: ColorPalette.primaryL,
  );

  static const kPrimaryLargeBoldTextStyle = TextStyle(
    fontSize: 22.0,
    color: ColorPalette.primaryL,
    fontWeight: FontWeight.bold,
  );

  static const kBlackLargeBoldTextStyle = TextStyle(
    fontSize: 22.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
  );

  static const kBlackTitleTextStyle = TextStyle(
    fontSize: 24.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.w900,
  );

  static const kWhiteBoldLargeTextStyle = TextStyle(
    fontSize: 24.0,
    color: ColorPalette.white,
    fontWeight: FontWeight.bold,
  );

  static const kBlackNameHeadingTextStyle = TextStyle(
    fontSize: 24.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.w900,
  );

  static const kPrimaryDarkLargeHeadingTextStyle = TextStyle(
    fontSize: 30.0,
    color: ColorPalette.primaryDarkL,
    fontWeight: FontWeight.bold,
  );

  static const kPrimaryHeadingTextStyle = TextStyle(
    fontSize: 30.0,
    color: ColorPalette.primaryL,
    fontWeight: FontWeight.bold,
  );

  static const kGrayHeadingTextStyle = TextStyle(
    fontSize: 30.0,
    color: ColorPalette.textGray,
    fontWeight: FontWeight.bold,
  );

  static const kBlackHeadingTextStyle = TextStyle(
    fontSize: 30.0,
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
  );

  static const kWhiteHeaderBoldTextStyle = TextStyle(
    fontSize: 30.0,
    color: ColorPalette.white,
    fontWeight: FontWeight.bold,
  );

  static const kWhiteHeaderTextStyle = TextStyle(
    fontSize: 30.0,
    color: ColorPalette.white,
    fontWeight: FontWeight.w900,
  );
}
