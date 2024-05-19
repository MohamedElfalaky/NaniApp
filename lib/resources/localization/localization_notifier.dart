import 'package:flutter/material.dart';
import 'package:parent_app/di/service_locator.dart';
import 'package:parent_app/feature/settings/preferences_helper.dart';

import 'l10n.dart';

class LocalizationNotifier extends ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  LocalizationNotifier(String storedLanguageCode) {
    _locale = Localization.getLocale(storedLanguageCode);
  }

  Future<void> setLocale(String languageCode) async {
    _locale = Localization.getLocale(languageCode);
    await serviceLocator
        .get<PreferencesHelper>()
        .setPreferredLanguage(_locale.languageCode);
    notifyListeners();
  }

  Future<void> clearLocale() async {
    _locale = Localization.getLocale('en');
    await serviceLocator
        .get<PreferencesHelper>()
        .setPreferredLanguage(_locale.languageCode);
    notifyListeners();
  }
}
