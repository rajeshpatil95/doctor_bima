import 'package:equatable/equatable.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';

abstract class BimaDoctorsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDoctorsListInitialState extends BimaDoctorsState {
  GetDoctorsListInitialState();
}

class GetDoctorsListLoadingState extends BimaDoctorsState {
  GetDoctorsListLoadingState();
}

class GetDoctorsListSuccessState extends BimaDoctorsState {
  final List<DoctorDetailsModel> doctorsListModel;

  GetDoctorsListSuccessState({this.doctorsListModel});
}

class GetDoctorsListFailureState extends BimaDoctorsState {
  GetDoctorsListFailureState();
}
