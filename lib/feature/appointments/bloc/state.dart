import 'package:equatable/equatable.dart';
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
