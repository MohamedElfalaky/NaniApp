import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:parent_app/feature/settings/preferences_helper.dart';
import 'package:single_item_shared_prefs/single_item_shared_prefs.dart';
import 'package:single_item_storage/storage.dart';

final GetIt serviceLocator = GetIt.asNewInstance();

// GlobalKey
final GlobalKey<ScaffoldMessengerState> appGloballKey = GlobalKey<
    ScaffoldMessengerState>(); // used to get global context (mainly with translation)

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// Storage constants
const String preferredLocalizationKey = 'preferred-language';
const String preferredThemeModeKey = 'preferred-theme-mode';

// Build Version
const String buildVersionKey = 'build-version-key';

Future<void> setupGlobalDependencies() async {
  final PreferencesHelper preferences = PreferencesHelper();

  // Build version
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final String buildVersion =
      'Build version ${packageInfo.version} (${packageInfo.buildNumber})';

  serviceLocator
    ..registerSingleton<PreferencesHelper>(preferences)

    // ..registerSingleton<Storage<UserCredentials>>(userStorage)
    // ..registerSingleton<UserApiService>(userApi)
    // ..registerSingleton<UserManager>(userManager)
    // ..registerSingleton<AppLifecycleObserver>(appLifecycleObserver)
    ..registerSingleton<String>(buildVersion, instanceName: buildVersionKey)
    ..registerLazySingleton<Storage<String>>(
        () => SharedPrefsStorage<String>.primitive(
            itemKey: preferredLocalizationKey),
        instanceName: preferredLocalizationKey)
    ..registerLazySingleton<Storage<bool>>(
        () =>
            SharedPrefsStorage<bool>.primitive(itemKey: preferredThemeModeKey),
        instanceName: preferredThemeModeKey);
}

// Future<void> teardown() async {
//   try {
//     await serviceLocator.get<UserManager>().teardown();
//   } catch (exp) {}
// }
