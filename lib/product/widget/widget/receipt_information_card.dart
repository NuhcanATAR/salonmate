import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/provider/user_provider.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class AppointmentReceiptInformationCardWidget extends StatelessWidget {
  const AppointmentReceiptInformationCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.salonDetailModel,
    required this.userProvider,
    required this.getMonthName,
    required this.selectDate,
    required this.selectTime,
    required this.selectStylistModel,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final SalonDetailModel salonDetailModel;
  final UserProvider userProvider;
  final Function(DateTime date) getMonthName;
  final DateTime selectDate;
  final DateTime selectTime;
  final StylistModel selectStylistModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseUtility.vertical(
        BaseUtility.marginNormalValue,
      ),
      padding: BaseUtility.all(
        BaseUtility.paddingNormalValue,
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
          // salon name
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: AppLocalizations.of(context)!
                          .appointment_receipt_information_salon,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text: salonDetailModel.name,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // customer name
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: AppLocalizations.of(context)!
                          .appointment_receipt_information_customer_name,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text: userProvider.user!.userDetail.fullName,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // phone
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: AppLocalizations.of(context)!
                          .appointment_receipt_information_phone,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text: salonDetailModel.phone.toString(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // booking date
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: AppLocalizations.of(context)!
                          .appointment_receipt_information_booking_date,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text:
                          '${getMonthName(selectDate)}, ${selectDate.day}, ${selectDate.year}'
                              .toString(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // booking time
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: AppLocalizations.of(context)!
                          .appointment_receipt_information_booking_time,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text:
                          '${selectTime.hour}:${selectTime.minute}'.toString(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // stylist
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: AppLocalizations.of(context)!
                          .appointment_receipt_information_stylist,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text: selectStylistModel.name,
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
  }
}
