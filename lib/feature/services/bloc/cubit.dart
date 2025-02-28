import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/services/bloc/event.dart';
import 'package:salonmate/feature/services/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(ServicesInitialState()) {
    on<ServicesLoadedEvent>(_onServices);
  }

  Future<void> _onServices(
    ServicesLoadedEvent event,
    Emitter<ServicesState> emit,
  ) async {
    emit(ServicesLoadingState());
    try {
      final servicesCategoryResponse = await http.get(
        EndPoints.uriParse(EndPoints.salonServicesCategoryEndPoint),
        headers: ApiService.headerCategoryToken(
          event.token,
          event.categoryId,
        ),
      );

      if (servicesCategoryResponse.statusCode == 200) {
        final Map<String, dynamic> services =
            json.decode(servicesCategoryResponse.body);

        if (services == null ||
            services['services'] == null ||
            services['services'] is! List) {
          emit(
            ServicesErrorState(
              error:
                  'Hizmetler Yüklenirken bir hata oluştu, lütfen daha sonra tekrar deneyiniz!',
            ),
          );
          return;
        }

        final List<dynamic> rawServices = services['services'];
        final List<Service> servicesList = rawServices
            .map((e) => Service.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(
          ServicesLoadedState(
            services: servicesList,
          ),
        );
      } else {
        emit(
          ServicesErrorState(
            error:
                'Hizmetler Yüklenirken bir hata oluştu, lütfen daha sonra tekrar deneyiniz!',
          ),
        );
      }
    } catch (e) {
      emit(
        ServicesErrorState(
          error:
              'Hizmetler Yüklenirken bir hata oluştu, lütfen daha sonra tekrar deneyiniz!',
        ),
      );
    }
  }
}
