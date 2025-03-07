import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/password/view/send_code/send_code_view.dart';
import 'package:salonmate/feature/sign_in/bloc/cubit.dart';
import 'package:salonmate/feature/sign_in/bloc/state.dart';
import 'package:salonmate/feature/sign_in/sign_in_viewmodel.dart';
import 'package:salonmate/feature/sign_up/view/send_code/send_code_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/email_field.dart';
import 'package:salonmate/product/widget/widget/password_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends SignInViewModel {
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
        title: BodyMediumBlackBoldText(
          text: AppLocalizations.of(context)!.sign_in_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: signInListenerBloc,
        builder: (context, state) {
          return Form(
            key: formSignInKey,
            child: Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    // title sub title
                    buildTitleSubTitleWidget,
                    // user name password field
                    buildUserNamePasswordFieldWidget,
                    // forgot password
                    buildForgotPasswordWidget,
                    // sign in and sign up buttons
                    buildSignInAndSignUpButtonsWidget,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // title sub title
  TitleSubtitleWidget get buildTitleSubTitleWidget => TitleSubtitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        title: AppLocalizations.of(context)!.sign_in_title,
        subtitle: AppLocalizations.of(context)!.sign_in_sub_title,
      );

  // user name password field
  Column get buildUserNamePasswordFieldWidget => Column(
        children: <Widget>[
          // user name
          CustomEmailFieldWidget(
            emailController: usernameController,
            hintText: AppLocalizations.of(context)!.sign_in_user_name,
            onChanged: (val) {},
            isLabelText: true,
            isUserName: true,
          ),
          // password
          CustomPasswordFieldWidget(
            passwordController: passwordController,
            hintText: AppLocalizations.of(context)!.sign_in_password,
            onChanged: (val) {},
            isValidator: true,
            isLabelText: true,
          ),
        ],
      );

  // forgot password
  Container get buildForgotPasswordWidget => Container(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => CodeNoahNavigatorRouter.push(
            context,
            const PasswordSendCodeView(),
          ),
          child: BodyMediumMainColorBoldText(
            text: AppLocalizations.of(context)!.sign_in_forgot_password,
            textAlign: TextAlign.right,
          ),
        ),
      );

  // sign in and sign up buttons
  Column get buildSignInAndSignUpButtonsWidget => Column(
        children: <Widget>[
          // sign in button
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: AppLocalizations.of(context)!.sign_in_button,
            func: signIn,
            btnStatus: ButtonTypes.primaryColorButton,
          ),
          // sign up
          Padding(
            padding: BaseUtility.top(
              BaseUtility.paddingHightValue,
            ),
            child: Row(
              children: <Widget>[
                const Spacer(),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: BodyMediumBlackText(
                    text:
                        AppLocalizations.of(context)!.sign_in_dont_have_account,
                    textAlign: TextAlign.right,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => CodeNoahNavigatorRouter.push(
                      context,
                      const SignUpSendCodeView(),
                    ),
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: BodyMediumMainColorBoldText(
                        text: AppLocalizations.of(context)!
                            .sign_in_register_button,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
