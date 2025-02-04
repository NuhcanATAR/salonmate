import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: BaseUtility.right(
          BaseUtility.marginNormalValue,
        ),
        padding: BaseUtility.right(
          BaseUtility.paddingNormalValue,
        ),
        child: Row(
          children: <Widget>[
            AppIcons.locationFill.toSvgImg(
              Colors.black54,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
            Padding(
              padding: BaseUtility.left(
                BaseUtility.paddingMediumValue,
              ),
              child: const BodyMediumBlackBoldText(
                text: 'Saç Kesim',
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
