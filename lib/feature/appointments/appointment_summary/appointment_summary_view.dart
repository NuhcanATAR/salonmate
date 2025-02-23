import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/appointment_summary/appointment_summary_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';

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
          text: 'Booking Summary',
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: Column(
          children: <Widget>[
            // body
            Expanded(
              child: ListView(
                children: const <Widget>[
                  // add service
                  // salon card
                  // appointment details
                  // payment select
                  // pricing details
                ],
              ),
            ),
            // footer button
            CustomButtonWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              text: 'Procced',
              func: () {},
              btnStatus: ButtonTypes.primaryColorButton,
            ),
          ],
        ),
      ),
    );
  }
}
