import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_bima/analytics/analytics_manager.dart';
import 'package:doctor_bima/analytics/sentry.dart';
import 'package:doctor_bima/appStateContainer/app_state_container.dart';
import 'package:doctor_bima/bloc/bloc_observer.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/main/app.dart';
import 'dart:async';
import 'package:doctor_bima/native/platform_utils.dart';
// import 'package:sentry/sentry.dart';

defaultMain() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (PlatformUtils.isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    DI.initializeDependencies();
    AppAnalyticsManager.init();
    Bloc.observer = DBBlocObserver();
    runApp(StateContainer(child: LaunchApp()));
  }, (Object error, StackTrace stackTrace) async {
    // final SentryClient sentry = await Sentry.initSentryClient();
    // Sentry.reportError(sentry, error, stackTrace);
  });
}
