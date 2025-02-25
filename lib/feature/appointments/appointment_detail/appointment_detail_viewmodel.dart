import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointment_detail/appointment_detail_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/appointments_control.dart';
import 'package:salonmate/product/mixin/appointment_mixin.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';

abstract class AppointmentDetailViewModel
    extends BaseState<AppointmentDetailView> with AppointmentMixin {
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
