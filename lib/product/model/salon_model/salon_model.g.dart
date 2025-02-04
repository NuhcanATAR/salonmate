// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonModel _$SalonModelFromJson(Map<String, dynamic> json) => SalonModel(
      id: (json['id'] as num).toInt(),
      envoirmentId: (json['envoirmentId'] as num).toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isOpen: SalonModel._intToBool((json['isOpen'] as num).toInt()),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDeleted: SalonModel._intToBool((json['isDeleted'] as num).toInt()),
      salonId: (json['salonId'] as num).toInt(),
      address: json['address'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      phone: int.parse(json['phone'] as String),
      openTime: SalonModel._timestampToDateTime(json['openTime'] as String),
      closeTime: SalonModel._timestampToDateTime(json['closeTime'] as String),
      isSundayOpen:
          SalonModel._intToBool((json['isSundayOpen'] as num).toInt()),
      fileName: json['fileName'] as String,
    );

Map<String, dynamic> _$SalonModelToJson(SalonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'envoirmentId': instance.envoirmentId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isOpen': SalonModel._boolToInt(instance.isOpen),
      'createdAt': instance.createdAt.toIso8601String(),
      'isDeleted': SalonModel._boolToInt(instance.isDeleted),
      'salonId': instance.salonId,
      'address': instance.address,
      'city': instance.city,
      'district': instance.district,
      'phone': SalonModel._intToString(instance.phone),
      'openTime': SalonModel._dateTimeToTimestamp(instance.openTime),
      'closeTime': SalonModel._dateTimeToTimestamp(instance.closeTime),
      'isSundayOpen': SalonModel._boolToInt(instance.isSundayOpen),
      'fileName': instance.fileName,
    };
