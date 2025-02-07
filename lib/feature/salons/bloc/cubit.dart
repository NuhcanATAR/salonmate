import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/salons/bloc/event.dart';
import 'package:salonmate/feature/salons/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

class SalonsBloc extends Bloc<SalonsEvent, SalonsState> {
  List<SalonModel> allSalons = [];
  SalonsBloc() : super(SalonsInitialState()) {
    on<SalonsLoadEvent>(_onLoadSalons);
    on<SearchSalonsEvent>(_onSearchSalons);
  }

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

  Future<void> _onLoadSalons(
    SalonsLoadEvent event,
    Emitter<SalonsState> emit,
  ) async {
    try {
      final salonResponse = await http.get(
        EndPoints.uriParse(EndPoints.salonsEndPoint),
        headers: ApiService.headersToken(event.token),
      );

      if (salonResponse.statusCode == 200) {
        final salonData = jsonDecode(salonResponse.body);

        if (salonData == null ||
            salonData['salons'] == null ||
            salonData['salons'] is! List) {
          emit(
            SalonErrorState(
              errorMessage: "No expected data from API for salons!",
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
        emit(
          SalonErrorState(
            errorMessage: 'API Error: ${salonResponse.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(
        SalonErrorState(errorMessage: 'Connection Error'),
      );
    }
  }
}
