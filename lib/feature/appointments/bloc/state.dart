import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/appointment_date_model/appointment_date_model.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
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

class AppointmentSummaryLoadingState extends AppointmentState {}

class AppointmentSummaryLoadedState extends AppointmentState {
  final List<StylistAddServiceModel>? stylistAddService;
  final SalonDetailModel? salonDetailModel;
  final List<int>? selectedServices;

  AppointmentSummaryLoadedState({
    this.stylistAddService,
    this.salonDetailModel,
    this.selectedServices,
  });

  @override
  List<Object?> get props =>
      [stylistAddService, salonDetailModel, selectedServices];
}

class AppointmentSummaryErrorState extends AppointmentState {
  final String message;

  AppointmentSummaryErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AppointmentCreateSuccessState extends AppointmentState {
  final String message;
  final int salonId;
  final Service serviceModel;
  final StylistModel selectStylistModel;
  final DateTime selectDate;
  final DateTime selectTime;
  final List<StylistAddServiceModel> selectedServiceDetails;
  final SalonDetailModel salonDetailModel;

  AppointmentCreateSuccessState({
    required this.message,
    required this.salonId,
    required this.serviceModel,
    required this.selectStylistModel,
    required this.selectDate,
    required this.selectTime,
    required this.selectedServiceDetails,
    required this.salonDetailModel,
  });

  @override
  List<Object?> get props => [
        message,
        salonId,
        serviceModel,
        selectStylistModel,
        selectDate,
        selectTime,
        selectedServiceDetails,
        salonDetailModel,
      ];
}

class AppointmentCreateErrorState extends AppointmentState {
  final String message;

  AppointmentCreateErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
