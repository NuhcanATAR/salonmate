// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      fullName: json['full_name'] as String? ?? "Unknown",
      phone: json['phone'] == null
          ? 0
          : UserDetail._stringToInt(json['phone'] as String),
      city: json['city'] as String? ?? "Unknown",
      district: json['district'] as String? ?? "Unknown",
      address: json['address'] as String? ?? "Unknown",
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone': UserDetail._intToString(instance.phone),
      'city': instance.city,
      'district': instance.district,
      'address': instance.address,
    };
