import 'package:flutter/material.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.title,
    required this.subtitle,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        SizedBox(
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
        SizedBox(
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
