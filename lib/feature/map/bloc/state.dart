import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

abstract class MapLocationState extends Equatable {
  const MapLocationState();

  @override
  List<Object> get props => [];
}

class MapLocationInitialState extends MapLocationState {}

class MapLocationLoadedState extends MapLocationState {
  final String cityDistrict;
  final LatLng initialCenter;
  final LatLng myLocation;
  final List<SalonModel> salons;
  final MapController mapController;

  const MapLocationLoadedState({
    this.cityDistrict = '',
    this.initialCenter = const LatLng(50.5, 30.51),
    this.myLocation = const LatLng(50.5, 30.51),
    this.salons = const [],
    required this.mapController,
  });

  MapLocationLoadedState copyWith({
    String? cityDistrict,
    LatLng? initialCenter,
    LatLng? myLocation,
    List<SalonModel>? salons,
    MapController? mapController,
  }) {
    return MapLocationLoadedState(
      cityDistrict: cityDistrict ?? this.cityDistrict,
      initialCenter: initialCenter ?? this.initialCenter,
      myLocation: myLocation ?? this.myLocation,
      salons: salons ?? this.salons,
      mapController: mapController ?? this.mapController,
    );
  }

  @override
  List<Object> get props => [
        cityDistrict,
        initialCenter,
        myLocation,
        salons,
        mapController,
      ];
}
