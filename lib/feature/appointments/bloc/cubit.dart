import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/appointment_date_model/appointment_date_model.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';

import '../../../product/core/base/helper/payment_type_control.dart';

class AppointmentsBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentsBloc() : super(AppointmentInitialState()) {
    on<AppointmentFetchStylistEvent>(stylistFetch);
    on<AppointmentStylistSelectEvent>(stylistSelect);
    on<AppointmentDateFetchEvent>(appointmentDateFetch);
    on<AppointmentSelectDayEvent>(onSelectDay);
    on<AppointmentTimeSelectEvent>(onSelectTime);
    on<AppointmentSummaryEvent>(stylistAddServiceFetch);
    on<AppointmentToggleServiceSelectionEvent>(addServiceToggleSelection);
    on<AppointmentCreateEvent>(appointmentCreate);
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

  Future<void> stylistAddServiceFetch(
    AppointmentSummaryEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentSummaryLoadingState());

    final response = await http.get(
      EndPoints.uriParse(
        EndPoints.stylistAddServiceEndPoint,
      ),
      headers: ApiService.headerStylistAddServiceToken(
        event.token,
        event.salonId,
      ),
    );

    final responseSalon = await http.get(
      EndPoints.uriParse(EndPoints.salonDetailEndPoint),
      headers: ApiService.headerSalonToken(
        event.token,
        event.salonId.toString(),
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonAddService = jsonDecode(response.body);
      final List<StylistAddServiceModel> stylistAddService = jsonAddService
          .map((e) => StylistAddServiceModel.fromJson(e))
          .toList();

      final Map<String, dynamic> salonDetailData =
          jsonDecode(responseSalon.body);

      if (salonDetailData == null || salonDetailData['salon'] is! List) {
        emit(
          AppointmentSummaryErrorState(
            message:
                'Salon Bilgileri alınırken bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
          ),
        );
        return;
      }

      final List<dynamic> rawSalon = salonDetailData['salon'];

      final Map<String, dynamic> rawSalonDetail = rawSalon.first;

      final SalonDetailModel salonDetailModel =
          SalonDetailModel.fromJson(rawSalonDetail);

      emit(
        AppointmentSummaryLoadedState(
          stylistAddService: stylistAddService,
          salonDetailModel: salonDetailModel,
          selectedServices: const [],
        ),
      );
    } else {
      emit(
        AppointmentSummaryErrorState(
          message:
              'Ek Hizmetler Yüklenirken bir sorun oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }

  Future<void> addServiceToggleSelection(
    AppointmentToggleServiceSelectionEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    if (state is AppointmentSummaryLoadedState) {
      final currentState = state as AppointmentSummaryLoadedState;
      final updatedSelectedServices =
          List<int>.from(currentState.selectedServices ?? []);

      if (updatedSelectedServices.contains(event.serviceId)) {
        updatedSelectedServices.remove(event.serviceId);
      } else {
        updatedSelectedServices.add(event.serviceId);
      }

      emit(
        AppointmentSummaryLoadedState(
          stylistAddService: currentState.stylistAddService,
          salonDetailModel: currentState.salonDetailModel,
          selectedServices: updatedSelectedServices,
        ),
      );
    }
  }

  Future<void> appointmentCreate(
    AppointmentCreateEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    final response = await http.post(
      EndPoints.uriParse(
        EndPoints.appointmentCreateEndPoint,
      ),
      headers: ApiService.headersToken(
        event.token,
      ),
      body: jsonEncode({
        "salonsId": event.salonId,
        "servicesId": event.serviceId,
        "stylistId": event.stylistId,
        "appointmentDate": event.appointmentDate,
        "servicePrice": event.servicePrice,
        "totalPrice": event.totalPrice,
        "paymentType":
            event.paymentType == PaymentType.payOnline ? true : false,
        "addServices": event.addServices,
      }),
    );

    if (response.statusCode == 201) {
      emit(
        AppointmentCreateSuccessState(
          message:
              'Randevunu başarıyla oluşturuldu, randevunu randevular bölümünden takip edebilirsiniz.',
          salonId: event.salonId,
          serviceModel: event.serviceModel,
          selectStylistModel: event.selectStylistModel,
          selectDate: event.selectDate,
          selectTime: event.selectTime,
          selectedServiceDetails: event.selectedServiceDetails,
          salonDetailModel: event.salonDetailModel,
        ),
      );
    } else if (response.statusCode == 409) {
      emit(
        AppointmentCreateErrorState(
          message:
              'Randevu Tarihiniz alınmıştır, lütfen başka bir tarih ve saat için seçim yapınız.',
        ),
      );
    } else {
      emit(
        AppointmentCreateErrorState(
          message:
              'Randevunu oluşturulamadı, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }
}
