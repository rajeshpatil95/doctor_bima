// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailsModel _$DoctorDetailsModelFromJson(Map<String, dynamic> json) {
  return DoctorDetailsModel()
    ..id = json['id'] as int
    ..first_name = json['first_name'] as String
    ..last_name = json['last_name'] as String
    ..profile_pic = json['profile_pic'] as String
    ..favorite = json['favorite'] as bool
    ..primary_contact_no = json['primary_contact_no'] as String
    ..rating = json['rating'] as String
    ..email_address = json['email_address'] as String
    ..qualification = json['qualification'] as String
    ..description = json['description'] as String
    ..specialization = json['specialization'] as String
    ..languagesKnown = json['languagesKnown'] as String;
}

Map<String, dynamic> _$DoctorDetailsModelToJson(DoctorDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'profile_pic': instance.profile_pic,
      'favorite': instance.favorite,
      'primary_contact_no': instance.primary_contact_no,
      'rating': instance.rating,
      'email_address': instance.email_address,
      'qualification': instance.qualification,
      'description': instance.description,
      'specialization': instance.specialization,
      'languagesKnown': instance.languagesKnown,
    };
