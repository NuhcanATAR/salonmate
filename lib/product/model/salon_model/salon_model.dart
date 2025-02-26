import 'package:json_annotation/json_annotation.dart';

part 'salon_model.g.dart';

@JsonSerializable()
class SalonListModel {
  final List<SalonModel> salons;

  SalonListModel({required this.salons});

  factory SalonListModel.fromJson(Map<String, dynamic> json) =>
      _$SalonListModelFromJson(json);
  Map<String, dynamic> toJson() => _$SalonListModelToJson(this);
}

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
  final String email;

  @JsonKey(fromJson: int.parse, toJson: _intToString)
  final int phone;

  @JsonKey(fromJson: _timeStringToDateTime, toJson: _dateTimeToTimeString)
  final DateTime openTime;

  @JsonKey(fromJson: _timeStringToDateTime, toJson: _dateTimeToTimeString)
  final DateTime closeTime;

  @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
  final bool isSundayOpen;

  final String fileName;
  final double avarageScore;
  final double totalAppointments;

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
    required this.email,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.isSundayOpen,
    required this.fileName,
    required this.avarageScore,
    required this.totalAppointments,
  });

  factory SalonModel.fromJson(Map<String, dynamic> json) =>
      _$SalonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalonModelToJson(this);

  static bool _intToBool(int value) => value == 1;
  static int _boolToInt(bool value) => value ? 1 : 0;

  static String _intToString(int value) => value.toString();

  static DateTime _timeStringToDateTime(String time) {
    final now = DateTime.now();
    final parts = time.split(':');
    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  static String _dateTimeToTimeString(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}:'
        '${date.second.toString().padLeft(2, '0')}';
  }
}
