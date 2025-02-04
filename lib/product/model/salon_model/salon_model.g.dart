// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonListModel _$SalonListModelFromJson(Map<String, dynamic> json) =>
    SalonListModel(
      salons: (json['salons'] as List<dynamic>)
          .map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalonListModelToJson(SalonListModel instance) =>
    <String, dynamic>{
      'salons': instance.salons,
    };

SalonModel _$SalonModelFromJson(Map<String, dynamic> json) => SalonModel(
      id: (json['id'] as num).toInt(),
      envoirmentId: (json['envoirment_id'] as num).toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isOpen: SalonModel._intToBool((json['is_open'] as num).toInt()),
      createdAt: DateTime.parse(json['created_at'] as String),
      isDeleted: SalonModel._intToBool((json['is_deleted'] as num).toInt()),
      salonId: (json['salon_id'] as num).toInt(),
      address: json['address'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      email: json['email'] as String,
      phone: int.parse(json['phone'] as String),
      openTime: SalonModel._timeStringToDateTime(json['open_time'] as String),
      closeTime: SalonModel._timeStringToDateTime(json['close_time'] as String),
      isSundayOpen:
          SalonModel._intToBool((json['is_sunday_open'] as num).toInt()),
      fileName: json['file_name'] as String,
    );

Map<String, dynamic> _$SalonModelToJson(SalonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'envoirment_id': instance.envoirmentId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_open': SalonModel._boolToInt(instance.isOpen),
      'created_at': instance.createdAt.toIso8601String(),
      'is_deleted': SalonModel._boolToInt(instance.isDeleted),
      'salon_id': instance.salonId,
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'email': instance.email,
      'phone': SalonModel._intToString(instance.phone),
      'open_time': SalonModel._dateTimeToTimeString(instance.openTime),
      'close_time': SalonModel._dateTimeToTimeString(instance.closeTime),
      'is_sunday_open': SalonModel._boolToInt(instance.isSundayOpen),
      'file_name': instance.fileName,
    };
