import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointments_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/appointments_control.dart';
import 'package:salonmate/product/mixin/appointment_mixin.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';

abstract class AppointmentsViewModel extends BaseState<AppointmentsView>
    with AppointmentMixin {
  late ScrollController scrollController;
  late AppointmentsBloc appointmentsBloc;

  @override
  void initState() {
    super.initState();
    appointmentsBloc = BlocProvider.of<AppointmentsBloc>(context);
    scrollController = ScrollController()..addListener(_onScroll);
    appointmentsBloc
        .add(AppointmentsFetchEvent(page: 1, limit: 10, isRefresh: true));
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !appointmentsBloc.isFetching) {
      appointmentsBloc.add(
        AppointmentsFetchEvent(
          page: appointmentsBloc.currentPage,
          limit: 10,
        ),
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> updateAppointment(
    Appointment appointment,
    AppointmentsStatus status,
  ) async {
    final token = await getAuthToken();
    if (token != null) {
      if (!mounted) return;
      context.read<AppointmentsBloc>().add(
            AppointmentUpdateEvent(
              token: token,
              status: status,
              appointmentId: appointment.id,
            ),
          );
    } else {
      loggerPrint.printErrorLog('Token is empty');
    }
  }
}
