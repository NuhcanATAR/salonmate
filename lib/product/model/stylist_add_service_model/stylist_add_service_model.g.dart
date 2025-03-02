// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stylist_add_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StylistAddServiceModel _$StylistAddServiceModelFromJson(
  Map<String, dynamic> json,
) =>
    StylistAddServiceModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$StylistAddServiceModelToJson(
  StylistAddServiceModel instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
