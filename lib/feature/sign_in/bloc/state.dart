import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String email;
  final String password;

  const SignInState({
    this.email = "",
    this.password = "",
  });

  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];
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
