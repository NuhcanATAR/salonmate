import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:salonmate/feature/map/bloc/bloc.dart';
import 'package:salonmate/feature/map/bloc/event.dart';
import 'package:salonmate/feature/map/bloc/state.dart';
import 'package:salonmate/feature/map/map_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';

abstract class MapViewModel extends BaseState<MapView>
    with WidgetsBindingObserver {
  late List<SalonModel> salonList = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkAndRequestLocationPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final state = context.watch<MapLocationBloc>().state;

    if (state is MapLocationLoadedState) {
      if (state.myLocation != const LatLng(50.5, 30.51)) {
        context.read<MapLocationBloc>().add(MapLocationGetSalonsEvent());
      }

      if (state.salons.isNotEmpty) {
        context
            .read<MapLocationBloc>()
            .add(MapLocationGetCityDistrictEvent(context: context));
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkAndRequestLocationPermission();
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      if (!mounted) return;
      context.read<MapLocationBloc>().add(
            MapLocationGetMyLocationEvent(
              context: context,
              dynamicViewExtensions: dynamicViewExtensions,
            ),
          );
    }
  }
}
