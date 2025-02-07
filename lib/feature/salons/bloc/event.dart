import 'package:equatable/equatable.dart';

abstract class SalonsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SalonsLoadEvent extends SalonsEvent {
  final String token;

  SalonsLoadEvent({required this.token});

  @override
  List<Object> get props => [token];
}

class SearchSalonsEvent extends SalonsEvent {
  final String query;
  SearchSalonsEvent({required this.query});
}

class SalonDetailLoadEvent extends SalonsEvent {
  final String token;
  final String salonId;

  SalonDetailLoadEvent({
    required this.token,
    required this.salonId,
  });

  @override
  List<Object> get props => [token];
}
