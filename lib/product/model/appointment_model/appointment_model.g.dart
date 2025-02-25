// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentResponseToJson(
  AppointmentResponse instance,
) =>
    <String, dynamic>{
      'appointments': instance.appointments,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      salonsId: (json['salons_id'] as num).toInt(),
      servicesId: (json['services_id'] as num).toInt(),
      stylistId: (json['stylist_id'] as num).toInt(),
      appointmentsDate: DateTime.parse(json['appointments_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      isDeleted: json['is_deleted'] == 1,
      appointmentsCategoryId: (json['appointments_category_id'] as num).toInt(),
      salonId: (json['salon_id'] as num).toInt(),
      salonFileName: json['salon_file_name'] as String,
      salonName: json['salon_name'] as String,
      salonCity: json['salon_city'] as String,
      salonDistrict: json['salon_district'] as String,
      salonPhone: json['salon_phone'] as String,
      serviceFileName: json['service_file_name'] as String,
      serviceName: json['service_name'] as String,
      serviceDescription: json['service_description'] as String,
      serviceDuration: (json['service_duration'] as num).toInt(),
      salonEmail: json['salon_email'] as String,
      stylistFileName: json['stylist_file_name'] as String,
      stylistName: json['stylist_name'] as String,
      stylistPhone: json['stylist_phone'] as String,
      stylistEmail: json['stylist_email'] as String,
      appointmentCategory: json['appointment_category'] as String,
      details:
          AppointmentDetails.fromJson(json['details'] as Map<String, dynamic>),
      additionalServices: (json['additionalServices'] as List<dynamic>)
          .map((e) => AdditionalService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'salons_id': instance.salonsId,
      'services_id': instance.servicesId,
      'stylist_id': instance.stylistId,
      'appointments_date': instance.appointmentsDate.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'appointments_category_id': instance.appointmentsCategoryId,
      'salon_id': instance.salonId,
      'salon_file_name': instance.salonFileName,
      'salon_name': instance.salonName,
      'salon_city': instance.salonCity,
      'salon_district': instance.salonDistrict,
      'salon_phone': instance.salonPhone,
      'service_file_name': instance.serviceFileName,
      'service_name': instance.serviceName,
      'service_description': instance.serviceDescription,
      'service_duration': instance.serviceDuration,
      'salon_email': instance.salonEmail,
      'stylist_file_name': instance.stylistFileName,
      'stylist_name': instance.stylistName,
      'stylist_phone': instance.stylistPhone,
      'stylist_email': instance.stylistEmail,
      'appointment_category': instance.appointmentCategory,
      'details': instance.details,
      'additionalServices': instance.additionalServices,
    };

AppointmentDetails _$AppointmentDetailsFromJson(Map<String, dynamic> json) =>
    AppointmentDetails(
      servicePrice: (json['service_price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      paymentType: json['payment_type'] == 1,
    );

Map<String, dynamic> _$AppointmentDetailsToJson(AppointmentDetails instance) =>
    <String, dynamic>{
      'service_price': instance.servicePrice,
      'total_price': instance.totalPrice,
      'payment_type': instance.paymentType,
    };

AdditionalService _$AdditionalServiceFromJson(Map<String, dynamic> json) =>
    AdditionalService(
      serviceName: json['service_name'] as String,
      servicePrice: (json['service_price'] as num).toInt(),
    );

Map<String, dynamic> _$AdditionalServiceToJson(AdditionalService instance) =>
    <String, dynamic>{
      'service_name': instance.serviceName,
      'service_price': instance.servicePrice,
    };
