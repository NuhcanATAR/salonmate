import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/state.dart';
import 'package:salonmate/feature/sign_up/view/send_code/send_code_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/phone_number_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

class SignUpSendCodeView extends StatefulWidget {
  const SignUpSendCodeView({super.key});

  @override
  State<SignUpSendCodeView> createState() => _SignUpSendCodeViewState();
}

class _SignUpSendCodeViewState extends SignUpSendCodeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            ColorConstant.dark2,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        centerTitle: true,
        title: BodyMediumBlackBoldText(
          text: AppLocalizations.of(context)!.sign_up_send_code_appbar,
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: signUpSendCodeListenerBLoc,
        builder: (context, state) {
          return Form(
            key: formSendCodeKey,
            child: Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: ListView(
                children: <Widget>[
                  // title and sub title
                  buildTitleSubTitleWidget,
                  // phone number field
                  buildPhoneNumberFieldWidget,
                  // next button
                  buildNextButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // title and sub title
  Widget get buildTitleSubTitleWidget => TitleSubtitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        title: AppLocalizations.of(context)!.sign_up_send_code_title,
        subtitle: AppLocalizations.of(context)!.sign_up_send_code_sub_title,
      );

  // phone number field
  Widget get buildPhoneNumberFieldWidget => Padding(
        padding: BaseUtility.top(
          BaseUtility.paddingNormalValue,
        ),
        child: PhoneNumberFieldWidget(
          phoneNumberController: phoneNumberController,
          hintText:
              AppLocalizations.of(context)!.sign_up_send_code_phone_number,
          onChanged: (val) {},
          isLabelText: false,
        ),
      );

  // next button
  Widget get buildNextButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: AppLocalizations.of(context)!.sign_up_send_code_button,
        func: sendCode,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
