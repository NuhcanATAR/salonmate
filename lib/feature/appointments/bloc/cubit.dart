import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/appointment_date_model/appointment_date_model.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/provider/language_provider.dart';

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
    on<AppointmentsFetchEvent>(_onFetchAppointments);
    on<AppointmentUpdateEvent>(appointmentUpdate);
    on<AppointmentEvaluationCreateEvent>(evaluationCreate);
  }

  final prefService = PrefService();
  int currentPage = 1;
  bool isFetching = false;
  List<Appointment> allAppointments = [];

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
      if (!event.context.mounted) return;
      emit(
        AppointmentStylistErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.appointment_stylist_error,
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
      headers: ApiService.headerAppointmentDateToken(
        event.token,
        event.stylistId,
      ),
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
        if (!event.context.mounted) return;
        emit(
          AppointmentDateErrorState(
            message: AppLocalizations.of(event.context)!.appointment_date_error,
          ),
        );
      }
    } else {
      if (!event.context.mounted) return;
      emit(
        AppointmentDateErrorState(
          message:
              AppLocalizations.of(event.context)!.appointment_date_second_error,
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
    try {
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

      if (response.statusCode == 200 && responseSalon.statusCode == 200) {
        final List<dynamic> jsonAddService = jsonDecode(response.body);
        final List<StylistAddServiceModel> stylistAddService = jsonAddService
            .map((e) => StylistAddServiceModel.fromJson(e))
            .toList();

        final Map<String, dynamic> salonDetailData =
            jsonDecode(responseSalon.body);

        if (salonDetailData['salon'] == null ||
            salonDetailData['salon'] is! Map<String, dynamic>) {
          if (!event.context.mounted) return;
          emit(
            AppointmentSummaryErrorState(
              message:
                  AppLocalizations.of(event.context)!.appointment_summary_error,
            ),
          );
          return;
        }

        final SalonDetailModel salonDetailModel =
            SalonDetailModel.fromJson(salonDetailData['salon']);

        emit(
          AppointmentSummaryLoadedState(
            stylistAddService: stylistAddService,
            salonDetailModel: salonDetailModel,
            selectedServices: const [],
          ),
        );
      } else {
        if (!event.context.mounted) return;
        emit(
          AppointmentSummaryErrorState(
            message: AppLocalizations.of(event.context)!
                .appointment_date_second_error,
          ),
        );
      }
    } catch (e) {
      if (!event.context.mounted) return;
      emit(
        AppointmentSummaryErrorState(
          message:
              AppLocalizations.of(event.context)!.appointment_date_second_error,
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
      body: jsonEncode(
        ApiService.toAppointmentCreateBody(
          event.salonId,
          event.serviceId,
          event.stylistId,
          event.appointmentDate,
          event.servicePrice,
          event.totalPrice,
          event.paymentType,
          event.addServices,
        ),
      ),
    );

    if (response.statusCode == 201) {
      if (!event.context.mounted) return;
      emit(
        AppointmentCreateSuccessState(
          message:
              AppLocalizations.of(event.context)!.appointmnet_create_success,
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
      if (!event.context.mounted) return;
      emit(
        AppointmentCreateErrorState(
          message: AppLocalizations.of(event.context)!.appointment_create_error,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        AppointmentCreateErrorState(
          message: AppLocalizations.of(event.context)!
              .appointment_create_second_error,
        ),
      );
    }
  }

  Future<void> _onFetchAppointments(
    AppointmentsFetchEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    if (isFetching) return;

    try {
      final languageProvider =
          Provider.of<LanguageProvider>(event.context, listen: false);
      isFetching = true;
      if (event.isRefresh) {
        emit(AppointmentsLoadingState());
        currentPage = 1;
        allAppointments.clear();
      }

      final token = await prefService.getString(SharedKeys.token) ?? '';
      final response = await http.get(
        Uri.parse(
          "${EndPoints.appointmentsUserEndPoint}?page=${event.page}&limit=${event.limit}",
        ),
        headers: ApiService.headersLangToken(
          token,
          languageProvider.selectedLanguage,
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> newAppointmentsJson = data['appointments'] ?? [];

        final List<Appointment> newAppointments = newAppointmentsJson
            .map((json) => Appointment.fromJson(json))
            .toList();

        if (event.isRefresh) {
          allAppointments = newAppointments;
        } else {
          allAppointments.addAll(newAppointments);
        }

        final bool hasMore = newAppointments.length == event.limit;
        emit(
          AppointmentsLoadedState(
            appointments: List.from(allAppointments),
            hasMore: hasMore,
          ),
        );

        if (hasMore) currentPage++;
      } else {
        if (!event.context.mounted) return;
        emit(
          AppointmentsErrorState(
            message: AppLocalizations.of(event.context)!.appointment_error,
          ),
        );
      }
    } catch (e) {
      if (!event.context.mounted) return;
      emit(
        AppointmentsErrorState(
          message: AppLocalizations.of(event.context)!.appointment_second_error,
        ),
      );
    } finally {
      isFetching = false;
    }
  }

  Future<void> appointmentUpdate(
    AppointmentUpdateEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentUpdateLoadingState());

    final response = await http.put(
      EndPoints.uriParse(EndPoints.appointmentsUpdateEndPoint),
      headers: ApiService.headersToken(
        event.token,
      ),
      body: jsonEncode(
        ApiService.toAppointmentUpdateBody(
          event.appointmentId,
          event.status,
        ),
      ),
    );

    if (response.statusCode == 200) {
      if (!event.context.mounted) return;
      emit(
        AppointmentUpdateSuccesState(
          message:
              AppLocalizations.of(event.context)!.appointment_update_success,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        AppointmentUpdateErrorState(
          message:
              AppLocalizations.of(event.context)!.apppointment_update_error,
        ),
      );
    }
  }

  Future<void> evaluationCreate(
    AppointmentEvaluationCreateEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentEvaluationLoadingState());

    final response = await http.post(
      EndPoints.uriParse(EndPoints.evaluationCreateEndPoint),
      headers: ApiService.headersToken(event.token),
      body: jsonEncode(
        ApiService.toEvaluationCreateBody(
          event.appointmentId,
          event.salonId,
          event.point,
          event.description,
        ),
      ),
    );

    if (response.statusCode == 201) {
      Logger().i(response.body);
      if (!event.context.mounted) return;
      emit(
        AppointmentEvaluationSuccessState(
          message: AppLocalizations.of(event.context)!
              .appointment_evaluation_success,
        ),
      );
    } else {
      Logger().i(response.body);
      if (!event.context.mounted) return;
      emit(
        AppointmentEvaluationErrorState(
          message:
              AppLocalizations.of(event.context)!.appointment_evaluation_error,
        ),
      );
    }
  }
}
