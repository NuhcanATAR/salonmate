import 'package:flutter/material.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class DayCardWidget extends StatelessWidget {
  const DayCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.right(
        BaseUtility.paddingNormalValue,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: dynamicViewExtensions.dynamicWidth(context, 0.18),
          child: Container(
            padding: BaseUtility.all(
              BaseUtility.paddingMediumValue,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  BaseUtility.radiusCircularMediumValue,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // day
                const TitleMediumBlackBoldText(
                  text: 'THU',
                  textAlign: TextAlign.center,
                ),
                // value
                Padding(
                  padding: BaseUtility.vertical(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: const BodyMediumBlackText(
                    text: 'Sep 11',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
