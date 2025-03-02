import 'package:json_annotation/json_annotation.dart';

part 'stylist_add_service_model.g.dart';

@JsonSerializable()
class StylistAddServiceModel {
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'price')
  final double price;

  StylistAddServiceModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory StylistAddServiceModel.fromJson(Map<String, dynamic> json) =>
      _$StylistAddServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$StylistAddServiceModelToJson(this);
}
