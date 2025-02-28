import 'package:flutter/material.dart';
import 'package:salonmate/feature/bottom_navigator/bottom_navigator_view.dart';
import 'package:salonmate/feature/sign_in/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

mixin SignInMixin {
  final printLogger = CustomLoggerPrint();
  void signInListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case SignInSuccessState:
        Navigator.pop(context);
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          const BottomNavigatorView(),
        );
        break;
      case SignInErrorState:
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as SignInErrorState).error,
        );
        break;
      case SignInLoadingState:
        CodeNoahDialogs(context).showAlert(
          BodyMediumWhiteBoldText(
            text: AppLocalizations.of(context)!.sign_in_loading,
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        printLogger.printInfoLog('Case Error');
    }
  }
}
