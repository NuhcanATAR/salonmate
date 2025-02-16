import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/bloc/state.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

mixin AccountMixin {
  final loggerPrint = CustomLoggerPrint();
  // account information edit
  void accountInformationUpdateListenerBLoc(BuildContext context, state) {
    switch (state.runtimeType) {
      case AccountUpdateSuccess:
        Navigator.pop(context);
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: (state as AccountUpdateSuccess).message,
        );
        break;
      case AccountUpdateError:
        Navigator.pop(context);
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as AccountUpdateError).message,
        );
        break;
      case AccountUpdateLoading:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteText(
            text: 'Lütfen Bekleyiniz...',
            textAlign: TextAlign.center,
          ),
        );
        break;
      default:
        loggerPrint.printErrorLog('Case Error');
    }
  }
}
