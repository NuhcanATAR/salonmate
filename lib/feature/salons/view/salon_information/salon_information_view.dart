import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/view/salon_information/salon_information_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';

class SalonInformationView extends StatefulWidget {
  const SalonInformationView({
    super.key,
    required this.salonModel,
  });

  final SalonDetailModel salonModel;

  @override
  State<SalonInformationView> createState() => _SalonInformationViewState();
}

class _SalonInformationViewState extends SalonInformationViewModel {
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
        centerTitle: true,
        title: const BodyMediumBlackText(
          text: 'Salon Information',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: Column(
          children: <Widget>[
            // body
            buildBodyWidget,
            // footer buttons
            buildFooterButtonWidget,
          ],
        ),
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // name
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'Salon Name',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: widget.salonModel.name,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // city / district
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'City/District',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text:
                            '${widget.salonModel.city}/${widget.salonModel.district}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // address
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'Address',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: widget.salonModel.address,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // email
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'E-mail',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: widget.salonModel.email,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // phone
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'Phone Number',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: '+90 ${widget.salonModel.phone}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // open close time
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'Salon Phone Number',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text:
                            'Open Time: ${widget.salonModel.openTime.hour}:${widget.salonModel.openTime.minute} - Close Time: ${widget.salonModel.closeTime.hour}:${widget.salonModel.closeTime.minute}',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // sunday open
            Padding(
              padding: BaseUtility.bottom(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: const TitleMediumBlackBoldText(
                        text: 'Sunday Open',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: BaseUtility.top(
                        BaseUtility.paddingMediumValue,
                      ),
                      child: BodyMediumBlackText(
                        text: widget.salonModel.isSundayOpen == true
                            ? 'Open'
                            : 'Close',
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
        text: 'Salon Call',
        func: salonPhoneCall,
        btnStatus: ButtonTypes.iconPrimaryColorButton,
        appIcon: AppIcons.callOutline,
      );
}
