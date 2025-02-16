import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AccountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAccountDataEvent extends AccountEvent {
  final BuildContext context;
  FetchAccountDataEvent({
    required this.context,
  });

  @override
  List<Object> get props => [context];
}

class AccountInformationEvent extends AccountEvent {
  final String token;
  final String fullName;
  final int phoneNumber;
  final String address;

  AccountInformationEvent({
    required this.token,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
  });

  @override
  List<Object> get props => [token, fullName, phoneNumber, address];
}
