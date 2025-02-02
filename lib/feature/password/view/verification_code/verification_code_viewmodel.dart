import 'package:flutter/material.dart';
import 'package:salonmate/feature/password/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class PasswordVerificationCodeViewModel
    extends BaseState<PasswordVerificationCodeView> {
  final formVerificationCodeKey = GlobalKey<FormState>();

  TextEditingController verificationCodeController = TextEditingController();

  void verificationCode() {
    if (formVerificationCodeKey.currentState!.validate()) {}
  }
}
