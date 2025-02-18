import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/date_select/date_select_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/day_card.dart';

class DateSelectView extends StatefulWidget {
  const DateSelectView({
    super.key,
    required this.salonId,
    required this.serviceModel,
  });

  final int salonId;
  final Service serviceModel;

  @override
  State<DateSelectView> createState() => _DateSelectViewState();
}

class _DateSelectViewState extends DateSelectViewModel {
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
          text: 'Date and time',
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
                  buildSelectDayWidget,
                  // select time
                  buildSelectTimeWidget,
                ],
              ),
            ),
            // footer button
            buildFooterButtonWidget,
          ],
        ),
      ),
    );
  }

  // select day
  Widget get buildSelectDayWidget => Flexible(
        fit: FlexFit.tight,
        flex: 3,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingMediumValue,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              // day card
              DayCardWidget(
                dynamicViewExtensions: dynamicViewExtensions,
                onTap: () {},
              ),
              DayCardWidget(
                dynamicViewExtensions: dynamicViewExtensions,
                onTap: () {},
              ),
              DayCardWidget(
                dynamicViewExtensions: dynamicViewExtensions,
                onTap: () {},
              ),
            ],
          ),
        ),
      );

  // select time
  Widget get buildSelectTimeWidget => Expanded(
        flex: 10,
        child: Column(
          children: <Widget>[
            // title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleMediumBlackBoldText(
                  text: 'Select Date',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // list
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Container(
                      padding: BaseUtility.all(
                        BaseUtility.paddingNormalValue,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            BaseUtility.radiusCircularNormalValue,
                          ),
                        ),
                      ),
                      child: const BodyMediumBlackText(
                        text: '9:30 AM',
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

  // footer button
  Widget get buildFooterButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'Confirm Appointment',
        func: () {},
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
