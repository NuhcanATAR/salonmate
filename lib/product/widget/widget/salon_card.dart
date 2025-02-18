import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class SalonCardWidget extends StatelessWidget {
  const SalonCardWidget({
    super.key,
    required this.onTap,
    required this.dynamicViewExtensions,
    required this.salonModel,
    this.isFavorite = false,
    this.favoriteOnPressed,
    this.favoriteIcon,
  });

  final Function() onTap;
  final DynamicViewExtensions dynamicViewExtensions;
  final SalonModel salonModel;
  final bool isFavorite;
  final Function()? favoriteOnPressed;
  final Icon? favoriteIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.dynamicHeight(
          context,
          0.19,
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        salonModel.fileName,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
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
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: TitleMediumBlackBoldText(
                                text: salonModel.name,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            isFavorite == true
                                ? Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: favoriteOnPressed,
                                      child: favoriteIcon ?? const SizedBox(),
                                    ),
                                  )
                                : const Flexible(
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
                                child: BodyMediumBlackText(
                                  text:
                                      '${salonModel.city}/${salonModel.district}',
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
