import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/state.dart';
import 'package:salonmate/feature/sign_up/view/verification_code/verification_code_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/normal_text_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

import '../../../../product/core/base/helper/button_control.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({
    super.key,
    required this.phoneNumber,
  });

  final int phoneNumber;

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends VerificationCodeViewModel {
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
        title: const BodyMediumBlackBoldText(
          text: 'Verification Code',
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: signUpVerificationCodeListenerBLoc,
        builder: (context, state) {
          return Form(
            key: formVerificationCodeKey,
            child: Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: ListView(
                children: [
                  // title sub title
                  buildTitleSubTitleWidget,
                  // otp code
                  buildOtpCodeWidget,
                  // verification button
                  buildVerificationAndRefreshButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // title sub title
  Widget get buildTitleSubTitleWidget => TitleSubtitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        title: 'Enter Verification Code ✅',
        subtitle: 'Enter the verification code received on your phone number.',
      );

  // otp code
  Widget get buildOtpCodeWidget => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: NumberTextFieldWidget(
          controller: otpCodeController,
          hintText: 'Verification Code',
          onChanged: (val) {},
          isLabelText: false,
          dynamicViewExtensions: dynamicViewExtensions,
        ),
      );

  // verification button
  Widget get buildVerificationAndRefreshButtonWidget => Column(
        children: <Widget>[
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: 'Verification Code',
            func: verificationCode,
            btnStatus: ButtonTypes.primaryColorButton,
          ),
        ],
      );
}
