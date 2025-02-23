import 'package:equatable/equatable.dart';
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
