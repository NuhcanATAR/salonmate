import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/appointments/appointments_receipt/appointments_receipt_viewmodel.dart';
import 'package:salonmate/feature/bottom_navigator/bottom_navigator_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/model/salon_detail_model/salon_detail_model.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/provider/user_provider.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/receipt_information_card.dart';
import 'package:salonmate/product/widget/widget/receipt_prices_list_card.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

class AppointmentsReceiptView extends StatefulWidget {
  const AppointmentsReceiptView({
    super.key,
    required this.salonId,
    required this.serviceModel,
    required this.selectStylistModel,
    required this.selectDate,
    required this.selectTime,
    required this.selectedServiceDetails,
    required this.salonDetailModel,
  });

  final int salonId;
  final Service serviceModel;
  final StylistModel selectStylistModel;
  final DateTime selectDate;
  final DateTime selectTime;
  final List<StylistAddServiceModel> selectedServiceDetails;
  final SalonDetailModel salonDetailModel;

  @override
  State<AppointmentsReceiptView> createState() =>
      _AppointmentsReceiptViewState();
}

class _AppointmentsReceiptViewState extends AppointmentsReceiptViewModel {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        leading: IconButton(
          onPressed: () => CodeNoahNavigatorRouter.pushAndRemoveUntil(
            context,
            const BottomNavigatorView(),
          ),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        title: BodyMediumBlackBoldText(
          text: AppLocalizations.of(context)!.appointment_receipt_appbar,
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
            buildBodyWidget(userProvider),
            // footer button
            buildFooterButtonWidget(userProvider),
          ],
        ),
      ),
    );
  }

  // body
  Widget buildBodyWidget(UserProvider userProvider) => Expanded(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              // success icon
              AppImages.success.toPngImg(
                dynamicViewExtensions.maxWidth(context),
                dynamicViewExtensions.dynamicHeight(
                  context,
                  0.1,
                ),
              ),
              // title sub title
              TitleSubtitleWidget(
                dynamicViewExtensions: dynamicViewExtensions,
                title: AppLocalizations.of(context)!
                    .appointment_receipt_success_title,
                subtitle: AppLocalizations.of(context)!
                    .appointment_receipt_success_sub_title,
                isCenter: true,
              ),
              // information
              buildInformationWidget(userProvider),
              // prices list
              buildPricesListWidget,
            ],
          ),
        ),
      );

  // footer button
  Widget buildFooterButtonWidget(UserProvider userProvider) =>
      CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: AppLocalizations.of(context)!.appointment_receipt_download_button,
        func: () => createAndOpenPdf(
          userProvider.user!.userDetail.fullName,
          widget.salonDetailModel.phone,
          context,
        ),
        btnStatus: ButtonTypes.primaryColorButton,
      );

  // information
  Widget buildInformationWidget(UserProvider userProvider) =>
      AppointmentReceiptInformationCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        salonDetailModel: widget.salonDetailModel,
        userProvider: userProvider,
        getMonthName: getMonthName,
        selectDate: widget.selectDate,
        selectTime: widget.selectTime,
        selectStylistModel: widget.selectStylistModel,
      );

  // prices list
  Widget get buildPricesListWidget => AppointmnetReceiptPricesListCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        totalAddService: totalAddService,
        serviceModel: widget.serviceModel,
        selectedServiceDetails: widget.selectedServiceDetails,
      );
}
