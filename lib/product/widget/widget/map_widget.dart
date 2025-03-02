import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:salonmate/feature/map/bloc/state.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/widget/widget/marker_widget.dart';

class MapSalonWidget extends StatelessWidget {
  const MapSalonWidget({
    super.key,
    required this.state,
  });

  final MapLocationLoadedState state;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: state.mapController,
      options: MapOptions(
        initialCenter: state.myLocation,
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            // my location
            Marker(
              width: 40.0,
              height: 40.0,
              point: state.myLocation,
              child: const MapMarkerWidget(
                appIcon: AppIcons.locationFill,
              ),
            ),
            // salons
            ...state.salons.map(
              (salon) => Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(salon.latitude, salon.longitude),
                child: MapMarkerWidget(
                  appIcon: AppIcons.shopLine,
                  onTap: () => CodeNoahNavigatorRouter.push(
                    context,
                    SalonDetailView(
                      salonId: salon.id,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
