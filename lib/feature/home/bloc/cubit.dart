import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/home/bloc/event.dart';
import 'package:salonmate/feature/home/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/category_model/category_model.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadEvent>(_onLoadCategorysAndSalons);
  }

  Future<void> _onLoadCategorysAndSalons(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());

    try {
      final categoryResponse = await http.get(
        EndPoints.uriParse(EndPoints.serviceCategoriesEndPoint),
        headers: ApiService.headersLangToken(event.token, 'tr'),
      );

      final salonResponse = await http.get(
        EndPoints.uriParse(EndPoints.salonsEndPoint),
        headers: ApiService.headersToken(event.token),
      );

      if (categoryResponse.statusCode == 200 &&
          salonResponse.statusCode == 200) {
        final categoryData = jsonDecode(categoryResponse.body);
        final salonData = jsonDecode(salonResponse.body);

        if (categoryData == null ||
            !categoryData.containsKey('services_categories')) {
          emit(HomeError("No expected data from API for categories!"));
          return;
        }

        if (salonData == null ||
            salonData['salons'] == null ||
            salonData['salons'] is! List) {
          emit(HomeError("No expected data from API for salons!"));
          return;
        }

        final List<dynamic> rawCategories = categoryData['services_categories'];
        final List<ServiceCategory> categories = rawCategories
            .map((e) => ServiceCategory.fromJson(e ?? {}))
            .toList();

        final List<dynamic> rawSalons = salonData['salons'] as List<dynamic>;
        final List<SalonModel> salons = rawSalons
            .map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(
          HomeLoaded(
            categorys: categories,
            salons: salons,
          ),
        );
      } else {
        emit(
          HomeError(
            "Error loading data",
          ),
        );
      }
    } catch (e) {
      emit(HomeError("Error loading data"));
    }
  }
}
