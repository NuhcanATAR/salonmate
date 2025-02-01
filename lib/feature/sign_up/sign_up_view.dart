import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/state.dart';
import 'package:salonmate/feature/sign_up/sign_up_viewmodel.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/email_field.dart';
import 'package:salonmate/product/widget/widget/location_menu.dart';
import 'package:salonmate/product/widget/widget/normal_text_field.dart';
import 'package:salonmate/product/widget/widget/password_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

import '../../product/constants/color.dart';
import '../../product/core/base/helper/navigator_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
    required this.phoneNumber,
  });

  final int phoneNumber;

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends SignUpViewmodel {
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
          text: 'Sign Up',
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: signUpListenerBloc,
        builder: (context, state) {
          return Form(
            key: formSignUpKey,
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
        title: 'SalonMake Hesabınızı Oluşturun.✂️',
        subtitle: 'Hesabınızı oluşturun ve hizmet almaya\nbaşlayın.',
      );

  // user name password field
  Column get buildUserNamePasswordFieldWidget => Column(
        children: <Widget>[
          // full name
          NormalTextFieldWidget(
            controller: fullNameController,
            hintText: 'Ad Soyad',
            explanationStatus: false,
            onChanged: (val) {},
            isValidator: true,
            enabled: true,
            isLabelText: true,
            dynamicViewExtensions: dynamicViewExtensions,
          ),
          // user name
          NormalTextFieldWidget(
            controller: userNameController,
            hintText: 'User Name',
            onChanged: (val) {},
            isLabelText: true,
            isValidator: true,
            explanationStatus: false,
            enabled: true,
            dynamicViewExtensions: dynamicViewExtensions,
          ),
          // e-mail
          CustomEmailFieldWidget(
            emailController: emailController,
            hintText: 'E-mail',
            onChanged: (val) {},
            isLabelText: true,
          ),

          // city & district
          LocationMenuWidget(
            onCityChanged: handleCityChanged,
            onDistrictChanged: handleDistrictChanged,
          ),
          // password
          CustomPasswordFieldWidget(
            passwordController: passwordController,
            hintText: 'Password',
            onChanged: (val) {},
            isValidator: true,
            isLabelText: true,
          ),
        ],
      );

  // sign in and sign up buttons
  Column get buildSignInAndSignUpButtonsWidget => Column(
        children: <Widget>[
          // sign in button
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: 'Next',
            func: signUp,
            btnStatus: ButtonTypes.primaryColorButton,
          ),
          // sign up
          Padding(
            padding: BaseUtility.top(
              BaseUtility.paddingNormalValue,
            ),
            child: Row(
              children: <Widget>[
                const Spacer(),
                const Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: BodyMediumBlackText(
                    text: "You have an account yet?",
                    textAlign: TextAlign.right,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => CodeNoahNavigatorRouter.push(
                      context,
                      const SignInView(),
                    ),
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: const BodyMediumMainColorBoldText(
                        text: 'Sign In',
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
