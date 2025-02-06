import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String? message;
  @JsonKey(name: 'services_categories')
  final List<ServiceCategory>? categories;

  CategoryModel({this.message, this.categories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class ServiceCategory {
  @JsonKey(name: 'category_id')
  final int id;
  @JsonKey(name: 'category_name')
  final String name;
  @JsonKey(name: 'file_name')
  final String? fileName;

  ServiceCategory({
    required this.id,
    required this.name,
    this.fileName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryToJson(this);
}
