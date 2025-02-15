import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class MapSalonCardWidget extends StatelessWidget {
  const MapSalonCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.model,
    required this.onTap,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final SalonModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.dynamicWidth(
          context,
          1.0,
        ),
        child: Container(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          margin: BaseUtility.horizontal(
            BaseUtility.marginNormalValue,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                BaseUtility.radiusCircularNormalValue,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // cover image
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  height: dynamicViewExtensions.dynamicHeight(context, 0.14),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          model.fileName,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // title
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.vertical(
                      BaseUtility.paddingNormalValue,
                    ),
                    child: TitleMediumBlackBoldText(
                      text: model.name,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // city district
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.bottom(
                      BaseUtility.paddingNormalValue,
                    ),
                    child: Row(
                      children: <Widget>[
                        AppIcons.locationOutline.toSvgImg(
                          Colors.black54,
                          BaseUtility.iconMediumSize,
                          BaseUtility.iconMediumSize,
                        ),
                        Expanded(
                          child: Padding(
                            padding: BaseUtility.left(
                              BaseUtility.paddingMediumValue,
                            ),
                            child: BodyMediumBlackText(
                              text: '${model.city}/${model.district}',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // rating
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Row(
                    children: <Widget>[
                      AppIcons.star.toSvgImg(
                        Colors.orange,
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
      ),
    );
  }
}
