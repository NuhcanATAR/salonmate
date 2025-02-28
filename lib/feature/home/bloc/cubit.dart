import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salonmate/feature/home/bloc/event.dart';
import 'package:salonmate/feature/home/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/category_model/category_model.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/provider/language_provider.dart';

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
      final languageProvider =
          Provider.of<LanguageProvider>(event.context, listen: false);

      final categoryResponse = await http.get(
        EndPoints.uriParse(EndPoints.serviceCategoriesEndPoint),
        headers: ApiService.headersLangToken(
          event.token,
          languageProvider.selectedLanguage,
        ),
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
          if (!event.context.mounted) return;
          emit(
            HomeError(
              AppLocalizations.of(event.context)!.home_category_error,
            ),
          );
          return;
        }

        if (salonData == null ||
            salonData['salons'] == null ||
            salonData['salons'] is! List) {
          if (!event.context.mounted) return;
          emit(HomeError(AppLocalizations.of(event.context)!.home_salon_error));
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
        if (!event.context.mounted) return;
        emit(
          HomeError(
            AppLocalizations.of(event.context)!.home_error,
          ),
        );
      }
    } catch (e) {
      if (!event.context.mounted) return;
      emit(HomeError(AppLocalizations.of(event.context)!.home_error));
    }
  }
}
