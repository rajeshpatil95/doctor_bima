import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_repository.dart';
import 'bima_doctors_event.dart';
import 'bima_doctors_state.dart';

class BimaDoctorsBloc extends Bloc<BimaDoctorsEvent, BimaDoctorsState> {
  final BimaDoctorsRepository bimaDoctorsRepository;

  BimaDoctorsBloc(this.bimaDoctorsRepository) : super(GetDoctorsListInitialState());

  List<DoctorDetailsModel> doctorDetailsList = List<DoctorDetailsModel>();

  @override
  Stream<BimaDoctorsState> mapEventToState(BimaDoctorsEvent event) async* {
    if (event is GetBimaDoctorsListEvent) {
      yield GetDoctorsListInitialState();
      yield GetDoctorsListLoadingState();
      try {
        this.doctorDetailsList = await bimaDoctorsRepository.getBimaDoctorsList();
        print("GetDoctorsListEvent Success: ${this.doctorDetailsList[0].first_name}");

        yield GetDoctorsListSuccessState(doctorsListModel: doctorDetailsList);
      } catch (e) {
        print("GetDoctorsListEvent Exception: ${e}");
        yield GetDoctorsListFailureState();
      }
    }
  }
}
