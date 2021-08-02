// import 'dart:io';
// import 'package:doctor_bima/native/platform_utils.dart';
// import 'package:package_info/package_info.dart';
// import 'package:sentry/sentry.dart';

// class Sentry {
//   static Future<SentryClient> initSentryClient() async {
//     return SentryClient(dsn: await _getSentryClientDsn());
//   }

//   static Future<String> _getSentryClientDsn() async {
//     PackageInfo packageInfo = await PlatformUtils.getPackageInfo();
//     if (Platform.isAndroid) {
//       return packageInfo.packageName.endsWith("app") ? "" : "";
//     } else if (Platform.isIOS) {
//       // TODO check for Development Target on iOS
//       return "";
//     }

//     return "";
//   }

//   static Future<void> reportError(
//       SentryClient sentryClient, dynamic error, dynamic stackTrace) async {
//     bool isInDebugMode = PlatformUtils.isInDebugMode;
//     if (isInDebugMode) {
//       print(stackTrace);
//     } else {
//       sentryClient.captureException(exception: error, stackTrace: stackTrace);
//     }
//   }
// }