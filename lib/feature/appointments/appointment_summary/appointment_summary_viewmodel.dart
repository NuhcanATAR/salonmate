import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salonmate/feature/appointments/appointment_summary/appointment_summary_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/payment_type_control.dart';
import 'package:salonmate/product/mixin/appointment_mixin.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';

abstract class AppointmentSummaryViewModel
    extends BaseState<AppointmentSummaryView> with AppointmentMixin {
  late List<StylistAddServiceModel> selectedServiceDetails = [];

  late PaymentType? paymentType = PaymentType.payOnline;
  late bool switchValue = true;
  @override
  void initState() {
    super.initState();
    getInitial();
  }

  Future<void> getInitial() async {
    final token = await getAuthToken();
    if (token != null) {
      if (!mounted) return;
      context.read<AppointmentsBloc>().add(
            AppointmentSummaryEvent(
              token: token,
              salonId: widget.salonId,
              stylistId: widget.selectStylistModel.id,
              context: context,
            ),
          );
    } else {
      if (!mounted) return;
      loggerPrint.printInfoLog(
        AppLocalizations.of(context)!.appointment_summary_token_not_avaible,
      );
    }
  }

  double totalAddService(List<StylistAddServiceModel> selectedServiceDetails) {
    return selectedServiceDetails.fold(
      0.0,
      (sum, service) => sum + (service.price.toDouble()),
    );
  }

  Future<void> appointmentCreateFunc(
    AppointmentSummaryLoadedState state,
  ) async {
    final token = await getAuthToken();
    if (token != null) {
      final appointmentDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(
        DateTime(
          widget.selectDate.year,
          widget.selectDate.month,
          widget.selectDate.day,
          widget.selectTime.hour,
          widget.selectTime.minute,
        ),
      );

      final addServices = selectedServiceDetails
          .map(
            (service) => {"name": service.name, "price": service.price},
          )
          .toList();

      if (!mounted) return;
      context.read<AppointmentsBloc>().add(
            AppointmentCreateEvent(
              token: token,
              salonId: widget.salonId,
              serviceId: widget.serviceModel.id,
              stylistId: widget.selectStylistModel.id,
              appointmentDate: appointmentDate,
              servicePrice: widget.serviceModel.price.toDouble(),
              totalPrice: widget.serviceModel.price +
                  totalAddService(selectedServiceDetails),
              paymentType: paymentType!,
              addServices: addServices,
              serviceModel: widget.serviceModel,
              selectStylistModel: widget.selectStylistModel,
              selectDate: widget.selectDate,
              selectTime: widget.selectTime,
              selectedServiceDetails: selectedServiceDetails,
              salonDetailModel: state.salonDetailModel!,
              context: context,
            ),
          );
    } else {
      if (!mounted) return;
      loggerPrint.printInfoLog(
        AppLocalizations.of(context)!.appointment_token_not_avaible,
      );
    }
  }
}
