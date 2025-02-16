import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AccountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAccountData extends AccountEvent {
  final BuildContext context;
  FetchAccountData({
    required this.context,
  });

  @override
  List<Object> get props => [context];
}
