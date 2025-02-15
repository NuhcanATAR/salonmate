import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:salonmate/feature/map/bloc/event.dart';
import 'package:salonmate/feature/map/bloc/state.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/widget/button.dart';

class MapLocationBloc extends Bloc<MapLocationEvent, MapLocationState> {
  final prefService = PrefService();
  Future<String> getAuthToken() async {
    return await prefService.getString(SharedKeys.token) ?? '';
  }

  MapLocationBloc()
      : super(MapLocationLoadedState(mapController: MapController())) {
    on<MapLocationGetCityDistrictEvent>(_onGetCityDistrict);
    on<MapLocationGetMyLocationEvent>(_onGetMyLocation);
    on<MapLocationGetSalonsEvent>(_onGetSalons);
  }

  Future<void> _onGetCityDistrict(
    MapLocationGetCityDistrictEvent event,
    Emitter<MapLocationState> emit,
  ) async {
    if (state is! MapLocationLoadedState) return;

    final loadedState = state as MapLocationLoadedState;
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      emit(loadedState.copyWith(cityDistrict: 'Konum Bilinmiyor'));
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      emit(
        loadedState.copyWith(
          cityDistrict: place.subAdministrativeArea ?? "Bilinmeyen İlçe",
        ),
      );
    }
  }

  Future<void> _onGetMyLocation(
    MapLocationGetMyLocationEvent event,
    Emitter<MapLocationState> emit,
  ) async {
    if (state is! MapLocationLoadedState) return;

    final loadedState = state as MapLocationLoadedState;
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (!event.context.mounted) return;
      CodeNoahDialogs(event.context).showModalBottom(
        barrierColor: Colors.black54.withOpacity(0.2),
        backgroundColor: Colors.white,
        dynamicViewExtensions: event.dynamicViewExtensions,
        barHeight:
            event.dynamicViewExtensions.dynamicHeight(event.context, 0.1),
        Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppImages.locationPermissions.toSvgImg(
                null,
                event.dynamicViewExtensions.maxWidth(event.context),
                event.dynamicViewExtensions.dynamicHeight(
                  event.context,
                  0.2,
                ),
              ),
              Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleLargeBlackBoldText(
                  text: 'Konum İzini Bulunmuyor',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingNormalValue,
                ),
                child: const BodyMediumBlackText(
                  text:
                      'Salon Haritalarından en iyi şekilde yararlanmak için, lütfen konum erişimi izini veriniz.',
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButtonWidget(
                dynamicViewExtensions: event.dynamicViewExtensions,
                text: 'UYGULAMA AYARLARI',
                func: () {
                  Navigator.pop(event.context);
                  openAppSettings();
                },
                btnStatus: ButtonTypes.primaryColorButton,
              ),
            ],
          ),
        ),
      );
    }

    final position = await Geolocator.getCurrentPosition();
    final newLocation = LatLng(position.latitude, position.longitude);

    loadedState.mapController.move(newLocation, 15.0);
    emit(loadedState.copyWith(myLocation: newLocation));
  }

  Future<void> _onGetSalons(
    MapLocationGetSalonsEvent event,
    Emitter<MapLocationState> emit,
  ) async {
    if (state is! MapLocationLoadedState) return;

    final loadedState = state as MapLocationLoadedState;
    final token = await getAuthToken();
    final salonResponse = await http.get(
      EndPoints.uriParse(EndPoints.salonsEndPoint),
      headers: ApiService.headersToken(token),
    );

    if (salonResponse.statusCode == 200) {
      final salonData = jsonDecode(salonResponse.body);
      if (salonData == null ||
          salonData['salons'] == null ||
          salonData['salons'] is! List) {
        return;
      }
      final List<dynamic> rawSalons = salonData['salons'] as List<dynamic>;
      final List<SalonModel> salonsList = rawSalons
          .map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
          .toList();
      emit(loadedState.copyWith(salons: salonsList));
    }
  }
}
