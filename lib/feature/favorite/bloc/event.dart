import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteSalonsEvent extends FavoriteEvent {
  final String token;

  const FavoriteSalonsEvent({required this.token});

  @override
  List<Object> get props => [token];
}

class FavoriteToggleEvent extends FavoriteEvent {
  final int salonId;
  final bool isFavorite;
  final String token;

  const FavoriteToggleEvent({
    required this.salonId,
    required this.isFavorite,
    required this.token,
  });

  @override
  List<Object> get props => [salonId, isFavorite];
}
