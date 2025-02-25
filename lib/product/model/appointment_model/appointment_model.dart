import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentResponse {
  final List<Appointment> appointments;

  AppointmentResponse({required this.appointments});

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}

@JsonSerializable()
class Appointment {
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'salons_id')
  final int salonsId;

  @JsonKey(name: 'services_id')
  final int servicesId;

  @JsonKey(name: 'stylist_id')
  final int stylistId;

  @JsonKey(name: 'appointments_date')
  final DateTime appointmentsDate;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'appointments_category_id')
  final int appointmentsCategoryId;

  @JsonKey(name: 'salon_id')
  final int salonId;

  @JsonKey(name: 'salon_file_name')
  final String salonFileName;

  @JsonKey(name: 'salon_name')
  final String salonName;

  @JsonKey(name: 'salon_city')
  final String salonCity;

  @JsonKey(name: 'salon_district')
  final String salonDistrict;

  @JsonKey(name: 'salon_phone')
  final String salonPhone;

  @JsonKey(name: 'service_file_name')
  final String serviceFileName;

  @JsonKey(name: 'service_name')
  final String serviceName;

  @JsonKey(name: 'service_description')
  final String serviceDescription;

  @JsonKey(name: 'service_duration')
  final int serviceDuration;

  @JsonKey(name: 'salon_email')
  final String salonEmail;

  @JsonKey(name: 'stylist_file_name')
  final String stylistFileName;

  @JsonKey(name: 'stylist_name')
  final String stylistName;

  @JsonKey(name: 'stylist_phone')
  final String stylistPhone;

  @JsonKey(name: 'stylist_email')
  final String stylistEmail;

  @JsonKey(name: 'appointment_category')
  final String appointmentCategory;

  final AppointmentDetails details;

  @JsonKey(name: 'additionalServices')
  final List<AdditionalService> additionalServices;

  Appointment({
    required this.id,
    required this.userId,
    required this.salonsId,
    required this.servicesId,
    required this.stylistId,
    required this.appointmentsDate,
    required this.createdAt,
    required this.isDeleted,
    required this.appointmentsCategoryId,
    required this.salonId,
    required this.salonFileName,
    required this.salonName,
    required this.salonCity,
    required this.salonDistrict,
    required this.salonPhone,
    required this.serviceFileName,
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceDuration,
    required this.salonEmail,
    required this.stylistFileName,
    required this.stylistName,
    required this.stylistPhone,
    required this.stylistEmail,
    required this.appointmentCategory,
    required this.details,
    required this.additionalServices,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

@JsonSerializable()
class AppointmentDetails {
  @JsonKey(name: 'service_price')
  final int servicePrice;

  @JsonKey(name: 'total_price')
  final int totalPrice;

  @JsonKey(name: 'payment_type')
  final bool paymentType;

  AppointmentDetails({
    required this.servicePrice,
    required this.totalPrice,
    required this.paymentType,
  });

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailsToJson(this);
}

@JsonSerializable()
class AdditionalService {
  @JsonKey(name: 'service_name')
  final String serviceName;

  @JsonKey(name: 'service_price')
  final int servicePrice;

  AdditionalService({
    required this.serviceName,
    required this.servicePrice,
  });

  factory AdditionalService.fromJson(Map<String, dynamic> json) =>
      _$AdditionalServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalServiceToJson(this);
}
