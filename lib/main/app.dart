import 'package:doctor_bima/appStateContainer/app_state_model.dart';
import 'package:doctor_bima/presentation/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:doctor_bima/generated/l10n.dart';
import 'package:doctor_bima/navigation/route_initializer.dart';
import 'package:doctor_bima/navigation/routes.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:scoped_model/scoped_model.dart';

class LaunchApp extends StatefulWidget {
  @override
  State createState() {
    return LaunchAppState();
  }
}

class LaunchAppState extends State<LaunchApp> with WidgetsBindingObserver {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  AppStateModel appStateModel;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    appStateModel = AppStateModel();
  }

  List<NavigatorObserver> get getNavigatorObservers =>
      <NavigatorObserver>[routeObserver];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primary));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return getAppWidget();
  }

  getAppWidget() {
    return ScopedModel(
        model: appStateModel,
        child: ScopedModelDescendant<AppStateModel>(
            builder: (context, widget, model) {
          return MaterialApp(
              navigatorKey: _navigatorKey,
              theme: ThemeData(
                  accentColor: AppColors.accent,
                  primaryColor: AppColors.primary,
                  fontFamily: AppFont.roboto),
              navigatorObservers: getNavigatorObservers,
              localizationsDelegates: [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: Strings.delegate.supportedLocales,
              routes: {
                Routes.homeScreen: (context) => navigateToHomeScreen(),
                Routes.loginScreen: (context) => navigateToLoginScreen(),
                Routes.otpValidationScreen: (context) =>
                    navigateToOtpValidationScreen(),
              },
              onGenerateRoute: (settings) {
                if (settings.name == Routes.homeScreen) {
                  return navigateToHomeScreen();
                } else if (settings.name == Routes.filePickerScreen) {
                  return navigateToFilePickerScreen();
                } else if (settings.name == Routes.doctorDetailsScreen) {
                  return navigateToDoctorDetailsScreen(settings);
                }
                return null;
              },
              initialRoute: Routes.loginScreen);
        }));
  }
}
