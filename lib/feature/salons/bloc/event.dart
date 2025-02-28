import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class SalonsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SalonsLoadEvent extends SalonsEvent {
  final String token;
  final BuildContext context;

  SalonsLoadEvent({
    required this.token,
    required this.context,
  });

  @override
  List<Object> get props => [
        token,
        context,
      ];
}

class SearchSalonsEvent extends SalonsEvent {
  final String query;
  final BuildContext context;

  SearchSalonsEvent({
    required this.query,
    required this.context,
  });
}

class SalonDetailLoadEvent extends SalonsEvent {
  final String token;
  final String salonId;
  final BuildContext context;

  SalonDetailLoadEvent({
    required this.token,
    required this.salonId,
    required this.context,
  });

  @override
  List<Object> get props => [
        token,
        salonId,
        context,
      ];
}

class FavoriteToggleEvent extends SalonsEvent {
  final int salonId;
  final bool isFavorite;
  final String token;
  final BuildContext context;

  FavoriteToggleEvent({
    required this.salonId,
    required this.isFavorite,
    required this.token,
    required this.context,
  });

  @override
  List<Object> get props => [salonId, isFavorite];
}
