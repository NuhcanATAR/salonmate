import 'package:flutter/material.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class StylistCardWidget extends StatelessWidget {
  const StylistCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.dynamicHeight(context, 0.18),
        child: Container(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          margin: BaseUtility.bottom(
            BaseUtility.paddingNormalValue,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                BaseUtility.radiusCircularNormalValue,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              // avatar
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Padding(
                  padding: BaseUtility.all(
                    BaseUtility.paddingSmallValue,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://this-person-does-not-exist.com/img/avatar-gen8c32fba6d76c31b634c2751591976eee.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // information
              Expanded(
                flex: 5,
                child: Padding(
                  padding: BaseUtility.horizontal(
                    BaseUtility.paddingMediumValue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // name surname
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingMediumValue,
                          ),
                          child: const TitleMediumBlackBoldText(
                            text: 'Nuhcan ATAR',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // expert category
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingMediumValue,
                          ),
                          child: const BodyMediumBlackText(
                            text: 'Hair Specialist',
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
        ),
      ),
    );
  }
}
