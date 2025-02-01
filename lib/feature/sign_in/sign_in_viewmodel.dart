import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_in/bloc/cubit.dart';
import 'package:salonmate/feature/sign_in/bloc/event.dart';
import 'package:salonmate/feature/sign_in/bloc/mixin.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class SignInViewModel extends BaseState<SignInView> with SignInMixin {
  final formSignInKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() {
    if (formSignInKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
            SignInFuncEvent(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
