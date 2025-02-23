import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/appointment_date_model/appointment_date_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';

class AppointmentsBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentsBloc() : super(AppointmentInitialState()) {
    on<AppointmentFetchStylistEvent>(stylistFetch);
    on<AppointmentStylistSelectEvent>(stylistSelect);
    on<AppointmentDateFetchEvent>(appointmentDateFetch);
    on<AppointmentSelectDayEvent>(onSelectDay);
    on<AppointmentTimeSelectEvent>(onSelectTime);
  }

  Future<void> stylistFetch(
    AppointmentFetchStylistEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentStylistLoadingState());
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

  Future<void> appointmentDateFetch(
    AppointmentDateFetchEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentDateLoadingState());

    final response = await http.get(
      EndPoints.uriParse(EndPoints.appointmentsDateEndPoint),
      headers: {
        'Authorization': 'Bearer ${event.token}',
        'stylistId': event.stylistId.toString(),
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final appointments =
          data.map((e) => AppointmentDateModel.fromJson(e)).toList();

      if (appointments.isNotEmpty) {
        emit(
          AppointmnetDateLoadedState(
            appointments: appointments,
            selectedDate: appointments.first.date,
            selectedTime: DateTime.now(),
          ),
        );
      } else {
        emit(AppointmentDateErrorState(message: 'Randevu bulunamadı!'));
      }
    } else {
      emit(
        AppointmentDateErrorState(
          message: 'API Hatası: ${response.reasonPhrase}',
        ),
      );
    }
  }

  void onSelectDay(
    AppointmentSelectDayEvent event,
    Emitter<AppointmentState> emit,
  ) {
    if (state is AppointmnetDateLoadedState) {
      final currentState = state as AppointmnetDateLoadedState;
      emit(
        AppointmnetDateLoadedState(
          appointments: currentState.appointments,
          selectedDate: event.selectedDate,
          selectedTime: currentState.selectedTime,
        ),
      );
    }
  }

  void onSelectTime(
    AppointmentTimeSelectEvent event,
    Emitter<AppointmentState> emit,
  ) {
    if (state is AppointmnetDateLoadedState) {
      final currentState = state as AppointmnetDateLoadedState;
      emit(
        AppointmnetDateLoadedState(
          appointments: currentState.appointments,
          selectedDate: currentState.selectedDate,
          selectedTime: event.selectedTime,
        ),
      );
    }
  }
}
