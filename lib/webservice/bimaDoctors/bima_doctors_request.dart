import 'dart:convert';
import 'dart:core';
import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/resources/strings/app_strings.dart';
import 'package:doctor_bima/webservice/base_request.dart';
import '../extensions.dart';

class BimaDoctorsRequest extends BaseRequest {
  Future<List<DoctorDetailsModel>> getBimaDoctorsList() async {
    var response = await this.constructAndExecuteRequest(
        method: HttpMethod.get,
        authenticated: true,
        endpoint: Endpoints().getBimaDoctorsList());

    if (response.isSuccessful()) {
      return json
          .decode(utf8.decode(response.bodyBytes))
          .map<DoctorDetailsModel>((dynamic doctorDetailsModel) =>
              DoctorDetailsModel.fromJson(doctorDetailsModel))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }
}
