import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteSalonsEvent extends FavoriteEvent {
  final String token;
  final BuildContext context;

  const FavoriteSalonsEvent({
    required this.token,
    required this.context,
  });

  @override
  List<Object> get props => [token, context];
}

class FavoriteToggleEvent extends FavoriteEvent {
  final int salonId;
  final bool isFavorite;
  final String token;
  final BuildContext context;

  const FavoriteToggleEvent({
    required this.salonId,
    required this.isFavorite,
    required this.token,
    required this.context,
  });

  @override
  List<Object> get props => [
        salonId,
        isFavorite,
        context,
      ];
}
