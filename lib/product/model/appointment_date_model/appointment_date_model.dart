import 'package:json_annotation/json_annotation.dart';

part 'appointment_date_model.g.dart';

@JsonSerializable()
class AppointmentDateModel {
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime date;
  final List<String> availableTimes;

  AppointmentDateModel({
    required this.date,
    required this.availableTimes,
  });

  factory AppointmentDateModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDateModelToJson(this);

  // JSON'dan DateTime'e dönüştürme fonksiyonu
  static DateTime _fromJson(String date) => DateTime.parse(date);

  // DateTime'den JSON'a dönüştürme fonksiyonu
  static String _toJson(DateTime date) => date.toIso8601String();
}
