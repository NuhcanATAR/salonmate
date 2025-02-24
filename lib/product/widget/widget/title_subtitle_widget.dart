import 'package:flutter/material.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.title,
    required this.subtitle,
    this.isCenter = false,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final String title;
  final String subtitle;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        isCenter == true
            ? Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: TitleMediumBlackBoldText(
                  text: title,
                  textAlign: TextAlign.center,
                ),
              )
            : SizedBox(
                width: dynamicViewExtensions.maxWidth(context),
                child: Padding(
                  padding: BaseUtility.vertical(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: TitleLargeBlackBoldText(
                    text: title,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
        // sub title
        isCenter == true
            ? Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingSmallValue,
                ),
                child: BodyMediumBlackText(
                  text: subtitle,
                  textAlign: TextAlign.center,
                ),
              )
            : SizedBox(
                width: dynamicViewExtensions.maxWidth(context),
                child: Padding(
                  padding: BaseUtility.bottom(
                    BaseUtility.paddingSmallValue,
                  ),
                  child: TitleMediumBlackText(
                    text: subtitle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
      ],
    );
  }
}
