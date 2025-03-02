import 'package:json_annotation/json_annotation.dart';

part 'stylist_model.g.dart';

@JsonSerializable()
class StylistModel {
  final int id;
  @JsonKey(name: 'salon_id')
  final int salonId;
  final String name;
  final String phone;
  final String email;
  @JsonKey(name: 'is_top_rated', fromJson: _boolFromInt, toJson: _intFromBool)
  final bool isTopRated;
  @JsonKey(
    name: 'created_at',
    fromJson: _dateTimeFromString,
    toJson: _stringFromDateTime,
  )
  final DateTime createdAt;
  @JsonKey(name: 'is_deleted', fromJson: _boolFromInt, toJson: _intFromBool)
  final bool isDeleted;
  @JsonKey(name: 'envoirment_file_name')
  final String envoirmentFileName;

  StylistModel({
    required this.id,
    required this.salonId,
    required this.name,
    required this.phone,
    required this.email,
    required this.isTopRated,
    required this.createdAt,
    required this.isDeleted,
    required this.envoirmentFileName,
  });

  factory StylistModel.fromJson(Map<String, dynamic> json) =>
      _$StylistModelFromJson(json);

  Map<String, dynamic> toJson() => _$StylistModelToJson(this);
}

// **Dönüşüm Fonksiyonları**
bool _boolFromInt(int value) => value == 1;
int _intFromBool(bool value) => value ? 1 : 0;

DateTime _dateTimeFromString(String date) => DateTime.parse(date);
String _stringFromDateTime(DateTime date) => date.toIso8601String();
