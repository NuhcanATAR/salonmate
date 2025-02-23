// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDateModel _$AppointmentDateModelFromJson(
  Map<String, dynamic> json,
) =>
    AppointmentDateModel(
      date: AppointmentDateModel._fromJson(json['date'] as String),
      availableTimes: (json['available_times'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppointmentDateModelToJson(
  AppointmentDateModel instance,
) =>
    <String, dynamic>{
      'date': AppointmentDateModel._toJson(instance.date),
      'available_times': instance.availableTimes,
    };
