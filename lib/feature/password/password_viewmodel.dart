import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/password/bloc/event.dart';
import 'package:salonmate/feature/password/bloc/mixin.dart';
import 'package:salonmate/feature/password/password_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';

abstract class PasswordViewModel extends BaseState<PasswordView>
    with PasswordMixin {
  final formNewPasswordKey = GlobalKey<FormState>();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void savePassword() {
    if (formNewPasswordKey.currentState!.validate()) {
      if (newPasswordController.text == confirmPasswordController.text) {
        context.read<PasswordBloc>().add(
              PasswordChangePasswordEvent(
                widget.userId,
                newPasswordController.text,
              ),
            );
      } else {
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'Şifreleri Doğrulayınız.',
        );
      }
    }
  }
}
