// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonDetailListModel _$SalonDetailListModelFromJson(
  Map<String, dynamic> json,
) =>
    SalonDetailListModel(
      salons: (json['salons'] as List<dynamic>)
          .map((e) => SalonDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalonDetailListModelToJson(
  SalonDetailListModel instance,
) =>
    <String, dynamic>{
      'salons': instance.salons,
    };

SalonDetailModel _$SalonDetailModelFromJson(Map<String, dynamic> json) =>
    SalonDetailModel(
      id: (json['id'] as num).toInt(),
      envoirmentId: (json['envoirment_id'] as num).toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isOpen: SalonDetailModel._intToBool((json['is_open'] as num).toInt()),
      createdAt: DateTime.parse(json['created_at'] as String),
      isDeleted:
          SalonDetailModel._intToBool((json['is_deleted'] as num).toInt()),
      salonId: (json['salon_id'] as num).toInt(),
      address: json['address'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      email: json['email'] as String,
      phone: int.parse(json['phone'] as String),
      openTime:
          SalonDetailModel._timeStringToDateTime(json['open_time'] as String),
      closeTime:
          SalonDetailModel._timeStringToDateTime(json['close_time'] as String),
      isSundayOpen:
          SalonDetailModel._intToBool((json['is_sunday_open'] as num).toInt()),
      fileName: json['file_name'] as String,
      avarageScore: (json['average_score'] as num).toDouble(),
      totalAppointments: (json['total_appointments'] as num).toDouble(),
    );

Map<String, dynamic> _$SalonDetailModelToJson(SalonDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'envoirment_id': instance.envoirmentId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_open': SalonDetailModel._boolToInt(instance.isOpen),
      'created_at': instance.createdAt.toIso8601String(),
      'is_deleted': SalonDetailModel._boolToInt(instance.isDeleted),
      'salon_id': instance.salonId,
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'email': instance.email,
      'phone': SalonDetailModel._intToString(instance.phone),
      'open_time': SalonDetailModel._dateTimeToTimeString(instance.openTime),
      'close_time': SalonDetailModel._dateTimeToTimeString(instance.closeTime),
      'is_sunday_open': SalonDetailModel._boolToInt(instance.isSundayOpen),
      'file_name': instance.fileName,
      'average_score': instance.avarageScore,
      'total_appointments': instance.totalAppointments,
    };
