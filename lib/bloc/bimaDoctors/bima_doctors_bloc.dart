import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/storage/shared_preferences.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_repository.dart';
import 'bima_doctors_event.dart';
import 'bima_doctors_state.dart';

class BimaDoctorsBloc extends Bloc<BimaDoctorsEvent, BimaDoctorsState> {
  final BimaDoctorsRepository bimaDoctorsRepository;

  BimaDoctorsBloc(this.bimaDoctorsRepository)
      : super(GetDoctorsListInitialState());

  List<DoctorDetailsModel> doctorDetailsList = List<DoctorDetailsModel>();

  @override
  Stream<BimaDoctorsState> mapEventToState(BimaDoctorsEvent event) async* {
    if (event is GetBimaDoctorsListEvent) {
      yield GetDoctorsListInitialState();
      yield GetDoctorsListLoadingState();
      try {
        bool localStorageBool = await DI.inject<Preferences>().getBoolForKey(preferencesKeys.kIsDoctorListFetched) ?? false;
        if(!localStorageBool) {
          this.doctorDetailsList = await bimaDoctorsRepository.getBimaDoctorsList();
          await DI.inject<Preferences>().setStringForKey(preferencesKeys.kDoctorsListData, jsonEncode(this.doctorDetailsList));
          await DI.inject<Preferences>().setBoolForKey(preferencesKeys.kIsDoctorListFetched, true);
        } else {
          String localStorageString = await DI.inject<Preferences>().getStringForKey(preferencesKeys.kDoctorsListData);
          this.doctorDetailsList = jsonDecode(localStorageString)
            .map<DoctorDetailsModel>((dynamic doctorDetailsModel) =>
                DoctorDetailsModel.fromJson(doctorDetailsModel))
            .toList();  
        }
        //Sorting list based on rating
        this.doctorDetailsList?.sort(
            (a, b) => double.parse(b.rating).compareTo(double.parse(a.rating)));
        print("GetDoctorsListEvent Success:");

        yield GetDoctorsListSuccessState(doctorsListModel: doctorDetailsList);
      } catch (e) {
        print("GetDoctorsListEvent Exception: ${e}");
        yield GetDoctorsListFailureState();
      }
    }
  }
}
