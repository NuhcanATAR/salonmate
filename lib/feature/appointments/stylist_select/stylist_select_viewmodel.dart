import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/feature/appointments/date_select/date_select_view.dart';
import 'package:salonmate/feature/appointments/stylist_select/stylist_select_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';

abstract class StylistSelectViewModel extends BaseState<StylistSelectView> {
  @override
  void initState() {
    super.initState();
    fetchInitial();
  }

  Future<void> fetchInitial() async {
    final token = await getAuthToken();
    if (token != null) {
      if (!mounted) return;
      context.read<AppointmentsBloc>().add(
            AppointmentFetchStylistEvent(
              salonId: widget.salonId,
              serviceId: widget.serviceModel.id,
              token: token,
              context: context,
            ),
          );
    } else {
      if (!mounted) return;
      loggerPrint.printErrorLog(
        AppLocalizations.of(context)!.appointment_stylist_token_not_avaible,
      );
    }
  }

  Future<void> nextSectionFunc(AppointmentStylistLoadedState state) async {
    if (state.selectedStylist != null) {
      CodeNoahNavigatorRouter.push(
        context,
        DateSelectView(
          salonId: widget.salonId,
          serviceModel: widget.serviceModel,
          stylistModel: state.selectedStylist!,
        ),
      );
    } else {
      await CodeNoahDialogs(context).showFlush(
        type: SnackType.warning,
        message: AppLocalizations.of(context)!.appointment_stylist_select_error,
      );
    }
  }
}
