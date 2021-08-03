import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/webservice/base_repository.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_request.dart';

abstract class BimaDoctorsRepository extends BaseRepository {
  Future<List<DoctorDetailsModel>> getBimaDoctorsList();
}

class BimaDoctorsRepositoryImpl extends BimaDoctorsRepository {
  BimaDoctorsRequest _request = BimaDoctorsRequest();

  Future<List<DoctorDetailsModel>> getBimaDoctorsList() async {
    List<DoctorDetailsModel> response = await _request.getBimaDoctorsList();
    if (response == null) {
      return null;
    }

    return response;
  }
}
