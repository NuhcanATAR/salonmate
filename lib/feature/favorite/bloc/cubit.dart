import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/favorite/bloc/event.dart';
import 'package:salonmate/feature/favorite/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitialState()) {
    on<FavoriteSalonsEvent>(_onFavoriteSalons);
    on<FavoriteToggleEvent>(_onToggleFavorite);
  }

  Future<void> _onFavoriteSalons(
    FavoriteSalonsEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoadingState());
    try {
      final response = await http.get(
        EndPoints.uriParse(EndPoints.favoriteSalonsEndPoint),
        headers: ApiService.headersToken(event.token),
      );

      if (response.statusCode == 200) {
        final List<dynamic> rawFavorites = jsonDecode(response.body);

        if (rawFavorites.isEmpty) {
          if (!event.context.mounted) return;
          emit(
            FavoriteErrorState(
              error: AppLocalizations.of(event.context)!.favorite_error,
            ),
          );
          return;
        }

        final List<SalonModel> favorites = rawFavorites
            .map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
            .toList();
        if (!event.context.mounted) return;
        emit(FavoriteLoadedState(salons: favorites));
      } else {
        if (!event.context.mounted) return;
        emit(
          FavoriteErrorState(
            error: AppLocalizations.of(event.context)!.favorite_second_error,
          ),
        );
      }
    } catch (e) {
      emit(
        FavoriteErrorState(
          error: AppLocalizations.of(event.context)!.favorite_second_error,
        ),
      );
    }
  }

  Future<void> _onToggleFavorite(
    FavoriteToggleEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final response = await http.post(
      EndPoints.uriParse(
        EndPoints.favoriteToggleEndPoint,
      ),
      headers: ApiService.headersToken(event.token),
      body: jsonEncode({
        'salonId': event.salonId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(
        FavoriteToggleSuccessState(
          isFavorite: !event.isFavorite,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        FavoriteToggleErrorState(
          message: AppLocalizations.of(event.context)!.favorite_toggle_error,
        ),
      );
    }
  }
}
