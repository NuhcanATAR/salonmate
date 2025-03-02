import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/view/salon_information/salon_information_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
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
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.salons_information_appbar,
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
                      child: TitleMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .salons_information_name,
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
                      child: TitleMediumBlackBoldText(
                        text:
                            '${AppLocalizations.of(context)!.salons_information_city}/${AppLocalizations.of(context)!.salons_information_district}',
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
                      child: TitleMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .salons_information_address,
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
                      child: TitleMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .salons_information_email,
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
                      child: TitleMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .salons_information_phone_number,
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
                      child: TitleMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .salons_information_open_close_time,
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
                            '${AppLocalizations.of(context)!.salons_information_open_time}: ${widget.salonModel.openTime.hour}:${widget.salonModel.openTime.minute} - ${AppLocalizations.of(context)!.salons_information_close_time}: ${widget.salonModel.closeTime.hour}:${widget.salonModel.closeTime.minute}',
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
                      child: TitleMediumBlackBoldText(
                        text: AppLocalizations.of(context)!
                            .salons_information_sunday_open,
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
                            ? AppLocalizations.of(context)!
                                .salons_information_open
                            : AppLocalizations.of(context)!
                                .salons_information_close,
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
        text: AppLocalizations.of(context)!.salons_information_call_button,
        func: salonPhoneCall,
        btnStatus: ButtonTypes.iconPrimaryColorButton,
        appIcon: AppIcons.callOutline,
      );
}
