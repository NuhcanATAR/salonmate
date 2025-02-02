import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/password/bloc/event.dart';
import 'package:salonmate/feature/password/bloc/mixin.dart';
import 'package:salonmate/feature/password/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class PasswordVerificationCodeViewModel
    extends BaseState<PasswordVerificationCodeView> with PasswordMixin {
  final formVerificationCodeKey = GlobalKey<FormState>();

  TextEditingController verificationCodeController = TextEditingController();

  void verificationCode() {
    if (formVerificationCodeKey.currentState!.validate()) {
      context.read<PasswordBloc>().add(
            PasswordVerificationCodeEvent(
              widget.phoneNumber,
              int.parse(verificationCodeController.text),
            ),
          );
    }
  }
}
