import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';

class LocationOnButtonWidget extends StatelessWidget {
  const LocationOnButtonWidget({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              BaseUtility.radiusCircularLowValue,
            ),
          ),
        ),
        child: AppIcons.locationOutline.toSvgImg(
          Colors.blue,
          BaseUtility.iconNormalSize,
          BaseUtility.iconNormalSize,
        ),
      ),
    );
  }
}
