import 'package:flutter/material.dart';
import 'package:salonmate/feature/sign/sign_viewmodel.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/widget/button.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends SignViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.maxHeight(context),
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashCover.toPng),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // sign in and title
            buildTitleAndSignInWidget,
            // or
            Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingNormalValue,
              ),
              child: BodyMediumWhiteText(
                text: AppLocalizations.of(context)!.sign_or,
                textAlign: TextAlign.center,
              ),
            ),
            // google and apple auth
            buildGoogleAndAppleAuthWidget,
          ],
        ),
      ),
    );
  }

  // title and sign in
  Widget get buildTitleAndSignInWidget => Column(
        children: <Widget>[
          // title
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: TitleLargeWhiteBoldText(
                text: AppLocalizations.of(context)!.sign_title,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // sign in
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: AppLocalizations.of(context)!.sign_sign_in_button,
            func: () => CodeNoahNavigatorRouter.push(
              context,
              const SignInView(),
            ),
            btnStatus: ButtonTypes.primaryColorButton,
          ),
        ],
      );

  // google and apple auth
  Widget get buildGoogleAndAppleAuthWidget => Column(
        children: <Widget>[
          // google auth
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: AppLocalizations.of(context)!.sign_google_auth_button,
            func: comingSoon,
            btnStatus: ButtonTypes.whiteColorIconButton,
            appImages: AppImages.google,
          ),
          // apple auth
          Padding(
            padding: BaseUtility.bottom(
              BaseUtility.paddingNormalValue,
            ),
            child: CustomButtonWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              text: AppLocalizations.of(context)!.sign_apple_auth_button,
              func: comingSoon,
              btnStatus: ButtonTypes.blackColorIconButton,
              appImages: AppImages.apple,
            ),
          ),
        ],
      );
}
