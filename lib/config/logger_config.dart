// import 'package:faalyat/config/firebase_config.dart';
// import 'package:faalyat/log/console_logger.dart';
// import 'package:faalyat/log/file_logger.dart';
// import 'package:faalyat/log/filtered_logger.dart';
// import 'package:faalyat/log/firebase_logger.dart';
// import 'package:faalyat/log/log.dart';
// import 'package:faalyat/log/multi_logger.dart';
// import 'package:flutter/foundation.dart';

// /// App specific logging setup.
// ///
// /// This setup configuration will:
// /// - use console logger except in production
// /// - use file logger for bug reports except in production
// /// - use firebase logs, always, in production too
// ///
// /// todo tailor this setup to your needs
// ///
// void initLogger() {
//   Log.logger = MultiLogger([
//     ConsoleLogger.create().makeFiltered(noLogsInProductionOrTests()),
//     FileLogger.instance().makeFiltered(noLogsInProductionOrTests()),
//     if (shouldConfigureFirebase())
//       FirebaseLogger.instance().makeFiltered(noLogsInTests()),
//   ]);

//   if (kDebugMode && shouldConfigureFirebase()) {
//     logFirebaseToken();
//   }
// }
