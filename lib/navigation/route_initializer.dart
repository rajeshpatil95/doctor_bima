import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/presentation/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_bloc.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/presentation/home_screen.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_repository.dart';

navigateToHomeScreen() {
  return BlocProvider<BimaDoctorsBloc>(
    create: (context) => BimaDoctorsBloc(DI.inject<BimaDoctorsRepository>()),
    child: HomeScreen(),
  );
}

navigateToDoctorDetailsScreen(RouteSettings routeSettings) {
  var doctorDetailsModel = routeSettings.arguments as DoctorDetailsModel;
  return MaterialPageRoute(builder: (context) {
    return DoctorDetailsScreen(doctorDetailsModel: doctorDetailsModel);
  });
}
