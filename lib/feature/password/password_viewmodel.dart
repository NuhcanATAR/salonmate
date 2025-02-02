import 'package:flutter/material.dart';
import 'package:salonmate/feature/password/password_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';

abstract class PasswordViewModel extends BaseState<PasswordView> {
  final formNewPasswordKey = GlobalKey<FormState>();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void savePassword() {
    if (formNewPasswordKey.currentState!.validate()) {
      if (newPasswordController.text == confirmPasswordController.text) {
      } else {
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'Şifreleri Doğrulayınız.',
        );
      }
    }
  }
}
