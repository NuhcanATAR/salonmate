import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ServicesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ServicesLoadedEvent extends ServicesEvent {
  final String token;
  final String categoryId;
  final BuildContext context;

  ServicesLoadedEvent({
    required this.token,
    required this.categoryId,
    required this.context,
  });

  @override
  List<Object> get props => [
        token,
        context,
      ];
}
