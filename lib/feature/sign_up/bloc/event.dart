import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSendCodeEvent extends SignUpEvent {
  final int phoneNumber;

  const SignUpSendCodeEvent({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [
        phoneNumber,
      ];
}

class SignUpVerificationCodeEvent extends SignUpEvent {
  final int verificationCode;
  final int phoneNumber;

  const SignUpVerificationCodeEvent({
    required this.verificationCode,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [
        verificationCode,
        phoneNumber,
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

  const SignUpFuncEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.district,
    required this.userName,
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
      ];
}
