// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesCategoryModel _$ServicesCategoryModelFromJson(
  Map<String, dynamic> json,
) =>
    ServicesCategoryModel(
      message: json['message'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServicesCategoryModelToJson(
  ServicesCategoryModel instance,
) =>
    <String, dynamic>{
      'message': instance.message,
      'services': instance.services,
    };

ServiceCategory _$ServiceCategoryFromJson(Map<String, dynamic> json) =>
    ServiceCategory(
      serviceId: (json['service_id'] as num).toInt(),
      salonId: (json['salon_id'] as num).toInt(),
      serviceCategoryId: (json['service_category_id'] as num).toInt(),
      serviceName: json['service_name'] as String,
      description: json['description'] as String,
      servicePrice: (json['service_price'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      isActive: _boolFromInt((json['is_active'] as num).toInt()),
      createdAt: DateTime.parse(json['created_at'] as String),
      serviceIsDeleted:
          _boolFromInt((json['service_is_deleted'] as num).toInt()),
      fileName: json['file_name'] as String,
    );

Map<String, dynamic> _$ServiceCategoryToJson(ServiceCategory instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'salon_id': instance.salonId,
      'service_category_id': instance.serviceCategoryId,
      'service_name': instance.serviceName,
      'description': instance.description,
      'service_price': instance.servicePrice,
      'duration': instance.duration,
      'is_active': _intFromBool(instance.isActive),
      'created_at': instance.createdAt.toIso8601String(),
      'service_is_deleted': _intFromBool(instance.serviceIsDeleted),
      'file_name': instance.fileName,
    };
