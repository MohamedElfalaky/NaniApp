import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/config/post_app_config.dart';
import 'package:parent_app/config/pre_app_config.dart';
import 'package:parent_app/di/service_locator.dart';
import 'package:parent_app/feature/settings/preferences_helper.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/generated/l10n.dart';
import 'package:parent_app/resources/localization/localization_notifier.dart';
import 'package:parent_app/resources/theme/app_theme.dart';
import 'package:parent_app/resources/theme/theme_change_notifier.dart';
import 'package:provider/provider.dart';

import './resources/localization/l10n.dart';

void main() async {
  await preAppConfig();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocalizationNotifier _localizationNotifier;
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    _localizationNotifier = LocalizationNotifier(
        serviceLocator.get<PreferencesHelper>().languagePreferred);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    postAppConfig();
  }

  @override
  Widget build(BuildContext context) {
    // final router = goRouter();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChangeNotifier>(
          create: (context) =>
              serviceLocator.get<PreferencesHelper>().themePreferred,
        ),
        ChangeNotifierProvider<LocalizationNotifier>(
          create: (context) => _localizationNotifier,
        ),
      ],
      child: Consumer2<LocalizationNotifier, ThemeChangeNotifier>(
          builder: (context, localeObject, themeObject, _) {
        return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp.router(
              scaffoldMessengerKey: appGloballKey,

              themeAnimationStyle: AnimationStyle(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                reverseCurve: Curves.fastEaseInToSlowEaseOut,
                reverseDuration: const Duration(milliseconds: 200),
              ),
              theme: themeLight(),
              darkTheme: themeDark(),
              themeMode: ThemeMode.light,
              // themeMode: themeObject.getThemeMode,
              localizationsDelegates: const [
                L10n.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: localeObject.locale,
              supportedLocales: const [Localization.en, Localization.ar],
              debugShowCheckedModeBanner: false,
              title: 'parent app',
              routerConfig: AppRouter.goRouter,

              // home: const RegistrationPage(),
            );
          },
        );
      }),
    );
  }
}
