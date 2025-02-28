import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/map/bloc/event.dart';
import 'package:salonmate/feature/map/bloc/state.dart';
import 'package:salonmate/feature/map/map_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/location_information_card.dart';
import 'package:salonmate/product/widget/widget/location_on_button.dart';
import 'package:salonmate/product/widget/widget/map_salons.dart';
import 'package:salonmate/product/widget/widget/map_widget.dart';

import 'bloc/bloc.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends MapViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.map_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocBuilder<MapLocationBloc, MapLocationState>(
        builder: (context, state) {
          if (state is MapLocationLoadedState) {
            return buildBodyWidget(state);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // body
  Widget buildBodyWidget(MapLocationLoadedState state) => Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          // map
          buildMapWidget(state),
          // location information
          buildLocationInformationWidget(state),
          // location on
          buildLocationOnWidget,
          // salons
          buildSalonsWidget(state),
        ],
      );

  // map
  Widget buildMapWidget(MapLocationLoadedState state) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: MapSalonWidget(
          state: state,
        ),
      );

  // location information
  Widget buildLocationInformationWidget(MapLocationLoadedState state) =>
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: LocationInformationCardWidget(
          dynamicViewExtensions: dynamicViewExtensions,
          state: state,
        ),
      );

  // location on
  Widget get buildLocationOnWidget => Positioned(
        right: BaseUtility.marginNormalValue,
        top: 80,
        child: LocationOnButtonWidget(
          onTap: () {
            context.read<MapLocationBloc>().add(
                  MapLocationGetMyLocationEvent(
                    context: context,
                    dynamicViewExtensions: dynamicViewExtensions,
                  ),
                );
          },
        ),
      );

  // salons
  Widget buildSalonsWidget(MapLocationLoadedState state) => Positioned(
        bottom: 50,
        left: 0,
        right: 0,
        child: state.salons.isEmpty
            ? const SizedBox()
            : MapSalonsWidget(
                dynamicViewExtensions: dynamicViewExtensions,
                state: state,
              ),
      );
}
