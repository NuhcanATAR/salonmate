import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/date_select/date_select_view.dart';
import 'package:salonmate/feature/appointments/stylist_select/stylist_select_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/stylist_card.dart';

class StylistSelectView extends StatefulWidget {
  const StylistSelectView({
    super.key,
    required this.salonId,
    required this.serviceModel,
  });

  final int salonId;
  final Service serviceModel;

  @override
  State<StylistSelectView> createState() => _StylistSelectViewState();
}

class _StylistSelectViewState extends StylistSelectViewModel {
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
          text: 'Choose your stylist',
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
            buildBodyWidget,
            // footer button
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
            // stylis card
            StylistCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
            ),
          ],
        ),
      );

  // footer button
  Widget get buildFooterButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'Continue',
        func: () => CodeNoahNavigatorRouter.push(
          context,
          DateSelectView(
            salonId: widget.salonId,
            serviceModel: widget.serviceModel,
          ),
        ),
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
