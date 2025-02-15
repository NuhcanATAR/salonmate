import 'package:flutter/material.dart';
import 'package:salonmate/feature/map/bloc/state.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class LocationInformationCardWidget extends StatelessWidget {
  const LocationInformationCardWidget({
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
      child: Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: Row(
          children: <Widget>[
            AppIcons.locationOutline.toSvgImg(
              Colors.blue,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
            Expanded(
              child: Padding(
                padding: BaseUtility.horizontal(
                  BaseUtility.paddingNormalValue,
                ),
                child: TitleMediumBlackText(
                  text: state.cityDistrict.isNotEmpty
                      ? state.cityDistrict
                      : "Konum Bilinmiyor",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
