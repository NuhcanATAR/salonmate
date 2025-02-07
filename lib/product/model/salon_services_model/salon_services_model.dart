import 'package:json_annotation/json_annotation.dart';

part 'salon_services_model.g.dart';

@JsonSerializable()
class SalonServicesModel {
  final String? message;
  final List<Service>? services;

  SalonServicesModel({required this.message, required this.services});

  factory SalonServicesModel.fromJson(Map<String, dynamic> json) =>
      _$SalonServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalonServicesModelToJson(this);
}

@JsonSerializable()
class Service {
  final int id;
  @JsonKey(name: 'salon_id')
  final int salonId;
  @JsonKey(name: 'service_category_id')
  final int serviceCategoryId;
  final String name;
  final String description;
  final int price;
  final int duration;
  @JsonKey(name: 'is_active', fromJson: _boolFromInt, toJson: _intFromBool)
  final bool isActive;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'is_deleted', fromJson: _boolFromInt, toJson: _intFromBool)
  final bool isDeleted;
  @JsonKey(name: 'envoirment_id')
  final int envoirmentId;
  @JsonKey(name: 'envoirment_file_name')
  final String envoirmentFileName;
  @JsonKey(name: 'add_services')
  final List<AddService> addServices;

  Service({
    required this.id,
    required this.salonId,
    required this.serviceCategoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.isActive,
    required this.createdAt,
    required this.isDeleted,
    required this.envoirmentId,
    required this.envoirmentFileName,
    required this.addServices,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class AddService {
  final int id;
  @JsonKey(name: 'services_id')
  final int servicesId;
  final String name;
  final int price;
  @JsonKey(name: 'is_deleted', fromJson: _boolFromInt, toJson: _intFromBool)
  final bool isDeleted;

  AddService({
    required this.id,
    required this.servicesId,
    required this.name,
    required this.price,
    required this.isDeleted,
  });

  factory AddService.fromJson(Map<String, dynamic> json) =>
      _$AddServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AddServiceToJson(this);
}

// JSON'daki 0 ve 1 değerlerini bool'a çevirmek için yardımcı fonksiyonlar
bool _boolFromInt(int value) => value == 1;
int _intFromBool(bool value) => value ? 1 : 0;
