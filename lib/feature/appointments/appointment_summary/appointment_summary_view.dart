import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointment_summary/appointment_summary_viewmodel.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/payment_type_control.dart';
import 'package:salonmate/product/core/base/helper/radio_size_control.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/add_service_card.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/radio_field.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';
import 'package:salonmate/product/widget/widget/salon_detail_card.dart';

class AppointmentSummaryView extends StatefulWidget {
  const AppointmentSummaryView({
    super.key,
    required this.salonId,
    required this.serviceModel,
    required this.selectStylistModel,
    required this.selectDate,
    required this.selectTime,
  });

  final int salonId;
  final Service serviceModel;
  final StylistModel selectStylistModel;
  final DateTime selectDate;
  final DateTime selectTime;

  @override
  State<AppointmentSummaryView> createState() => _AppointmentSummaryViewState();
}

class _AppointmentSummaryViewState extends AppointmentSummaryViewModel {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitAppointmentSummaryDialog(
        context,
        widget.selectStylistModel,
        dynamicViewExtensions,
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
                      AppointmentDateFetchEvent(
                        token: token,
                        stylistId: widget.selectStylistModel.id,
                        context: context,
                      ),
                    );
              } else {
                if (!context.mounted) return;
                loggerPrint.printInfoLog(
                  AppLocalizations.of(context)!
                      .appointmnet_detail_token_not_avaible,
                );
              }
            },
            icon: AppIcons.arrowLeft.toSvgImg(
              Colors.black,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
          ),
          title: BodyMediumBlackBoldText(
            text: AppLocalizations.of(context)!.appointment_summary_appbar,
            textAlign: TextAlign.left,
          ),
        ),
        body: BlocBuilder<AppointmentsBloc, AppointmentState>(
          buildWhen: (previous, current) {
            return current is AppointmentSummaryLoadedState ||
                current is AppointmentSummaryErrorState ||
                current is AppointmentSummaryLoadingState;
          },
          builder: (context, state) {
            if (state is AppointmentSummaryLoadingState) {
              return CustomLoadingResponseWidget(
                title: AppLocalizations.of(context)!
                    .appointment_summary_loading_title,
                subTitle: AppLocalizations.of(context)!
                    .appointment_summary_loading_subtitle,
              );
            } else if (state is AppointmentSummaryErrorState) {
              return CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  dynamicViewExtensions.maxWidth(context),
                  dynamicViewExtensions.dynamicHeight(
                    context,
                    0.2,
                  ),
                ),
                title: AppLocalizations.of(context)!
                    .appointment_summary_error_title,
                subTitle: state.message,
              );
            } else if (state is AppointmentSummaryLoadedState) {
              final selectedServices = state.selectedServices ?? [];
              final allServices = state.stylistAddService ?? [];
              selectedServiceDetails = allServices
                  .where((service) => selectedServices.contains(service.id))
                  .toList();
              return Padding(
                padding: BaseUtility.all(
                  BaseUtility.paddingNormalValue,
                ),
                child: BlocListener<AppointmentsBloc, AppointmentState>(
                  listener: appointmentCreateBlocListener,
                  child: Column(
                    children: <Widget>[
                      // body
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            // add service
                            buildAddServiceWidget(state),
                            // salon card
                            buildSalonCardWidget(state),
                            // appointment details
                            buildAppointmentDetailsWidget,
                            // payment select
                            buildPaymentSelectWidget,
                            // pricing details
                            buildPricingDetailsWidget,
                          ],
                        ),
                      ),
                      // footer button
                      buildFooterButtonWidget(state),
                    ],
                  ),
                ),
              );
            }

            return SizedBox(
              child: Text(state.toString()),
            );
          },
        ),
      ),
    );
  }

  // add service
  Widget buildAddServiceWidget(AppointmentSummaryLoadedState state) => Column(
        children: <Widget>[
          // list title
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: TitleLargeBlackBoldText(
                text: AppLocalizations.of(context)!
                    .appointment_summary_add_services_title,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // list
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(
              context,
              0.13,
            ),
            child: Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.stylistAddService!.length,
                itemBuilder: (context, index) {
                  final model = state.stylistAddService![index];
                  final bool isSelected =
                      state.selectedServices!.contains(model.id);
                  return AddServiceCardWidget(
                    dynamicViewExtensions: dynamicViewExtensions,
                    isSelected: isSelected,
                    model: model,
                    onTap: () {
                      context.read<AppointmentsBloc>().add(
                            AppointmentToggleServiceSelectionEvent(model.id),
                          );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      );

  // salon card
  Widget buildSalonCardWidget(AppointmentSummaryLoadedState state) =>
      SalonDetailCardWidget(
        onTap: () {},
        dynamicViewExtensions: dynamicViewExtensions,
        salonModel: state.salonDetailModel!,
      );

  // appointment details
  Widget get buildAppointmentDetailsWidget => Padding(
        padding: BaseUtility.top(
          BaseUtility.paddingNormalValue,
        ),
        child: Column(
          children: <Widget>[
            // date
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingMediumValue,
              ),
              child: Column(
                children: <Widget>[
                  // title
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.bottom(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: BodyMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .appointment_summary_date_title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // date time
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.bottom(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: BodyMediumBlackText(
                        text:
                            '${getMonthName(widget.selectDate)}, ${getDayName(widget.selectDate)}, ${widget.selectTime.hour}:${widget.selectTime.minute}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // stylist
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingMediumValue,
              ),
              child: Column(
                children: <Widget>[
                  // title
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.bottom(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: BodyMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .appointment_summary_stylist_title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // date time
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.bottom(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: BodyMediumBlackText(
                        text:
                            '${widget.selectStylistModel.name} - ${widget.serviceModel.duration} ${AppLocalizations.of(context)!.appointment_summary_stylist_date_mins}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // payment select
  Widget get buildPaymentSelectWidget => Column(
        children: <Widget>[
          // pay online
          ListTile(
            contentPadding: BaseUtility.vertical(
              BaseUtility.paddingSmallValue,
            ),
            title: TitleMediumBlackBoldText(
              text: AppLocalizations.of(context)!
                  .appointmnet_summary_payment_online_title,
              textAlign: TextAlign.left,
            ),
            subtitle: BodyMediumBlackText(
              text: AppLocalizations.of(context)!
                  .appointment_summary_payment_online_subtitle,
              textAlign: TextAlign.left,
            ),
            trailing: RadioFieldWidget(
              isRadioSizeType: RadioSizeEnum.defaultSize,
              value: switchValue,
              onChanged: (PaymentType? value) {
                setState(() {
                  paymentType = value;
                });
              },
              character: paymentType,
              selectValue: PaymentType.payOnline,
            ),
          ),
          // pay at salon
          ListTile(
            contentPadding: BaseUtility.vertical(
              BaseUtility.paddingSmallValue,
            ),
            title: TitleMediumBlackBoldText(
              text: AppLocalizations.of(context)!
                  .appointment_summary_payment_at_salon_title,
              textAlign: TextAlign.left,
            ),
            subtitle: BodyMediumBlackText(
              text: AppLocalizations.of(context)!
                  .appointment_summary_payment_at_salon_sub_title,
              textAlign: TextAlign.left,
            ),
            trailing: RadioFieldWidget(
              isRadioSizeType: RadioSizeEnum.defaultSize,
              value: switchValue,
              onChanged: (PaymentType? value) {
                setState(() {
                  paymentType = value;
                });
              },
              character: paymentType,
              selectValue: PaymentType.payAtSalon,
            ),
          ),
        ],
      );

  // pricing details
  Widget get buildPricingDetailsWidget => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: Column(
          children: <Widget>[
            // title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingMediumValue,
                ),
                child: TitleMediumBlackBoldText(
                  text: AppLocalizations.of(context)!
                      .appointment_summary_pricing_details,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // service name and price
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingMediumValue,
                ),
                child: Row(
                  children: <Widget>[
                    // service name
                    Expanded(
                      child: Padding(
                        padding: BaseUtility.right(
                          BaseUtility.paddingMediumValue,
                        ),
                        child: BodyMediumBlackText(
                          text: widget.serviceModel.name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // price
                    Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: '${widget.serviceModel.price}₺',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // add service name and price
            ...selectedServiceDetails.map(
              (model) => SizedBox(
                width: dynamicViewExtensions.maxWidth(context),
                child: Padding(
                  padding: BaseUtility.bottom(
                    BaseUtility.paddingMediumValue,
                  ),
                  child: Row(
                    children: <Widget>[
                      // service name
                      Expanded(
                        child: Padding(
                          padding: BaseUtility.right(
                            BaseUtility.paddingMediumValue,
                          ),
                          child: BodyMediumBlackText(
                            text: model.name,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // price
                      Padding(
                        padding: BaseUtility.left(
                          BaseUtility.paddingMediumValue,
                        ),
                        child: BodyMediumBlackText(
                          text: '${model.price}₺',
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // total
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingMediumValue,
                ),
                child: Row(
                  children: <Widget>[
                    // service name
                    Expanded(
                      child: Padding(
                        padding: BaseUtility.right(
                          BaseUtility.paddingMediumValue,
                        ),
                        child: TitleMediumBlackBoldText(
                          text: AppLocalizations.of(context)!
                              .appointment_summary_pricing_details_total,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // price
                    Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text:
                            '${widget.serviceModel.price + totalAddService(selectedServiceDetails)}₺',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  // footer button
  Widget buildFooterButtonWidget(AppointmentSummaryLoadedState state) =>
      CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: AppLocalizations.of(context)!.appointment_summary_create_button,
        func: () => appointmentCreateFunc(state),
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
