import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class LanguageCardWidget extends StatelessWidget {
  const LanguageCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.languageText,
    required this.groupValue,
    required this.onChanged,
    required this.value,
    required this.appImage,
  });

  final DynamicViewExtensions dynamicViewExtensions;

  final String languageText;
  final String? groupValue;
  final Function(String?)? onChanged;
  final String value;
  final AppImages appImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      child: Container(
        margin: BaseUtility.top(
          BaseUtility.paddingNormalValue,
        ),
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              BaseUtility.radiusCircularMediumValue,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Expanded(
              child: Padding(
                padding: BaseUtility.horizontal(
                  BaseUtility.paddingNormalValue,
                ),
                child: BodyMediumBlackText(
                  text: languageText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            appImage.toPngImg(
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
          ],
        ),
      ),
    );
  }
}
