import 'package:parent_app/config/connection_config.dart';
import 'package:parent_app/di/service_locator.dart';
import 'package:parent_app/feature/settings/cache_services.dart';
import 'package:parent_app/feature/settings/preferences_helper.dart';

import '../di/service_locator.dart' as service_locator_conf;

import 'package:flutter/widgets.dart';

/// Configuration that needs to be done before the Flutter app starts goes here.
///
/// To minimize the app loading time keep this setup fast and simple.
Future<void> preAppConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await configureFirebase();
  // initLogger();

  await service_locator_conf.setupGlobalDependencies();
  // await serviceLocator.get<LocalNotificationsManager>().init();
  // await serviceLocator.get<UserManager>().init();
  await ConnectionConfig.instance.init();
  await CacheServices.instance.init();

  await serviceLocator.get<PreferencesHelper>().init();
}
