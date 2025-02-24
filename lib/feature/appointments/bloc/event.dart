import 'package:equatable/equatable.dart';
import 'package:salonmate/product/core/base/helper/payment_type_control.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';

abstract class AppointmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppointmentFetchStylistEvent extends AppointmentEvent {
  final int salonId;
  final int serviceId;
  final String token;

  AppointmentFetchStylistEvent({
    required this.salonId,
    required this.serviceId,
    required this.token,
  });

  @override
  List<Object> get props => [salonId, serviceId, token];
}

class AppointmentStylistSelectEvent extends AppointmentEvent {
  final StylistModel selectStylist;

  AppointmentStylistSelectEvent(this.selectStylist);

  @override
  List<Object> get props => [selectStylist];
}

class AppointmentDateFetchEvent extends AppointmentEvent {
  final String token;
  final int stylistId;

  AppointmentDateFetchEvent({
    required this.token,
    required this.stylistId,
  });

  @override
  List<Object> get props => [token, stylistId];
}

class AppointmentSelectDayEvent extends AppointmentEvent {
  final DateTime selectedDate;
  AppointmentSelectDayEvent(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}

class AppointmentTimeSelectEvent extends AppointmentEvent {
  final DateTime selectedTime;

  AppointmentTimeSelectEvent(this.selectedTime);

  @override
  List<Object> get props => [selectedTime];
}

class AppointmentSummaryEvent extends AppointmentEvent {
  final String token;
  final int salonId;
  final int stylistId;

  AppointmentSummaryEvent({
    required this.token,
    required this.salonId,
    required this.stylistId,
  });

  @override
  List<Object> get props => [
        token,
        salonId,
        stylistId,
      ];
}

class AppointmentToggleServiceSelectionEvent extends AppointmentEvent {
  final int serviceId;

  AppointmentToggleServiceSelectionEvent(this.serviceId);

  @override
  List<Object> get props => [serviceId];
}

class AppointmentCreateEvent extends AppointmentEvent {
  final String token;
  final int salonId;
  final int serviceId;
  final int stylistId;
  final String appointmentDate;
  final double servicePrice;
  final double totalPrice;
  final PaymentType paymentType;
  final List<Map<String, Object>> addServices;
  final Service serviceModel;
  final StylistModel selectStylistModel;
  final DateTime selectDate;
  final DateTime selectTime;
  final List<StylistAddServiceModel> selectedServiceDetails;
  final SalonDetailModel salonDetailModel;

  AppointmentCreateEvent({
    required this.token,
    required this.salonId,
    required this.serviceId,
    required this.stylistId,
    required this.appointmentDate,
    required this.servicePrice,
    required this.totalPrice,
    required this.paymentType,
    required this.addServices,
    required this.serviceModel,
    required this.selectStylistModel,
    required this.selectDate,
    required this.selectTime,
    required this.selectedServiceDetails,
    required this.salonDetailModel,
  });

  @override
  List<Object> get props => [
        token,
        salonId,
        serviceId,
        stylistId,
        appointmentDate,
        servicePrice,
        totalPrice,
        paymentType,
        addServices,
        serviceModel,
        selectStylistModel,
        selectDate,
        selectTime,
        selectedServiceDetails,
        salonDetailModel,
      ];
}
