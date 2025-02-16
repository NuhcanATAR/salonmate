import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final String fullName;
  final int phoneNumber;
  final String address;
  AccountLoaded({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
  });

  @override
  List<Object> get props => [fullName, phoneNumber, address];
}

class AccountError extends AccountState {
  final String message;
  AccountError({required this.message});

  @override
  List<Object> get props => [message];
}
