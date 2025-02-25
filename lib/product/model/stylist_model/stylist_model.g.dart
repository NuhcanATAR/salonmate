// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stylist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StylistModel _$StylistModelFromJson(Map<String, dynamic> json) => StylistModel(
      id: (json['id'] as num).toInt(),
      salonId: (json['salon_id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      isTopRated: _boolFromInt((json['is_top_rated'] as num).toInt()),
      createdAt: _dateTimeFromString(json['created_at'] as String),
      isDeleted: _boolFromInt((json['is_deleted'] as num).toInt()),
      envoirmentFileName: json['envoirment_file_name'] as String,
    );

Map<String, dynamic> _$StylistModelToJson(StylistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salon_id': instance.salonId,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'is_top_rated': _intFromBool(instance.isTopRated),
      'created_at': _stringFromDateTime(instance.createdAt),
      'is_deleted': _intFromBool(instance.isDeleted),
      'envoirment_file_name': instance.envoirmentFileName,
    };
