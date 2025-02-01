import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInFuncEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInFuncEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
