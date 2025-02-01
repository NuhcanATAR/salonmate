import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpSendCodeLoadingState extends SignUpState {}

class SignUpSendCodeSuccessState extends SignUpState {
  final int phoneNumber;

  const SignUpSendCodeSuccessState({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}

class SignUpSendCodeErrorState extends SignUpState {
  final String errorMessage;

  const SignUpSendCodeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SignUpVerifyCodeLoadingState extends SignUpState {}

class SignUpVerifyCodeSuccessState extends SignUpState {
  final int phoneNumber;

  const SignUpVerifyCodeSuccessState({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}

class SignUpVerifyCodeErrorState extends SignUpState {
  final String errorMessage;

  const SignUpVerifyCodeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final String message;

  const SignUpSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  const SignUpErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
