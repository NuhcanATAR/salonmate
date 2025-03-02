import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSendCodeEvent extends SignUpEvent {
  final int phoneNumber;
  final BuildContext context;

  const SignUpSendCodeEvent({
    required this.phoneNumber,
    required this.context,
  });

  @override
  List<Object> get props => [
        phoneNumber,
        context,
      ];
}

class SignUpVerificationCodeEvent extends SignUpEvent {
  final int verificationCode;
  final int phoneNumber;
  final BuildContext context;

  const SignUpVerificationCodeEvent({
    required this.verificationCode,
    required this.phoneNumber,
    required this.context,
  });

  @override
  List<Object> get props => [
        verificationCode,
        phoneNumber,
        context,
      ];
}

class SignUpFuncEvent extends SignUpEvent {
  final String email;
  final String password;
  final String fullName;
  final int phoneNumber;
  final String city;
  final String district;
  final String userName;
  final BuildContext context;

  const SignUpFuncEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.district,
    required this.userName,
    required this.context,
  });

  @override
  List<Object> get props => [
        email,
        password,
        fullName,
        phoneNumber,
        city,
        district,
        userName,
        context,
      ];
}
