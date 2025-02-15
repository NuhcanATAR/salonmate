import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';

abstract class MapLocationEvent extends Equatable {
  const MapLocationEvent();

  @override
  List<Object> get props => [];
}

class MapLocationGetCityDistrictEvent extends MapLocationEvent {}

class MapLocationGetMyLocationEvent extends MapLocationEvent {
  final BuildContext context;
  final DynamicViewExtensions dynamicViewExtensions;

  const MapLocationGetMyLocationEvent({
    required this.context,
    required this.dynamicViewExtensions,
  });

  @override
  List<Object> get props => [
        context,
        dynamicViewExtensions,
      ];
}

class MapLocationGetSalonsEvent extends MapLocationEvent {}
