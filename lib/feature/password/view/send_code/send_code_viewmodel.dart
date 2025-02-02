import 'package:flutter/material.dart';
import 'package:salonmate/feature/password/view/send_code/send_code_view.dart';
import 'package:salonmate/feature/password/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';

abstract class PasswordSendCodeViewModel
    extends BaseState<PasswordSendCodeView> {
  final formSendCodeKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  void passwordSendCode() {
    if (formSendCodeKey.currentState!.validate()) {
      CodeNoahNavigatorRouter.push(
        context,
        PasswordVerificationCodeView(
          phoneNumber: int.parse(phoneNumberController.text),
        ),
      );
    }
  }
}
