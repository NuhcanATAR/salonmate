import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInFuncEvent extends SignInEvent {
  final String username;
  final String password;

  const SignInFuncEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
