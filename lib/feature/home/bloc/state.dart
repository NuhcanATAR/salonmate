import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/category_model/category_model.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ServiceCategory> categorys;
  final List<SalonModel> salons;

  HomeLoaded({
    required this.categorys,
    required this.salons,
  });
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(
    this.errorMessage,
  );

  @override
  List<Object> get props => [errorMessage];
}
