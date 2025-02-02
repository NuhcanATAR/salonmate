import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/password/bloc/state.dart';
import 'package:salonmate/feature/password/password_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/password_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends PasswordViewModel {
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
          text: 'New Password',
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<PasswordBloc, PasswordState>(
        listener: passwordChangePasswordListenerBloc,
        builder: (context, state) {
          return Form(
            key: formNewPasswordKey,
            child: Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: ListView(
                children: [
                  // title sub title
                  buildTitleSubTitleWidget,
                  // passwords
                  buildPasswordWidget,
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
        title: 'Enter Verification Code 🔒️',
        subtitle: 'Enter the verification code received on your new password.',
      );

  // passwords
  Widget get buildPasswordWidget => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: Column(
          children: <Widget>[
            // new password
            Padding(
              padding: BaseUtility.top(
                BaseUtility.paddingNormalValue,
              ),
              child: CustomPasswordFieldWidget(
                passwordController: newPasswordController,
                hintText: 'New Password',
                onChanged: (val) {},
                isLabelText: false,
                isValidator: true,
              ),
            ),
            // confirm password
            Padding(
              padding: BaseUtility.top(
                BaseUtility.paddingNormalValue,
              ),
              child: CustomPasswordFieldWidget(
                passwordController: confirmPasswordController,
                hintText: 'Confirm Password',
                onChanged: (val) {},
                isLabelText: false,
                isValidator: true,
              ),
            ),
          ],
        ),
      );

  // verification button
  Widget get buildVerificationAndRefreshButtonWidget => Column(
        children: <Widget>[
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: 'Save Password',
            func: savePassword,
            btnStatus: ButtonTypes.primaryColorButton,
          ),
        ],
      );
}
