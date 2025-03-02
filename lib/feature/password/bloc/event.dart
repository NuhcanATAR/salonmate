import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class PasswordSendCodeEvent extends PasswordEvent {
  final int phoneNumber;
  final BuildContext context;

  const PasswordSendCodeEvent(
    this.phoneNumber,
    this.context,
  );

  @override
  List<Object> get props => [
        phoneNumber,
        context,
      ];
}

class PasswordVerificationCodeEvent extends PasswordEvent {
  final int phoneNumber;
  final int verificationCode;
  final BuildContext context;

  const PasswordVerificationCodeEvent(
    this.phoneNumber,
    this.verificationCode,
    this.context,
  );

  @override
  List<Object> get props => [
        phoneNumber,
        verificationCode,
        context,
      ];
}

class PasswordChangePasswordEvent extends PasswordEvent {
  final int userId;
  final String newPassword;
  final BuildContext context;

  const PasswordChangePasswordEvent(
    this.userId,
    this.newPassword,
    this.context,
  );

  @override
  List<Object> get props => [
        userId,
        newPassword,
        context,
      ];
}
