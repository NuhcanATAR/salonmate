import 'package:json_annotation/json_annotation.dart';

part 'salon_model.g.dart';

@JsonSerializable()
class SalonModel {
  final int id;
  final int envoirmentId;
  final String name;
  final double latitude;
  final double longitude;

  @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
  final bool isOpen;

  final DateTime createdAt;

  @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
  final bool isDeleted;

  final int salonId;
  final String address;
  final String city;
  final String district;

  @JsonKey(fromJson: int.parse, toJson: _intToString)
  final int phone;

  @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
  final DateTime openTime;

  @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
  final DateTime closeTime;

  @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
  final bool isSundayOpen;

  final String fileName;

  SalonModel({
    required this.id,
    required this.envoirmentId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.isOpen,
    required this.createdAt,
    required this.isDeleted,
    required this.salonId,
    required this.address,
    required this.city,
    required this.district,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.isSundayOpen,
    required this.fileName,
  });

  factory SalonModel.fromJson(Map<String, dynamic> json) =>
      _$SalonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalonModelToJson(this);

  static bool _intToBool(int value) => value == 1;
  static int _boolToInt(bool value) => value ? 1 : 0;

  static String _intToString(int value) => value.toString();

  static DateTime _timestampToDateTime(String timestamp) =>
      DateTime.parse(timestamp);

  static String _dateTimeToTimestamp(DateTime date) => date.toIso8601String();
}
