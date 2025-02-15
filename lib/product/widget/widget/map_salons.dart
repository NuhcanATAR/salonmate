import 'package:flutter/widgets.dart';
import 'package:salonmate/feature/map/bloc/state.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_view.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/widget/widget/map_salon_card.dart';

class MapSalonsWidget extends StatelessWidget {
  const MapSalonsWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.state,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final MapLocationLoadedState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      height: dynamicViewExtensions.dynamicHeight(context, 0.32),
      child: ListView.builder(
        itemCount: state.salons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final salonModel = state.salons[index];

          return MapSalonCardWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            model: salonModel,
            onTap: () => CodeNoahNavigatorRouter.push(
              context,
              SalonDetailView(
                salonId: salonModel.id,
              ),
            ),
          );
        },
      ),
    );
  }
}
