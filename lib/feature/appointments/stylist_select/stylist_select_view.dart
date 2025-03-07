import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/event.dart';
import 'package:salonmate/feature/appointments/bloc/state.dart';
import 'package:salonmate/feature/appointments/stylist_select/stylist_select_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/response_card.dart';
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
        title: BodyMediumBlackBoldText(
          text: AppLocalizations.of(context)!.appointment_stylist_select_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocBuilder<AppointmentsBloc, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentStylistLoadingState) {
            return CustomLoadingResponseWidget(
              title: AppLocalizations.of(context)!
                  .appointment_stylist_select_loading_title,
              subTitle: AppLocalizations.of(context)!
                  .appointment_stylist_select_loading_sub_title,
            );
          } else if (state is AppointmentStylistErrorState) {
            return CustomResponseWidget(
              img: AppImages.warning.toSvgImg(
                null,
                dynamicViewExtensions.maxWidth(context),
                dynamicViewExtensions.dynamicHeight(context, 0.2),
              ),
              title: 'Hata Oluştu',
              subTitle: state.errorMessage,
            );
          } else if (state is AppointmentStylistLoadedState) {
            return Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                children: <Widget>[
                  // body
                  buildBodyWidget(state),
                  // footer button
                  buildFooterButtonWidget(state),
                ],
              ),
            );
          } else {
            return CustomResponseWidget(
              img: AppImages.warning.toSvgImg(
                null,
                dynamicViewExtensions.maxWidth(context),
                dynamicViewExtensions.dynamicHeight(context, 0.2),
              ),
              title: AppLocalizations.of(context)!
                  .appointment_stylist_select_error_title,
              subTitle: AppLocalizations.of(context)!
                  .appointment_stylist_select_error_sub_title,
            );
          }
        },
      ),
    );
  }

  // body
  Widget buildBodyWidget(AppointmentStylistLoadedState state) => Expanded(
        child: state.stylist.isEmpty
            ? CustomResponseWidget(
                img: AppImages.notfound.toSvgImg(
                  null,
                  dynamicViewExtensions.maxWidth(context),
                  dynamicViewExtensions.dynamicHeight(context, 0.2),
                ),
                title: AppLocalizations.of(context)!
                    .appointment_stylist_select_not_found_title,
                subTitle: AppLocalizations.of(context)!
                    .appointment_stylist_select_not_found_sub_title,
              )
            : ListView.builder(
                itemCount: state.stylist.length,
                itemBuilder: (context, index) {
                  final model = state.stylist[index];
                  final bool isSelected = state.selectedStylist == model;
                  return StylistCardWidget(
                    dynamicViewExtensions: dynamicViewExtensions,
                    onTap: () => context
                        .read<AppointmentsBloc>()
                        .add(AppointmentStylistSelectEvent(model)),
                    model: model,
                    borderColor: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  );
                },
              ),
      );

  // footer button
  Widget buildFooterButtonWidget(AppointmentStylistLoadedState state) =>
      CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: AppLocalizations.of(context)!
            .appointment_stylist_select_continue_button,
        func: () => nextSectionFunc(state),
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
