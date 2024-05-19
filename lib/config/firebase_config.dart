// import 'dart:async';

// // import 'package:faalyat/log/log.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';

// import 'firebase_options.dart';
// import 'flavor_config.dart';

// const String apnsTokenKey = 'apns-device-token';
// const String fcmTokenKey = 'firebase-device-token';
// const String voipTokenKey = 'voip-device-token';

// bool shouldConfigureFirebase() =>
//     FlavorConfig.isInitialized() &&
//     (FlavorConfig.isStaging() || FlavorConfig.isProduction());

// Future<void> configureFirebase() async {
//   if (!shouldConfigureFirebase()) {
//     return;
//   }
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseCrashlytics.instance
//       .setCrashlyticsCollectionEnabled(!kDebugMode);
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
// }

// Future<void> logFirebaseToken() async {
//   // ignore: unused_local_variable
//   final token = await FirebaseMessaging.instance.getToken();
//   // Log.debug('FirebaseMessaging - Token: $token');
// }

// R? runZonedGuardedWithErrorHandler<R>(R Function() body) =>
//     runZonedGuarded(body, (error, stack) {
//       if (shouldConfigureFirebase()) {
//         FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       }
//     });
