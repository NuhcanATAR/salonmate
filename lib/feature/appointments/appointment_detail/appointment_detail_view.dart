import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/appointment_detail/appointment_detail_viewmodel.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/appointments_control.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/payment_control.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/appointment_card.dart';
import 'package:salonmate/product/widget/widget/button.dart';

class AppointmentDetailView extends StatefulWidget {
  const AppointmentDetailView({
    super.key,
    required this.appointmentModel,
  });

  final Appointment appointmentModel;

  @override
  State<AppointmentDetailView> createState() => _AppointmentDetailViewState();
}

class _AppointmentDetailViewState extends AppointmentDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        title: const BodyMediumBlackBoldText(
          text: 'Appointment Detail',
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<AppointmentsBloc, AppointmentState>(
        listener: appointmentUpdateBlocListener,
        builder: (context, state) {
          return Padding(
            padding: BaseUtility.all(
              BaseUtility.paddingNormalValue,
            ),
            child: ListView(
              children: <Widget>[
                // salon information
                buildSalonInformationWidget,
                // appointment card
                buildAppointmentCardWidget,
                // payment type
                buildPaymentTypeCardWidget,
                // prices information
                buildPricesInformationWidget,
                // evaluation button
                buildEvaluationButtonWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // salon information
  Widget get buildSalonInformationWidget => GestureDetector(
        onTap: () => CodeNoahNavigatorRouter.push(
          context,
          SalonDetailView(
            salonId: widget.appointmentModel.salonId,
          ),
        ),
        child: SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: Container(
            margin: BaseUtility.vertical(
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
            child: Row(
              children: <Widget>[
                // salon image
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: SizedBox(
                    height: dynamicViewExtensions.dynamicHeight(context, 0.12),
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
                              widget.appointmentModel.salonFileName,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // salon information
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: BaseUtility.all(
                      BaseUtility.paddingMediumValue,
                    ),
                    child: Column(
                      children: <Widget>[
                        // salon name
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: Padding(
                            padding: BaseUtility.bottom(
                              BaseUtility.paddingSmallValue,
                            ),
                            child: BodyMediumBlackBoldText(
                              text: widget.appointmentModel.salonName,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // salon location
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: Padding(
                            padding: BaseUtility.bottom(
                              BaseUtility.paddingSmallValue,
                            ),
                            child: BodyMediumBlackText(
                              text:
                                  '${widget.appointmentModel.salonCity}/${widget.appointmentModel.salonDistrict}',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // salon phone number
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: Padding(
                            padding: BaseUtility.bottom(
                              BaseUtility.paddingSmallValue,
                            ),
                            child: BodyMediumBlackText(
                              text: widget.appointmentModel.salonPhone,
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
        ),
      );

  // appointment card
  Widget get buildAppointmentCardWidget => AppointmentCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        appointment: widget.appointmentModel,
        getMonthName: getMonthName,
        updateAppointment: updateAppointment,
      );

  // payment type
  Widget get buildPaymentTypeCardWidget => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Container(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                BaseUtility.radiusCircularMediumValue,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              AppIcons.creditCard.toSvgImg(
                Colors.black,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
              Expanded(
                child: Padding(
                  padding: BaseUtility.horizontal(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: BodyMediumBlackBoldText(
                    text:
                        'Ödeme Yöntemi:  ${widget.appointmentModel.details.paymentType == PaymentTypeControl.payOnline.paymentTypeValue ? PaymentTypeControl.payOnline.paymentTypeLabel : PaymentTypeControl.payAtSalon.paymentTypeLabel}',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // prices information
  Widget get buildPricesInformationWidget => Container(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        margin: BaseUtility.vertical(
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
            // title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleMediumBlackBoldText(
                  text: 'Pricing Details',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // service name and price
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingNormalValue,
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
                          text: widget.appointmentModel.serviceName,
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
                            '${widget.appointmentModel.details.servicePrice}₺',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // add service name and price
            ...widget.appointmentModel.additionalServices.map(
              (model) => SizedBox(
                width: dynamicViewExtensions.maxWidth(context),
                child: Padding(
                  padding: BaseUtility.bottom(
                    BaseUtility.paddingNormalValue,
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
                            text: model.serviceName,
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
                          text: '${model.servicePrice}₺',
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
                        child: const TitleMediumBlackBoldText(
                          text: 'TOTAL',
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
                        text: '${widget.appointmentModel.details.totalPrice}₺',
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

  // evaluation button
  Widget get buildEvaluationButtonWidget =>
      widget.appointmentModel.appointmentsCategoryId ==
              AppointmentsStatus.completedAppointment.appointmentStatus
          ? CustomButtonWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              text: 'Randevuyu Değerlendir',
              func: () {},
              btnStatus: ButtonTypes.iconPrimaryColorButton,
              appIcon: AppIcons.star,
            )
          : const SizedBox();
}
