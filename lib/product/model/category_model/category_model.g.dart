// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      message: json['message'] as String?,
      categories: (json['services_categories'] as List<dynamic>?)
          ?.map((e) => ServiceCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'services_categories': instance.categories,
    };

ServiceCategory _$ServiceCategoryFromJson(Map<String, dynamic> json) =>
    ServiceCategory(
      id: (json['category_id'] as num).toInt(),
      name: json['category_name'] as String,
      fileName: json['file_name'] as String?,
    );

Map<String, dynamic> _$ServiceCategoryToJson(ServiceCategory instance) =>
    <String, dynamic>{
      'category_id': instance.id,
      'category_name': instance.name,
      'file_name': instance.fileName,
    };
