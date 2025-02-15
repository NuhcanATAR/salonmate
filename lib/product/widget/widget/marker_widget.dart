import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';

class MapMarkerWidget extends StatelessWidget {
  const MapMarkerWidget({
    super.key,
    required this.appIcon,
    this.onTap,
  });

  final AppIcons appIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: BaseUtility.all(BaseUtility.paddingSmallValue),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: appIcon.toSvgImg(
          Colors.white,
          BaseUtility.iconNormalSize,
          BaseUtility.iconNormalSize,
        ),
      ),
    );
  }
}
