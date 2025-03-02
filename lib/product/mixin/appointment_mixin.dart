import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointments_receipt/appointments_receipt_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/feature/bottom_navigator/bottom_navigator_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';

mixin AppointmentMixin {
  final prefService = PrefService();
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();
  final loggerPrint = CustomLoggerPrint();
  late AppointmentsBloc appointmentsBloc;

  Future<bool> exitDateSelectDialog(
    BuildContext context,
    DynamicViewExtensions dynamicViewExtensions,
    int salonId,
    Service serviceModel,
  ) async {
    return await showModalBottomSheet(
          context: context,
          barrierColor: Colors.black54.withOpacity(0.3),
          builder: (context) => SizedBox(
            height: dynamicViewExtensions.dynamicHeight(
              context,
              dynamicViewExtensions.dynamicHeight(context, 0.2),
            ),
            child: Column(
              children: <Widget>[
                // appbar
                Padding(
                  padding: BaseUtility.all(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TitleMediumBlackBoldText(
                          text: AppLocalizations.of(context)!
                              .appointment_mixin_exit_date_dialog_appbar,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: AppIcons.close.toSvgImg(
                          Colors.black54,
                          BaseUtility.iconSmallSize,
                          BaseUtility.iconSmallSize,
                        ),
                      ),
                    ],
                  ),
                ),
                // child
                Padding(
                  padding: BaseUtility.all(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: Column(
                    children: <Widget>[
                      // img
                      AppImages.notfound.toSvgImg(
                        null,
                        dynamicViewExtensions.maxWidth(context),
                        dynamicViewExtensions.dynamicHeight(
                          context,
                          0.17,
                        ),
                      ),
                      // title
                      Padding(
                        padding: BaseUtility.vertical(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: TitleLargeBlackBoldText(
                          text: AppLocalizations.of(context)!
                              .appointment_mixin_exit_date_dialog_title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: BodyMediumBlackText(
                          text: AppLocalizations.of(context)!
                              .appointment_mixin_exit_date_dialog_sub_title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // yes and not
                      Row(
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Padding(
                              padding: BaseUtility.right(
                                BaseUtility.paddingMediumValue,
                              ),
                              child: CustomButtonWidget(
                                dynamicViewExtensions: dynamicViewExtensions,
                                text: AppLocalizations.of(context)!
                                    .appointment_mixin_exit_date_dialog_yes,
                                func: () async {
                                  final token = await prefService
                                          .getString(SharedKeys.token) ??
                                      '';
                                  if (token != null) {
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    context.read<AppointmentsBloc>().add(
                                          AppointmentFetchStylistEvent(
                                            salonId: salonId,
                                            serviceId: serviceModel.id,
                                            token: token,
                                            context: context,
                                          ),
                                        );
                                  }
                                },
                                btnStatus: ButtonTypes.primaryColorButton,
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Padding(
                              padding: BaseUtility.left(
                                BaseUtility.paddingMediumValue,
                              ),
                              child: CustomButtonWidget(
                                dynamicViewExtensions: dynamicViewExtensions,
                                text: AppLocalizations.of(context)!
                                    .appointment_mixin_exit_date_dialog_no,
                                func: () => Navigator.pop(context),
                                btnStatus: ButtonTypes.borderPrimaryColorButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ) ??
        false;
  }

  Future<bool> exitAppointmentSummaryDialog(
    BuildContext context,
    StylistModel stylistModel,
    DynamicViewExtensions dynamicViewExtensions,
  ) async {
    return await showModalBottomSheet(
          context: context,
          barrierColor: Colors.black54.withOpacity(0.3),
          builder: (context) => SizedBox(
            height: dynamicViewExtensions.dynamicHeight(
              context,
              dynamicViewExtensions.dynamicHeight(context, 0.2),
            ),
            child: Column(
              children: <Widget>[
                // appbar
                Padding(
                  padding: BaseUtility.all(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TitleMediumBlackBoldText(
                          text: AppLocalizations.of(context)!
                              .appointment_mixin_exit_summary_dialog_appbar,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: AppIcons.close.toSvgImg(
                          Colors.black54,
                          BaseUtility.iconSmallSize,
                          BaseUtility.iconSmallSize,
                        ),
                      ),
                    ],
                  ),
                ),
                // child
                Padding(
                  padding: BaseUtility.all(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: Column(
                    children: <Widget>[
                      // img
                      AppImages.notfound.toSvgImg(
                        null,
                        dynamicViewExtensions.maxWidth(context),
                        dynamicViewExtensions.dynamicHeight(
                          context,
                          0.17,
                        ),
                      ),
                      // title
                      Padding(
                        padding: BaseUtility.vertical(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: TitleLargeBlackBoldText(
                          text: AppLocalizations.of(context)!
                              .appointment_mixin_exit_summary_dialog_title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: BodyMediumBlackText(
                          text: AppLocalizations.of(context)!
                              .appointment_mixin_exit_summary_dialog_sub_title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // yes and not
                      Row(
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Padding(
                              padding: BaseUtility.right(
                                BaseUtility.paddingMediumValue,
                              ),
                              child: CustomButtonWidget(
                                dynamicViewExtensions: dynamicViewExtensions,
                                text: AppLocalizations.of(context)!
                                    .appointment_mixin_exit_summary_dialog_yes,
                                func: () async {
                                  final token = await prefService
                                          .getString(SharedKeys.token) ??
                                      '';
                                  if (token != null) {
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    context.read<AppointmentsBloc>().add(
                                          AppointmentDateFetchEvent(
                                            token: token,
                                            stylistId: stylistModel.id,
                                            context: context,
                                          ),
                                        );
                                  }
                                },
                                btnStatus: ButtonTypes.primaryColorButton,
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Padding(
                              padding: BaseUtility.left(
                                BaseUtility.paddingMediumValue,
                              ),
                              child: CustomButtonWidget(
                                dynamicViewExtensions: dynamicViewExtensions,
                                text: AppLocalizations.of(context)!
                                    .appointment_mixin_exit_summary_dialog_no,
                                func: () => Navigator.pop(context),
                                btnStatus: ButtonTypes.borderPrimaryColorButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ) ??
        false;
  }

  void appointmentCreateBlocListener(
    BuildContext context,
    state,
  ) {
    switch (state.runtimeType) {
      case AppointmentCreateSuccessState:
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          AppointmentsReceiptView(
            salonId: (state as AppointmentCreateSuccessState).salonId,
            serviceModel: state.serviceModel,
            selectStylistModel: state.selectStylistModel,
            selectDate: state.selectDate,
            selectTime: state.selectTime,
            selectedServiceDetails: state.selectedServiceDetails,
            salonDetailModel: state.salonDetailModel,
          ),
        );
        break;
      case AppointmentCreateErrorState:
        CodeNoahDialogs(context).showWarningAlert(
          false,
          AppIcons.solidWarning,
          Theme.of(context).colorScheme.primary,
          AppLocalizations.of(context)!.appointment_mixin_create_error,
          (state as AppointmentCreateErrorState).message,
          dynamicViewExtensions,
        );
        break;
      default:
        loggerPrint.printErrorLog('Case error');
    }
  }

  void appointmentUpdateBlocListener(BuildContext context, state) {
    switch (state.runtimeType) {
      case AppointmentUpdateSuccesState:
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          const BottomNavigatorView(),
        );
        appointmentsBloc.add(
          AppointmentsFetchEvent(
            isRefresh: true,
            page: 1,
            limit: 10,
            context: context,
          ),
        );
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: AppLocalizations.of(context)!.appointment_update_success,
        );
        break;
      case AppointmentUpdateErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showWarningAlert(
          false,
          AppIcons.solidWarning,
          Theme.of(context).colorScheme.primary,
          AppLocalizations.of(context)!.appointment_mixin_update_error,
          (state as AppointmentUpdateErrorState).message,
          dynamicViewExtensions,
        );
        break;
      case AppointmentUpdateLoadingState:
        CodeNoahDialogs(context).showAlert(
          BodyMediumWhiteText(
            text: AppLocalizations.of(context)!
                .appointment_mixin_evaluation_create_loading,
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        loggerPrint.printErrorLog('Case error');
    }
  }

  void appointmentEvaluationCreateBlocListener(BuildContext context, state) {
    switch (state.runtimeType) {
      case AppointmentEvaluationSuccessState:
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        CodeNoahNavigatorRouter.push(
          context,
          const BottomNavigatorView(),
        );
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: (state as AppointmentEvaluationSuccessState).message,
        );
        break;
      case AppointmentEvaluationErrorState:
        Navigator.pop(context);
        Navigator.pop(context);
        CodeNoahDialogs(context).showWarningAlert(
          false,
          AppIcons.solidWarning,
          Theme.of(context).colorScheme.primary,
          AppLocalizations.of(context)!.appointment_mixin_update_error,
          (state as AppointmentEvaluationErrorState).message,
          dynamicViewExtensions,
        );
        break;
      case AppointmentEvaluationLoadingState:
        CodeNoahDialogs(context).showAlert(
          BodyMediumWhiteText(
            text: AppLocalizations.of(context)!
                .appointment_mixin_evaluation_create_loading,
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        loggerPrint.printErrorLog('Case error');
    }
  }
}
