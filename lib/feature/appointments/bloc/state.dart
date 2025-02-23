import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/appointment_date_model/appointment_date_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppointmentInitialState extends AppointmentState {}

class AppointmentStylistLoadingState extends AppointmentState {}

class AppointmentStylistLoadedState extends AppointmentState {
  final List<StylistModel> stylist;
  final StylistModel? selectedStylist;

  AppointmentStylistLoadedState({required this.stylist, this.selectedStylist});

  @override
  List<Object?> get props => [stylist, selectedStylist];
}

class AppointmentStylistErrorState extends AppointmentState {
  final String errorMessage;

  AppointmentStylistErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class AppointmentDateLoadingState extends AppointmentState {}

class AppointmnetDateLoadedState extends AppointmentState {
  final List<AppointmentDateModel> appointments;
  final DateTime selectedDate;
  final DateTime selectedTime;

  AppointmnetDateLoadedState({
    required this.appointments,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  List<Object?> get props => [appointments, selectedDate, selectedTime];
}

class AppointmentDateErrorState extends AppointmentState {
  final String message;

  AppointmentDateErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
