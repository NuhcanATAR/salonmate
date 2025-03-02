import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/appointment_detail/appointment_detail_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/appointments_control.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.appointment,
    required this.getMonthName,
    required this.updateAppointment,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Appointment appointment;
  final Function(DateTime date) getMonthName;
  final Function(Appointment appointment, AppointmentsStatus status)
      updateAppointment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      child: Container(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        margin: BaseUtility.bottom(
          BaseUtility.marginNormalValue,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              BaseUtility.radiusCircularMediumValue,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            // appointment date and category
            buildAppointmentDateCategoryWidget(context),
            // appointment information
            buildAppointmentInformationWidget(context),
            // appointment update
            appointment.appointmentsCategoryId ==
                    AppointmentsStatus.updatedAppointment.appointmentStatus
                ? buildAppointmentUpdateButtonsWidget(context)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  // appointment date and category
  Widget buildAppointmentDateCategoryWidget(BuildContext context) => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Padding(
          padding: BaseUtility.bottom(
            BaseUtility.paddingSmallValue,
          ),
          child: Row(
            children: <Widget>[
              // appointment date
              Expanded(
                child: Padding(
                  padding: BaseUtility.right(
                    BaseUtility.paddingSmallValue,
                  ),
                  child: BodyMediumBlackText(
                    text:
                        '${getMonthName(appointment.appointmentsDate)} ${appointment.appointmentsDate.day}, ${appointment.appointmentsDate.year} - ${appointment.appointmentsDate.hour.toString().padLeft(2, '0')}:${appointment.appointmentsDate.minute.toString().padLeft(2, '0')}',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // category
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: BaseUtility.left(
                    BaseUtility.paddingSmallValue,
                  ),
                  child: BodyMediumBlackText(
                    text: appointment.appointmentCategory,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // appointment information
  Widget buildAppointmentInformationWidget(BuildContext context) =>
      GestureDetector(
        onTap: () => CodeNoahNavigatorRouter.push(
          context,
          AppointmentDetailView(
            appointmentModel: appointment,
          ),
        ),
        child: Padding(
          padding: BaseUtility.vertical(
            BaseUtility.paddingMediumValue,
          ),
          child: Row(
            children: <Widget>[
              // salon image
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: SizedBox(
                  height: dynamicViewExtensions.dynamicHeight(context, 0.11),
                  child: Container(
                    padding: BaseUtility.all(
                      BaseUtility.paddingMediumValue,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            BaseUtility.radiusCircularMediumValue,
                          ),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            appointment.salonFileName,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // appointment information
              Expanded(
                flex: 5,
                child: Container(
                  padding: BaseUtility.left(
                    BaseUtility.paddingMediumValue,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // service name
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingSmallValue,
                          ),
                          child: BodyMediumBlackBoldText(
                            text: appointment.serviceName,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // location
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingMediumValue,
                          ),
                          child: BodyMediumBlackText(
                            text:
                                '${appointment.salonCity}/${appointment.salonDistrict}',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // add sevices
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingMediumValue,
                          ),
                          child: BodyMediumBlackText(
                            text:
                                '${AppLocalizations.of(context)!.appointment_summary_add_services_title}: ${appointment.additionalServices.map(
                              (model) => model.serviceName,
                            )}',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // appointment update
  Widget buildAppointmentUpdateButtonsWidget(BuildContext context) => Column(
        children: <Widget>[
          // information
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Container(
              padding: BaseUtility.all(
                BaseUtility.paddingMediumValue,
              ),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    BaseUtility.radiusCircularMediumValue,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  AppIcons.solidWarning.toSvgImg(
                    Colors.white,
                    BaseUtility.iconNormalSize,
                    BaseUtility.iconNormalSize,
                  ),
                  Expanded(
                    child: Padding(
                      padding: BaseUtility.horizontal(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumWhiteText(
                        text: AppLocalizations.of(context)!
                            .appointment_card_update,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // buttons
          SizedBox(
            height: dynamicViewExtensions.dynamicHeight(context, 0.07),
            child: Row(
              children: <Widget>[
                // cancelled
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Padding(
                    padding: BaseUtility.right(
                      BaseUtility.paddingSmallValue,
                    ),
                    child: CustomButtonWidget(
                      dynamicViewExtensions: dynamicViewExtensions,
                      text: AppLocalizations.of(context)!
                          .appointment_card_cancel_button,
                      func: () => updateAppointment(
                        appointment,
                        AppointmentsStatus.cancelledAppointment,
                      ),
                      btnStatus: ButtonTypes.borderPrimaryColorButton,
                    ),
                  ),
                ),
                // accept
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Padding(
                    padding: BaseUtility.left(
                      BaseUtility.paddingSmallValue,
                    ),
                    child: CustomButtonWidget(
                      dynamicViewExtensions: dynamicViewExtensions,
                      text: AppLocalizations.of(context)!
                          .appointment_card_accept_button,
                      func: () => updateAppointment(
                        appointment,
                        AppointmentsStatus.pendginAppointmentConfirmed,
                      ),
                      btnStatus: ButtonTypes.primaryColorButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
