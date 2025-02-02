import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String username;
  final String password;

  const SignInState({
    this.username = "",
    this.password = "",
  });

  SignInState copyWith({
    String? username,
    String? password,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [username, password];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;

  const SignInErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
