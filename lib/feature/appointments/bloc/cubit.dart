import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';

class AppointmentsBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentsBloc() : super(AppointmentInitialState()) {
    on<AppointmentFetchStylistEvent>(stylistFetch);
    on<AppointmentStylistSelectEvent>(stylistSelect);
  }

  Future<void> stylistFetch(
    AppointmentFetchStylistEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    final response = await http.get(
      EndPoints.uriParse(EndPoints.stylistEndPoint),
      headers: ApiService.headerStylistToken(
        event.token,
        event.salonId,
        event.serviceId,
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonStylist = jsonDecode(response.body);
      final List<StylistModel> stylist =
          jsonStylist.map((e) => StylistModel.fromJson(e)).toList();

      emit(
        AppointmentStylistLoadedState(
          stylist: stylist,
        ),
      );
    } else {
      emit(
        AppointmentStylistErrorState(
          errorMessage:
              'Çalışanlar Yüklenirken bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }

  Future<void> stylistSelect(
    AppointmentStylistSelectEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    if (state is AppointmentStylistLoadedState) {
      final currentState = state as AppointmentStylistLoadedState;
      final newSelected = currentState.selectedStylist == event.selectStylist
          ? null
          : event.selectStylist;
      emit(
        AppointmentStylistLoadedState(
          stylist: currentState.stylist,
          selectedStylist: newSelected,
        ),
      );
    }
  }
}
