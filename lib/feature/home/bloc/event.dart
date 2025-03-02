import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeLoadEvent extends HomeEvent {
  final String token;
  final BuildContext context;

  HomeLoadEvent(
    this.token,
    this.context,
  );

  @override
  List<Object> get props => [
        token,
        context,
      ];
}

class HomeLoadSalonsEvent extends HomeEvent {
  final String token;

  HomeLoadSalonsEvent(this.token);

  @override
  List<Object> get props => [token];
}
