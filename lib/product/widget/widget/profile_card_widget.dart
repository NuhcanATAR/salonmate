import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.dynamicViewExtensions,
  });

  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.vertical(
        BaseUtility.paddingNormalValue,
      ),
      child: Row(
        children: <Widget>[
          // profile avatar
          SizedBox(
            width: dynamicViewExtensions.dynamicWidth(context, 0.15),
            height: dynamicViewExtensions.dynamicHeight(context, 0.07),
            child: Container(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    BaseUtility.radiusCircularHighValue,
                  ),
                ),
              ),
              child: AppIcons.accountOutline.toSvgImg(
                Colors.white,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
            ),
          ),
          // profile information
          Expanded(
            flex: 3,
            child: Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // name surname
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: const TitleMediumBlackBoldText(
                      text: 'Nuhcan ATAR',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // email
                  Padding(
                    padding: BaseUtility.top(
                      BaseUtility.paddingMediumValue,
                    ),
                    child: SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: const BodyMediumBlackText(
                        text: 'nuhcanatar20@gmail.com',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
