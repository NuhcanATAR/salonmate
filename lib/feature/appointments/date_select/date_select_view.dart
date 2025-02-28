import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/feature/appointments/date_select/date_select_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/model/appointment_date_model/appointment_date_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/day_card.dart';
import 'package:salonmate/product/widget/widget/hour_card.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';

class DateSelectView extends StatefulWidget {
  const DateSelectView({
    super.key,
    required this.salonId,
    required this.serviceModel,
    required this.stylistModel,
  });

  final int salonId;
  final Service serviceModel;
  final StylistModel stylistModel;

  @override
  State<DateSelectView> createState() => _DateSelectViewState();
}

class _DateSelectViewState extends DateSelectViewModel {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDateSelectDialog(
        context,
        dynamicViewExtensions,
        widget.salonId,
        widget.serviceModel,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        appBar: AppBar(
          backgroundColor: ColorConstant.appBarColor,
          surfaceTintColor: ColorConstant.appBarColor,
          leading: IconButton(
            onPressed: () async {
              final token = await getAuthToken();
              if (token != null) {
                if (!context.mounted) return;
                Navigator.pop(context);
                context.read<AppointmentsBloc>().add(
                      AppointmentFetchStylistEvent(
                        salonId: widget.salonId,
                        serviceId: widget.serviceModel.id,
                        token: token,
                      ),
                    );
              } else {
                loggerPrint.printErrorLog('Token is empty');
              }
            },
            icon: AppIcons.arrowLeft.toSvgImg(
              Colors.black,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
          ),
          title: const BodyMediumBlackBoldText(
            text: 'Date and time',
            textAlign: TextAlign.left,
          ),
        ),
        body: BlocBuilder<AppointmentsBloc, AppointmentState>(
          builder: (context, state) {
            if (state is AppointmentDateLoadingState) {
              return const CustomLoadingResponseWidget(
                title: 'Randevu Tarihleri Yükleniyor',
                subTitle: 'Lütfen Bekleyiniz...',
              );
            } else if (state is AppointmnetDateLoadedState) {
              final selectedDayAppointments = state.appointments
                  .firstWhere(
                    (element) => element.date == state.selectedDate,
                    orElse: () => AppointmentDateModel(
                      date: state.selectedDate,
                      availableTimes: [],
                    ),
                  )
                  .availableTimes;
              return buildBodyWidget(
                state,
                selectedDayAppointments,
              );
            } else if (state is AppointmentDateErrorState) {
              return CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  dynamicViewExtensions.maxWidth(context),
                  dynamicViewExtensions.dynamicHeight(
                    context,
                    0.2,
                  ),
                ),
                title: 'Randevu Tarihleri Bulunamadı',
                subTitle: state.message,
              );
            } else {
              return CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  dynamicViewExtensions.maxWidth(context),
                  dynamicViewExtensions.dynamicHeight(
                    context,
                    0.2,
                  ),
                ),
                title: 'Randevu Tarihleri Bulunamadı!',
                subTitle:
                    'Randevu Tarihlerini yüklerken bir hata oluştu sanırım, lütfen daha sonra tekrar deneyiniz.',
              );
            }
          },
        ),
      ),
    );
  }

  // body
  Widget buildBodyWidget(
    AppointmnetDateLoadedState state,
    List<String> selectedDayAppointments,
  ) =>
      Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: Column(
          children: <Widget>[
            // body
            Expanded(
              child: Column(
                children: <Widget>[
                  // title
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.top(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const TitleMediumBlackBoldText(
                          text: 'Select Date',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  // select day
                  buildSelectDayWidget(state),
                  // select time
                  buildSelectTimeWidget(state, selectedDayAppointments),
                ],
              ),
            ),
            // footer button
            buildFooterButtonWidget(state),
          ],
        ),
      );

  // select day
  Widget buildSelectDayWidget(AppointmnetDateLoadedState state) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 3,
      child: Padding(
        padding: BaseUtility.all(BaseUtility.paddingMediumValue),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.appointments.length,
          itemBuilder: (context, index) {
            final appointment = state.appointments[index];
            final bool isSelected = appointment.date == state.selectedDate;

            return DayCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              borderColor: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              appointment: appointment.date,
              onTap: () {
                context
                    .read<AppointmentsBloc>()
                    .add(AppointmentSelectDayEvent(appointment.date));
              },
            );
          },
        ),
      ),
    );
  }

  // select time widget
  Widget buildSelectTimeWidget(
    AppointmnetDateLoadedState state,
    List<String> selectedDayAppointments,
  ) {
    return Expanded(
      flex: 10,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
              child: TitleMediumBlackBoldText(
                text:
                    'Seçili Gün: ${state.selectedDate.day}.${state.selectedDate.month}.${state.selectedDate.year}',
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedDayAppointments.length,
              itemBuilder: (context, index) {
                final timeParts = selectedDayAppointments[index].split(':');
                final selectedHour = int.parse(timeParts[0]);
                final selectedMinute = int.parse(timeParts[1]);

                final bool isSelected =
                    state.selectedTime.hour == selectedHour &&
                        state.selectedTime.minute == selectedMinute;

                return HourCardWidget(
                  onTap: () {
                    context.read<AppointmentsBloc>().add(
                          AppointmentTimeSelectEvent(
                            DateTime(
                              state.selectedDate.year,
                              state.selectedDate.month,
                              state.selectedDate.day,
                              selectedHour,
                              selectedMinute,
                            ),
                          ),
                        );
                  },
                  text: selectedDayAppointments[index],
                  borderColor: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // footer button
  Widget buildFooterButtonWidget(AppointmnetDateLoadedState state) =>
      CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'Confirm Appointment',
        func: () => appointmentNextFunc(state),
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
