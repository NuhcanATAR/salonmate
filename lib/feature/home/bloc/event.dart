import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeLoadEvent extends HomeEvent {
  final String token;

  HomeLoadEvent(this.token);

  @override
  List<Object> get props => [token];
}

class HomeLoadSalonsEvent extends HomeEvent {
  final String token;

  HomeLoadSalonsEvent(this.token);

  @override
  List<Object> get props => [token];
}
