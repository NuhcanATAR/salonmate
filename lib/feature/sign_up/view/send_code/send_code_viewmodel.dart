import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/event.dart';
import 'package:salonmate/feature/sign_up/bloc/mixin.dart';
import 'package:salonmate/feature/sign_up/view/send_code/send_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class SignUpSendCodeViewModel extends BaseState<SignUpSendCodeView>
    with SignUpMixin {
  final formSendCodeKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  void sendCode() {
    if (formSendCodeKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(
            SignUpSendCodeEvent(
              phoneNumber: int.parse(phoneNumberController.text),
            ),
          );
    }
  }
}
