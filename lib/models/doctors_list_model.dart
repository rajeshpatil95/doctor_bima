import 'package:json_annotation/json_annotation.dart';
part 'doctors_list_model.g.dart';

@JsonSerializable()
class DoctorDetailsModel {
  int id;
  String first_name;
  String last_name;
  String profile_pic;
  bool favorite;
  String primary_contact_no;
  String rating;
  String email_address;
  String qualification;
  String description;
  String specialization;
  String languagesKnown;

  DoctorDetailsModel();

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorDetailsModelToJson(this);
}
