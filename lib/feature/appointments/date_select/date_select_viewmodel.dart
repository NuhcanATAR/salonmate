import 'package:provider/provider.dart';
import 'package:salonmate/feature/appointments/appointment_summary/appointment_summary_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/feature/appointments/date_select/date_select_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/mixin/appointment_mixin.dart';

import '../../../product/core/base/helper/navigator_router.dart';

abstract class DateSelectViewModel extends BaseState<DateSelectView>
    with AppointmentMixin {
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
            AppointmentDateFetchEvent(
              token: token,
              stylistId: widget.stylistModel.id,
              context: context,
            ),
          );
    } else {
      if (!mounted) return;
      loggerPrint.printInfoLog(
        AppLocalizations.of(context)!.appointment_date_select_token_not_avaible,
      );
    }
  }

  void appointmentNextFunc(AppointmnetDateLoadedState state) {
    final DateTime selectTime = state.selectedTime;

    final List<int> validHours = [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

    if (!validHours.contains(selectTime.hour) || selectTime.minute != 0) {
      CodeNoahDialogs(context).showFlush(
        type: SnackType.error,
        message: AppLocalizations.of(context)!
            .appointment_date_select_hour_select_error,
      );
    } else {
      CodeNoahNavigatorRouter.push(
        context,
        AppointmentSummaryView(
          salonId: widget.salonId,
          serviceModel: widget.serviceModel,
          selectStylistModel: widget.stylistModel,
          selectDate: state.selectedDate,
          selectTime: state.selectedTime,
        ),
      );
    }
  }
}
