import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

abstract class SalonsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SalonsInitialState extends SalonsState {}

class SalonsLoadingState extends SalonsState {}

class SalonLoadedState extends SalonsState {
  final List<SalonModel> salons;

  SalonLoadedState({
    required this.salons,
  });

  @override
  List<Object> get props => [salons];
}

class SalonErrorState extends SalonsState {
  final String? errorMessage;

  SalonErrorState({
    required this.errorMessage,
  });
}

class FilteredSalonsState extends SalonsState {
  final List<SalonModel> filteredSalons;
  FilteredSalonsState({required this.filteredSalons});

  @override
  List<Object> get props => [filteredSalons];
}
