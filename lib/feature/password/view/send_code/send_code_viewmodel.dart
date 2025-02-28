import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/password/bloc/event.dart';
import 'package:salonmate/feature/password/bloc/mixin.dart';
import 'package:salonmate/feature/password/view/send_code/send_code_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class PasswordSendCodeViewModel extends BaseState<PasswordSendCodeView>
    with PasswordMixin {
  final formSendCodeKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  void passwordSendCode() {
    if (formSendCodeKey.currentState!.validate()) {
      context.read<PasswordBloc>().add(
            PasswordSendCodeEvent(
              int.parse(
                phoneNumberController.text,
              ),
              context,
            ),
          );
    }
  }
}
