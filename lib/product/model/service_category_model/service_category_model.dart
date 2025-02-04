import 'package:json_annotation/json_annotation.dart';

part 'service_category_model.g.dart';

@JsonSerializable()
class ServicesCategoryModel {
  final String message;
  @JsonKey(name: 'services_categories')
  final List<ServiceCategory> categories;

  ServicesCategoryModel({required this.message, required this.categories});

  factory ServicesCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesCategoryModelToJson(this);
}

@JsonSerializable()
class ServiceCategory {
  @JsonKey(name: 'category_id')
  final int id;
  @JsonKey(name: 'category_name')
  final String name;
  @JsonKey(name: 'file_name')
  final String fileName;

  ServiceCategory({
    required this.id,
    required this.name,
    required this.fileName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryToJson(this);
}
