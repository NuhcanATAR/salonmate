import 'package:geolocator/geolocator.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/widget/widget/salon_card.dart';
import 'package:salonmate/product/widget/widget/salon_detail_card.dart';

abstract class SalonCardWidgetModel extends BaseState<SalonCardWidget> {
  double? distance;

  @override
  void initState() {
    super.initState();
    _loadDistance();
  }

  Future<void> _loadDistance() async {
    final double? calculatedDistance = await calculateDistance(
      salonLatitude: widget.salonModel.latitude,
      salonLongitude: widget.salonModel.longitude,
    );

    setState(() {
      distance = calculatedDistance;
    });
  }

  Future<double?> calculateDistance({
    required double salonLatitude,
    required double salonLongitude,
  }) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final double userLatitude = position.latitude;
      final double userLongitude = position.longitude;

      final double distanceInMeters = Geolocator.distanceBetween(
        userLatitude,
        userLongitude,
        salonLatitude,
        salonLongitude,
      );

      return distanceInMeters / 1000;
    } catch (e) {
      loggerPrint.printErrorLog('Konum hesaplama hatası: $e');
      return null;
    }
  }
}

abstract class SalonDetailCardWidgetModel
    extends BaseState<SalonDetailCardWidget> {
  double? distance;

  @override
  void initState() {
    super.initState();
    _loadDistance();
  }

  Future<void> _loadDistance() async {
    final double? calculatedDistance = await calculateDistance(
      salonLatitude: widget.salonModel.latitude,
      salonLongitude: widget.salonModel.longitude,
    );

    setState(() {
      distance = calculatedDistance;
    });
  }

  Future<double?> calculateDistance({
    required double salonLatitude,
    required double salonLongitude,
  }) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final double userLatitude = position.latitude;
      final double userLongitude = position.longitude;

      final double distanceInMeters = Geolocator.distanceBetween(
        userLatitude,
        userLongitude,
        salonLatitude,
        salonLongitude,
      );

      return distanceInMeters / 1000;
    } catch (e) {
      loggerPrint.printErrorLog('Konum hesaplama hatası: $e');
      return null;
    }
  }
}
