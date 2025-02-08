import 'package:equatable/equatable.dart';

abstract class ServicesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ServicesLoadedEvent extends ServicesEvent {
  final String token;
  final String categoryId;

  ServicesLoadedEvent({required this.token, required this.categoryId});

  @override
  List<Object> get props => [token];
}
