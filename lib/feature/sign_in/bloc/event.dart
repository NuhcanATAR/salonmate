import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInFuncEvent extends SignInEvent {
  final String username;
  final String password;
  final BuildContext context;

  const SignInFuncEvent({
    required this.username,
    required this.password,
    required this.context,
  });

  @override
  List<Object> get props => [
        username,
        password,
        context,
      ];
}
