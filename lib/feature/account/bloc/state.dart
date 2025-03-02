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
  final String city;
  final String district;

  AccountLoaded({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.district,
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

class AccountUpdateLoading extends AccountState {}

class AccountUpdateSuccess extends AccountState {
  final String message;

  AccountUpdateSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AccountUpdateError extends AccountState {
  final String message;

  AccountUpdateError({required this.message});

  @override
  List<Object> get props => [message];
}

class AccountCityDistrictUpdateLoadingState extends AccountState {}

class AccountCityDistrictUpdateSuccessState extends AccountState {
  final String message;

  AccountCityDistrictUpdateSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AccountCityDistrictUpdateErrorState extends AccountState {
  final String message;

  AccountCityDistrictUpdateErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
