import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:doctor_bima/generated/l10n.dart';
import 'package:doctor_bima/navigation/route_initializer.dart';
import 'package:doctor_bima/navigation/routes.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';

class LaunchApp extends StatefulWidget {
  @override
  State createState() {
    return LaunchAppState();
  }
}

class LaunchAppState extends State<LaunchApp> with WidgetsBindingObserver {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primary));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return getAppWidget();
  }

  getAppWidget() {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        theme: ThemeData(
            accentColor: AppColors.accent,
            primaryColor: AppColors.primary,
            fontFamily: AppFont.roboto),
        localizationsDelegates: [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: Strings.delegate.supportedLocales,
        routes: {
          Routes.homeScreen: (context) => navigateToHomeScreen()
        },
        onGenerateRoute: (settings) {
          if (settings.name == Routes.homeScreen) {
            return navigateToHomeScreen();
          } else if (settings.name == Routes.doctorDetailsScreen) {
            return navigateToDoctorDetailsScreen(settings);
          }
          return null;
        },
        initialRoute: Routes.homeScreen);
  }
}
