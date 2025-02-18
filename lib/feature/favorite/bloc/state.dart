import 'package:equatable/equatable.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  final List<SalonModel> salons;

  FavoriteLoadedState({required this.salons});

  @override
  List<Object> get props => [salons];
}

class FavoriteErrorState extends FavoriteState {
  final String error;

  FavoriteErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class FavoriteToggleSuccessState extends FavoriteState {
  final bool isFavorite;

  FavoriteToggleSuccessState({required this.isFavorite});

  @override
  List<Object> get props => [isFavorite];
}

class FavoriteToggleErrorState extends FavoriteState {
  final String message;

  FavoriteToggleErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
