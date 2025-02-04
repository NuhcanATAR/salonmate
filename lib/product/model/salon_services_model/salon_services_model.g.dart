// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonServicesModel _$SalonServicesModelFromJson(Map<String, dynamic> json) =>
    SalonServicesModel(
      message: json['message'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalonServicesModelToJson(SalonServicesModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'services': instance.services,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: (json['id'] as num).toInt(),
      salonId: (json['salon_id'] as num).toInt(),
      serviceCategoryId: (json['service_category_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      isActive: _boolFromInt((json['is_active'] as num).toInt()),
      createdAt: DateTime.parse(json['created_at'] as String),
      isDeleted: _boolFromInt((json['is_deleted'] as num).toInt()),
      envoirmentId: (json['envoirment_id'] as num).toInt(),
      envoirmentFileName: json['envoirment_file_name'] as String,
      addServices: (json['add_services'] as List<dynamic>)
          .map((e) => AddService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'salon_id': instance.salonId,
      'service_category_id': instance.serviceCategoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'duration': instance.duration,
      'is_active': _intFromBool(instance.isActive),
      'created_at': instance.createdAt.toIso8601String(),
      'is_deleted': _intFromBool(instance.isDeleted),
      'envoirment_id': instance.envoirmentId,
      'envoirment_file_name': instance.envoirmentFileName,
      'add_services': instance.addServices,
    };

AddService _$AddServiceFromJson(Map<String, dynamic> json) => AddService(
      id: (json['id'] as num).toInt(),
      servicesId: (json['services_id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      isDeleted: _boolFromInt((json['is_deleted'] as num).toInt()),
    );

Map<String, dynamic> _$AddServiceToJson(AddService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'services_id': instance.servicesId,
      'name': instance.name,
      'price': instance.price,
      'is_deleted': _intFromBool(instance.isDeleted),
    };
