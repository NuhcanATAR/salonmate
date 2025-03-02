import 'package:json_annotation/json_annotation.dart';

part 'services_category_model.g.dart';

@JsonSerializable()
class ServicesCategoryModel {
  final String message;
  final List<ServiceCategory> services;

  ServicesCategoryModel({required this.message, required this.services});

  factory ServicesCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesCategoryModelToJson(this);
}

@JsonSerializable()
class ServiceCategory {
  @JsonKey(name: 'service_id')
  final int serviceId;
  @JsonKey(name: 'salon_id')
  final int salonId;
  @JsonKey(name: 'service_category_id')
  final int serviceCategoryId;
  @JsonKey(name: 'service_name')
  final String serviceName;
  final String description;
  @JsonKey(name: 'service_price')
  final int servicePrice;
  final int duration;
  @JsonKey(name: 'is_active', fromJson: _boolFromInt, toJson: _intFromBool)
  final bool isActive;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(
    name: 'service_is_deleted',
    fromJson: _boolFromInt,
    toJson: _intFromBool,
  )
  final bool serviceIsDeleted;
  @JsonKey(name: 'file_name')
  final String fileName;

  ServiceCategory({
    required this.serviceId,
    required this.salonId,
    required this.serviceCategoryId,
    required this.serviceName,
    required this.description,
    required this.servicePrice,
    required this.duration,
    required this.isActive,
    required this.createdAt,
    required this.serviceIsDeleted,
    required this.fileName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryToJson(this);
}

// JSON'daki 0 ve 1 değerlerini bool'a çevirmek için yardımcı fonksiyonlar
bool _boolFromInt(int value) => value == 1;
int _intFromBool(bool value) => value ? 1 : 0;
