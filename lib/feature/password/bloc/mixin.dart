import 'package:flutter/material.dart';
import 'package:salonmate/feature/password/bloc/state.dart';
import 'package:salonmate/feature/password/password_view.dart';
import 'package:salonmate/feature/password/view/verification_code/verification_code_view.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

mixin PasswordMixin {
  final printLogger = CustomLoggerPrint();

  // send code
  void passwordSendCodeListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case PasswordSendCodeSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.push(
          context,
          PasswordVerificationCodeView(
            phoneNumber: (state as PasswordSendCodeSuccessState).phoneNumber,
          ),
        );
        break;
      case PasswordSendCodeErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as PasswordSendCodeErrorState).errorMessage,
        );
        break;
      case PasswordSendCodeLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteBoldText(
            text: 'Loading...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        printLogger.printErrorLog('Case Error');
    }
  }

  // verification code
  void passwordVerificationCodeListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case PasswordVerificationCodeSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.push(
          context,
          PasswordView(
            userId: (state as PasswordVerificationCodeSuccessState).userId,
          ),
        );
        break;
      case PasswordVerificationCodeErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as PasswordVerificationCodeErrorState).errorMessage,
        );
        break;
      case PasswordVerificationCodeLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteBoldText(
            text: 'Loading...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        printLogger.printErrorLog('Case Error');
    }
  }

  // change password
  void passwordChangePasswordListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case PasswordNewPasswordSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.push(
          context,
          const SignInView(),
        );
        break;
      case PasswordNewPasswordErrorState:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as PasswordVerificationCodeErrorState).errorMessage,
        );
        break;
      case PasswordNewPasswordStateLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteBoldText(
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
