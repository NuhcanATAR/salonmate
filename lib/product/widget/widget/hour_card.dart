import 'package:flutter/material.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class HourCardWidget extends StatelessWidget {
  const HourCardWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.borderColor,
  });

  final Function() onTap;
  final Color? borderColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: BaseUtility.all(BaseUtility.paddingNormalValue),
        margin: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(BaseUtility.radiusCircularMediumValue),
          ),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: 1,
                )
              : null,
        ),
        child: BodyMediumBlackText(
          text: text,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
