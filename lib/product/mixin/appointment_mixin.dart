import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointments_receipt/appointments_receipt_view.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
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
                      const Expanded(
                        child: TitleMediumBlackBoldText(
                          text: 'DATE AND TİME',
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
                        child: const TitleLargeBlackBoldText(
                          text:
                              'Tarih Seçiminden Geri Çıkmak İstedğine Eminmisin',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const BodyMediumBlackText(
                          text: 'Geri çıkarsan tekrar çalışan seçimi yaparsın!',
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
                                text: 'EVET',
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
                                text: 'HAYIR',
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
                      const Expanded(
                        child: TitleMediumBlackBoldText(
                          text: 'APPOINTMENT SUMMARY',
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
                        child: const TitleLargeBlackBoldText(
                          text:
                              'Randevu Özetinden Geri Çıkmak İstedğine Eminmisin',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const BodyMediumBlackText(
                          text: 'Geri çıkarsan tekrar tarih seçimi yaparsın!',
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
                                text: 'EVET',
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
                                text: 'HAYIR',
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
          'Appointment Failed',
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
        Navigator.pop(context);
        appointmentsBloc
            .add(AppointmentsFetchEvent(isRefresh: true, page: 1, limit: 10));
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: 'Randevu Durumunuz Gönderildi',
        );
        break;
      case AppointmentUpdateErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showWarningAlert(
          false,
          AppIcons.solidWarning,
          Theme.of(context).colorScheme.primary,
          'Appointment Failed',
          (state as AppointmentUpdateErrorState).message,
          dynamicViewExtensions,
        );
        break;
      case AppointmentUpdateLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteText(
            text: 'Lütfen Bekleyiniz...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        loggerPrint.printErrorLog('Case error');
    }
  }
}
