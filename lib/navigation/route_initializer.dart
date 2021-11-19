import 'package:doctor_bima/bloc/login/login_bloc.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/presentation/dashboard/doctor_details_screen.dart';
import 'package:doctor_bima/presentation/dashboard/drag_drop_screen.dart';
import 'package:doctor_bima/presentation/dashboard/file_picker_screen.dart';
import 'package:doctor_bima/presentation/dashboard/long_press_screen.dart';
import 'package:doctor_bima/presentation/firebaseAuth/login_screen.dart';
import 'package:doctor_bima/presentation/firebaseAuth/otp_validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_bloc.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/presentation/dashboard/home_screen.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_repository.dart';

navigateToLoginScreen() {
  return BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(),
    child: LoginScreen(),
  );
}

navigateToOtpValidationScreen() {
  return OTPValidationScreen();
}

navigateToHomeScreen() {
  return BlocProvider<BimaDoctorsBloc>(
    create: (context) => BimaDoctorsBloc(DI.inject<BimaDoctorsRepository>()),
    child: HomeScreen(),
  );
}

navigateToFilePickerScreen() {
  return MaterialPageRoute(builder: (context) {
    return FilePickerScreen();
  });
}

navigateToDragDropScreen() {
  return MaterialPageRoute(builder: (context) {
    return DragDropScreen();
  });
}

navigateToLongPressScreen() {
  return MaterialPageRoute(builder: (context) {
    return LongPressScreen();
  });
}

navigateToDoctorDetailsScreen(RouteSettings routeSettings) {
  var doctorDetailsModel = routeSettings.arguments as DoctorDetailsModel;
  return MaterialPageRoute(builder: (context) {
    return DoctorDetailsScreen(doctorDetailsModel: doctorDetailsModel);
  });
}
