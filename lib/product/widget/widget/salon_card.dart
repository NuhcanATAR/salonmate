import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class SalonCardWidget extends StatelessWidget {
  const SalonCardWidget({
    super.key,
    required this.onTap,
    required this.dynamicViewExtensions,
  });

  final Function() onTap;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.dynamicHeight(
          context,
          0.18,
        ),
        child: Container(
          padding: BaseUtility.all(
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
              // salon cover
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/caffely-90d9a.appspot.com/o/SalonMakeApp%2Fsalon_covers%2Fsalon_cover_second.png?alt=media&token=2aa91e3e-095a-40ae-bab2-64228cf3e728',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        BaseUtility.radiusCircularMediumValue,
                      ),
                    ),
                  ),
                ),
              ),
              // information
              Expanded(
                flex: 2,
                child: Padding(
                  padding: BaseUtility.left(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // title
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: const Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: TitleMediumBlackBoldText(
                                text: 'Hair Avenue ',
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: BodyMediumBlackText(
                                text: '2 Km',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // location
                      Padding(
                        padding: BaseUtility.vertical(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: Row(
                          children: <Widget>[
                            AppIcons.locationOutline.toSvgImg(
                              Theme.of(context).colorScheme.primary,
                              BaseUtility.iconMediumSize,
                              BaseUtility.iconMediumSize,
                            ),
                            Expanded(
                              child: Padding(
                                padding: BaseUtility.left(
                                  BaseUtility.paddingMediumValue,
                                ),
                                child: const BodyMediumBlackText(
                                  text: 'Çorum/Merkez',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // rating
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: Row(
                          children: <Widget>[
                            AppIcons.star.toSvgImg(
                              Colors.yellow,
                              BaseUtility.iconMediumSize,
                              BaseUtility.iconMediumSize,
                            ),
                            Expanded(
                              child: Padding(
                                padding: BaseUtility.left(
                                  BaseUtility.paddingMediumValue,
                                ),
                                child: const BodyMediumBlackBoldText(
                                  text: '4.7 (312)',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
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
