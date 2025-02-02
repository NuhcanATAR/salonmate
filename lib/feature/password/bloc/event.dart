import 'package:equatable/equatable.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class PasswordSendCodeEvent extends PasswordEvent {
  final int phoneNumber;

  const PasswordSendCodeEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class PasswordVerificationCodeEvent extends PasswordEvent {
  final int phoneNumber;
  final int verificationCode;

  const PasswordVerificationCodeEvent(this.phoneNumber, this.verificationCode);

  @override
  List<Object> get props => [phoneNumber, verificationCode];
}

class PasswordChangePasswordEvent extends PasswordEvent {
  final int userId;
  final String newPassword;

  const PasswordChangePasswordEvent(this.userId, this.newPassword);

  @override
  List<Object> get props => [userId, newPassword];
}
