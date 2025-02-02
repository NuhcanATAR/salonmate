import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/event.dart';
import 'package:salonmate/feature/sign_up/bloc/mixin.dart';
import 'package:salonmate/feature/sign_up/view/verification_code/verification_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class SignUpVerificationCodeViewModel
    extends BaseState<SignUpVerificationCodeView> with SignUpMixin {
  final formVerificationCodeKey = GlobalKey<FormState>();

  TextEditingController otpCodeController = TextEditingController();

  void verificationCode() {
    if (formVerificationCodeKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(
            SignUpVerificationCodeEvent(
              verificationCode: int.parse(otpCodeController.text),
              phoneNumber: widget.phoneNumber,
            ),
          );
    }
  }
}
