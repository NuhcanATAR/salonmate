import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/password/bloc/state.dart';
import 'package:salonmate/feature/password/view/verification_code/verification_code_viewmodel.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/normal_text_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

import '../../../../product/constants/color.dart';

class PasswordVerificationCodeView extends StatefulWidget {
  const PasswordVerificationCodeView({
    super.key,
    required this.phoneNumber,
  });

  final int phoneNumber;

  @override
  State<PasswordVerificationCodeView> createState() =>
      _PasswordVerificationCodeViewState();
}

class _PasswordVerificationCodeViewState
    extends PasswordVerificationCodeViewModel {
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
        title: const BodyMediumBlackBoldText(
          text: 'Verification Code',
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<PasswordBloc, PasswordState>(
        listener: passwordVerificationCodeListenerBloc,
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
        subtitle: 'Enter the verification code received on your new password.',
      );

  // otp code
  Widget get buildOtpCodeWidget => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: NumberTextFieldWidget(
          controller: verificationCodeController,
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
            text: 'Verification',
            func: verificationCode,
            btnStatus: ButtonTypes.primaryColorButton,
          ),
        ],
      );
}
