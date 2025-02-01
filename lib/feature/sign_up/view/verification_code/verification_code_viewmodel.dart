import 'package:flutter/material.dart';
import 'package:salonmate/feature/sign_up/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class VerificationCodeViewModel
    extends BaseState<VerificationCodeView> {
  final formVerificationCodeKey = GlobalKey<FormState>();

  TextEditingController otpCodeController = TextEditingController();

  void verificationCode() {
    if (formVerificationCodeKey.currentState!.validate()) {}
  }
}
