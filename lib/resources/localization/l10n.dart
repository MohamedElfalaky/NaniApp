import 'dart:ui';

import 'package:flutter/material.dart';

final class Localization {
  static const en = Locale('en');
  static const ar = Locale('ar');

  static Locale getLocale(String code) {
    switch (code) {
      case 'ar':
        return ar;
      case 'en':
      default:
        return en;
    }
  }
}
