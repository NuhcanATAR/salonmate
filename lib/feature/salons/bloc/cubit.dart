import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/salons/bloc/event.dart';
import 'package:salonmate/feature/salons/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';

import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';

class SalonsBloc extends Bloc<SalonsEvent, SalonsState> {
  List<SalonModel> allSalons = [];
  SalonsBloc() : super(SalonsInitialState()) {
    on<SalonsLoadEvent>(_onLoadSalons);
    on<SearchSalonsEvent>(_onSearchSalons);
    on<SalonDetailLoadEvent>(_onSalonDetail);
    on<FavoriteToggleEvent>(_onToggleFavorite);
  }

  // search salons
  void _onSearchSalons(
    SearchSalonsEvent event,
    Emitter<SalonsState> emit,
  ) {
    final query = event.query.toLowerCase();

    if (query.length >= 3) {
      final filteredSalons = allSalons
          .where((salon) => salon.name.toLowerCase().contains(query))
          .toList();

      emit(FilteredSalonsState(filteredSalons: filteredSalons));
    } else {
      emit(FilteredSalonsState(filteredSalons: allSalons));
    }
  }

  // salons fetch
  Future<void> _onLoadSalons(
    SalonsLoadEvent event,
    Emitter<SalonsState> emit,
  ) async {
    try {
      emit(SalonsLoadingState());
      final salonResponse = await http.get(
        EndPoints.uriParse(EndPoints.salonsEndPoint),
        headers: ApiService.headersToken(event.token),
      );

      if (salonResponse.statusCode == 200) {
        final salonData = jsonDecode(salonResponse.body);

        if (salonData == null ||
            salonData['salons'] == null ||
            salonData['salons'] is! List) {
          if (!event.context.mounted) return;
          emit(
            SalonErrorState(
              errorMessage: AppLocalizations.of(event.context)!.salons_error,
            ),
          );
          return;
        }

        final List<dynamic> rawSalons = salonData['salons'] as List<dynamic>;
        final List<SalonModel> salons = rawSalons
            .map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
            .toList();
        allSalons = salons;
        emit(
          SalonLoadedState(
            salons: salons,
          ),
        );
      } else {
        if (!event.context.mounted) return;
        emit(
          SalonErrorState(
            errorMessage: AppLocalizations.of(event.context)!.salons_error,
          ),
        );
      }
    } catch (e) {
      if (!event.context.mounted) return;
      emit(
        SalonErrorState(
          errorMessage: AppLocalizations.of(event.context)!.salons_error,
        ),
      );
    }
  }

  // salon detail
  Future<void> _onSalonDetail(
    SalonDetailLoadEvent event,
    Emitter<SalonsState> emit,
  ) async {
    try {
      emit(SalonDetailLoadingState());

      final salonDetailResponse = await http.get(
        EndPoints.uriParse(EndPoints.salonDetailEndPoint),
        headers: ApiService.headerSalonToken(
          event.token,
          event.salonId,
        ),
      );

      final salonAllServiceResponse = await http.get(
        EndPoints.uriParse(EndPoints.salonAllServicesEndPoint),
        headers: ApiService.headerSalonToken(
          event.token,
          event.salonId,
        ),
      );

      if (salonDetailResponse.statusCode == 200 &&
          salonAllServiceResponse.statusCode == 200) {
        final Map<String, dynamic> salonDetailData =
            jsonDecode(salonDetailResponse.body);

        if (salonDetailData['salon'] == null ||
            salonDetailData['salon'] is! Map<String, dynamic>) {
          if (!event.context.mounted) return;
          emit(
            SalonDetailErrorState(
              errorMessage:
                  AppLocalizations.of(event.context)!.salons_salon_detail_error,
            ),
          );
          return;
        }

        final SalonDetailModel salonDetail =
            SalonDetailModel.fromJson(salonDetailData['salon']);

        final Map<String, dynamic> salonServices =
            jsonDecode(salonAllServiceResponse.body);

        if (salonServices['services'] == null ||
            salonServices['services'] is! List) {
          if (!event.context.mounted) return;
          emit(
            SalonDetailErrorState(
              errorMessage: AppLocalizations.of(event.context)!
                  .salons_salon_services_error,
            ),
          );
          return;
        }

        final List<dynamic> rawServices = salonServices['services'];
        final List<Service> services = rawServices
            .map((e) => Service.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(
          SalonDetailLoadedState(
            salonModel: salonDetail,
            services: services,
          ),
        );
      } else {
        if (!event.context.mounted) return;
        emit(
          SalonDetailErrorState(
            errorMessage:
                AppLocalizations.of(event.context)!.salons_second_error,
          ),
        );
      }
    } catch (e) {
      if (!event.context.mounted) return;
      emit(
        SalonDetailErrorState(
          errorMessage: AppLocalizations.of(event.context)!.salons_catch_error,
        ),
      );
    }
  }

  // toggle favorite
  Future<void> _onToggleFavorite(
    FavoriteToggleEvent event,
    Emitter<SalonsState> emit,
  ) async {
    final response = await http.post(
      EndPoints.uriParse(
        EndPoints.favoriteToggleEndPoint,
      ),
      headers: ApiService.headersToken(event.token),
      body: jsonEncode(
        ApiService.toFavoriteToggleBody(
          event.salonId,
        ),
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(
        FavoriteToggleSuccessState(
          isFavorite: !event.isFavorite,
        ),
      );
      if (!event.context.mounted) return;
      await CodeNoahDialogs(event.context).showFlush(
        type: SnackType.success,
        message: response.statusCode == 200
            ? AppLocalizations.of(event.context)!.salons_favorite_remove
            : AppLocalizations.of(event.context)!.salons_favorite_add,
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        FavoriteToggleErrorState(
          message:
              AppLocalizations.of(event.context)!.salons_favorite_toggle_error,
        ),
      );
    }
  }
}
