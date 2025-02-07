import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/salons/bloc/event.dart';
import 'package:salonmate/feature/salons/bloc/state.dart';
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
        // salon detail
        final Map<String, dynamic> salonDetailData =
            jsonDecode(salonDetailResponse.body);

        if (salonDetailData == null ||
            salonDetailData['salon'] == null ||
            salonDetailData['salon'] is! List) {
          emit(
            SalonDetailErrorState(
              errorMessage: 'Beklenen API verisi bulunamadı!',
            ),
          );
          return;
        }

        final List<dynamic> rawSalonList = salonDetailData['salon'];

        if (rawSalonList.isEmpty) {
          emit(SalonDetailErrorState(errorMessage: 'Salon listesi boş!'));
          return;
        }

        final Map<String, dynamic> rawSalonDetail = rawSalonList.first;

        final SalonDetailModel salonDetail =
            SalonDetailModel.fromJson(rawSalonDetail);

        // services
        final Map<String, dynamic> salonServices =
            json.decode(salonAllServiceResponse.body);

        if (salonServices == null ||
            salonServices['services'] == null ||
            salonServices['services'] is! List) {
          emit(
            SalonDetailErrorState(
              errorMessage: 'Servisler beklenen API verisi bulunamadı!',
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
        emit(
          SalonDetailErrorState(
            errorMessage: 'API Hatası: ${salonDetailResponse.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(
        SalonDetailErrorState(
          errorMessage: 'Beklenmeyen bir hata oluştu: $e',
        ),
      );
    }
  }
}
