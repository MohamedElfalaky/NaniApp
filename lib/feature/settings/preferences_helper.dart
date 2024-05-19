import 'dart:ui';

import 'package:parent_app/di/service_locator.dart';
import 'package:single_item_storage/storage.dart';
import '../../resources/theme/theme_change_notifier.dart';

class PreferencesHelper {
  late ThemeChangeNotifier themePreferred;
  late String languagePreferred;

  /// Initializes fields if they are stored previously,
  /// call this method before using any fields from this class
  init() async {
    languagePreferred = await _getPreferredLanguage();
    themePreferred = await _getPreferredTheme();
  }

  Future<void> setPreferredLanguage(String currentLanguage) async {
    await serviceLocator
        .get<Storage<String>>(instanceName: preferredLocalizationKey)
        .save(currentLanguage);
    languagePreferred = currentLanguage;
  }

  Future<void> setIsDarkThemePreferred(bool isDarkThemePreferred) async {
    await serviceLocator
        .get<Storage<bool>>(instanceName: preferredThemeModeKey)
        .save(isDarkThemePreferred);
    themePreferred = isDarkThemePreferred == true
        ? ThemeChangeNotifier.darkTheme()
        : ThemeChangeNotifier.lightTheme();
  }

  Future<String> _getPreferredLanguage() async {
    // final systemLocale = WidgetsBinding.instance.window.locales.first;
    final systemLocale = PlatformDispatcher.instance.locales.first;
    final storedLanguageCode = await serviceLocator
        .get<Storage<String>>(instanceName: preferredLocalizationKey)
        .get();

    return storedLanguageCode ?? systemLocale.languageCode;
  }

  Future<ThemeChangeNotifier> _getPreferredTheme() async {
    final bool? storedThemeMode = await serviceLocator
        .get<Storage<bool>>(instanceName: preferredThemeModeKey)
        .get();

    if (storedThemeMode == null) return ThemeChangeNotifier.lightTheme();
    return storedThemeMode == true
        ? ThemeChangeNotifier.darkTheme()
        : ThemeChangeNotifier.lightTheme();
  }
}
