import 'package:equatable/equatable.dart';

class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitialState extends PasswordState {}

class PasswordSendCodeLoadingState extends PasswordState {}

class PasswordSendCodeSuccessState extends PasswordState {
  final int phoneNumber;

  const PasswordSendCodeSuccessState({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class PasswordSendCodeErrorState extends PasswordState {
  final String errorMessage;

  const PasswordSendCodeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PasswordVerificationCodeLoadingState extends PasswordState {}

class PasswordVerificationCodeSuccessState extends PasswordState {
  final int userId;

  const PasswordVerificationCodeSuccessState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class PasswordVerificationCodeErrorState extends PasswordState {
  final String errorMessage;

  const PasswordVerificationCodeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PasswordNewPasswordStateLoadingState extends PasswordState {}

class PasswordNewPasswordSuccessState extends PasswordState {}

class PasswordNewPasswordErrorState extends PasswordState {
  final String errorMessage;

  const PasswordNewPasswordErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
