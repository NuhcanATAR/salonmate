import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';

abstract class SalonsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SalonsInitialState extends SalonsState {}

class SalonsLoadingState extends SalonsState {}

class SalonDetailLoadingState extends SalonsState {}

class SalonLoadedState extends SalonsState {
  final List<SalonModel> salons;

  SalonLoadedState({
    required this.salons,
  });

  @override
  List<Object> get props => [salons];
}

class SalonDetailLoadedState extends SalonsState {
  final SalonDetailModel salonModel;
  final List<Service> services;

  SalonDetailLoadedState({
    required this.salonModel,
    required this.services,
  });

  @override
  List<Object> get props => [salonModel, services];
}

class SalonDetailErrorState extends SalonsState {
  final String errorMessage;

  SalonDetailErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
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

class FavoriteToggleSuccessState extends SalonsState {
  final bool isFavorite;

  FavoriteToggleSuccessState({required this.isFavorite});

  @override
  List<Object> get props => [isFavorite];
}

class FavoriteToggleErrorState extends SalonsState {
  final String message;

  FavoriteToggleErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
