import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_bima/bloc/bimaDoctors/bima_doctors_bloc.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/presentation/home_screen.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_repository.dart';

navigateToWeatherReportScreen() {
  return BlocProvider<BimaDoctorsBloc>(
    create: (context) => BimaDoctorsBloc(DI.inject<BimaDoctorsRepository>()),
    child: HomeScreen(),
  );
}
