import 'package:flutter/material.dart';
import 'package:salonmate/feature/sign_up/view/send_code/send_code_view.dart';
import 'package:salonmate/feature/sign_up/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';

abstract class SignUpSendCodeViewModel extends BaseState<SignUpSendCodeView> {
  final formSendCodeKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  void sendCode() {
    if (formSendCodeKey.currentState!.validate()) {
      CodeNoahNavigatorRouter.push(
        context,
        VerificationCodeView(
          phoneNumber: int.parse(phoneNumberController.text),
        ),
      );
    }
  }
}
