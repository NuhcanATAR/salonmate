import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointments_viewmodel.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/appointment_card.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends AppointmentsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.appointment_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          appointmentsBloc.add(
            AppointmentsFetchEvent(
              isRefresh: true,
              page: 1,
              limit: 10,
              context: context,
            ),
          );
        },
        child: BlocBuilder<AppointmentsBloc, AppointmentState>(
          buildWhen: (previous, current) {
            return current is AppointmentsLoadingState ||
                current is AppointmentsErrorState ||
                current is AppointmentsLoadedState;
          },
          builder: (context, state) {
            if (state is AppointmentsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AppointmentsErrorState) {
              return CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  dynamicViewExtensions.maxWidth(context),
                  dynamicViewExtensions.dynamicHeight(
                    context,
                    0.2,
                  ),
                ),
                title: 'Hata Oluştu!',
                subTitle: state.message,
              );
            } else if (state is AppointmentsLoadedState) {
              final allAppointments = state.appointments;

              return BlocConsumer<AppointmentsBloc, AppointmentState>(
                listener: appointmentUpdateBlocListener,
                builder: (context, listenerState) {
                  return buildBodyWidget(
                    allAppointments,
                    state,
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  // body
  Widget buildBodyWidget(
    List<Appointment> allAppointments,
    AppointmentsLoadedState state,
  ) =>
      Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: allAppointments.isEmpty
            ? CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  dynamicViewExtensions.maxWidth(context),
                  dynamicViewExtensions.dynamicHeight(
                    context,
                    0.2,
                  ),
                ),
                title:
                    AppLocalizations.of(context)!.appointment_not_found_title,
                subTitle: AppLocalizations.of(context)!
                    .appointment_not_found_sub_title,
              )
            : ListView.builder(
                controller: scrollController,
                itemCount: state.hasMore
                    ? allAppointments.length + 1
                    : allAppointments.length,
                itemBuilder: (context, index) {
                  if (index >= allAppointments.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final appointment = allAppointments[index];
                  return AppointmentCardWidget(
                    dynamicViewExtensions: dynamicViewExtensions,
                    appointment: appointment,
                    getMonthName: getMonthName,
                    updateAppointment: updateAppointment,
                  );
                },
              ),
      );
}
