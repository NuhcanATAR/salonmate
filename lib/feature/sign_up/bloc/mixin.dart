import 'package:flutter/material.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/feature/sign_up/bloc/state.dart';
import 'package:salonmate/feature/sign_up/sign_up_view.dart';
import 'package:salonmate/feature/sign_up/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

mixin SignUpMixin {
  final printLogger = CustomLoggerPrint();
  void signUpSendCodeListenerBLoc(BuildContext context, SignUpState state) {
    switch (state.runtimeType) {
      case SignUpSendCodeSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.push(
          context,
          SignUpVerificationCodeView(
            phoneNumber: (state as SignUpSendCodeSuccessState).phoneNumber,
          ),
        );
        break;
      case SignUpSendCodeErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as SignUpSendCodeErrorState).errorMessage,
        );
        break;
      case SignUpSendCodeLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteText(
            text: 'Loading...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        printLogger.printErrorLog('Case Error');
    }
  }

  void signUpVerificationCodeListenerBLoc(
    BuildContext context,
    SignUpState state,
  ) {
    switch (state.runtimeType) {
      case SignUpVerifyCodeSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          SignUpView(
            phoneNumber: (state as SignUpVerifyCodeSuccessState).phoneNumber,
          ),
        );
        break;
      case SignUpVerifyCodeErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as SignUpVerifyCodeErrorState).errorMessage,
        );
        break;
      case SignUpVerifyCodeLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteText(
            text: 'Loading...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        printLogger.printErrorLog('Case Error');
    }
  }

  void signUpListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case SignUpSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          const SignInView(),
        );
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: (state as SignUpSuccessState).message,
        );

        break;
      case SignUpErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as SignUpErrorState).errorMessage,
        );
        break;
      case SignUpLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteText(
            text: 'Loading...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        printLogger.printErrorLog('Case Error');
    }
  }
}
