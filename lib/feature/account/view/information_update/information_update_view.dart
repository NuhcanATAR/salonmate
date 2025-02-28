import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/account/bloc/cubit.dart';
import 'package:salonmate/feature/account/bloc/state.dart';
import 'package:salonmate/feature/account/view/information_update/information_update_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/normal_text_field.dart';
import 'package:salonmate/product/widget/widget/phone_number_field.dart';

class InformationUpdateView extends StatefulWidget {
  const InformationUpdateView({super.key});

  @override
  State<InformationUpdateView> createState() => _InformationUpdateViewState();
}

class _InformationUpdateViewState extends InformationUpdateViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black54,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.account_information_update_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<AccountBloc, AccountState>(
        listener: accountInformationUpdateListenerBLoc,
        builder: (context, state) {
          return BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              if (state is AccountLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AccountLoaded) {
                fullNameController.text = state.fullName;
                phoneNumberController.text = state.phoneNumber.toString();
                addressController.text = state.address;
                return buildBodyWidget;
              } else if (state is AccountError) {
                return const SizedBox();
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Form(
        key: formInformationUpdateKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: ListView(
            children: <Widget>[
              // form
              buildFormWidget,
              // save button
              buildSaveButtonWidget,
            ],
          ),
        ),
      );

  // form
  Widget get buildFormWidget => Column(
        children: <Widget>[
          // full name
          NormalTextFieldWidget(
            controller: fullNameController,
            hintText: AppLocalizations.of(context)!
                .account_information_update_fullname,
            explanationStatus: false,
            onChanged: (String val) {},
            isValidator: true,
            enabled: true,
            isLabelText: true,
            dynamicViewExtensions: dynamicViewExtensions,
          ),
          // phone number
          PhoneNumberFieldWidget(
            phoneNumberController: phoneNumberController,
            hintText: AppLocalizations.of(context)!
                .account_information_update_phone_number,
            onChanged: (String val) {},
            isLabelText: true,
          ),
          // address
          NormalTextFieldWidget(
            controller: addressController,
            hintText: AppLocalizations.of(context)!
                .account_information_update_address,
            explanationStatus: true,
            onChanged: (String val) {},
            isValidator: true,
            enabled: true,
            isLabelText: true,
            dynamicViewExtensions: dynamicViewExtensions,
          ),
        ],
      );

  // save button
  Widget get buildSaveButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: AppLocalizations.of(context)!.account_information_update_button,
        func: accountUpdate,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
