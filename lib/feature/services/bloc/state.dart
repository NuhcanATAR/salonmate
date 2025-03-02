import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';

abstract class ServicesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServicesInitialState extends ServicesState {}

class ServicesLoadingState extends ServicesState {}

class ServicesLoadedState extends ServicesState {
  final List<Service> services;

  ServicesLoadedState({
    required this.services,
  });

  @override
  List<Object> get props => [services];
}

class ServicesErrorState extends ServicesState {
  final String error;

  ServicesErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
