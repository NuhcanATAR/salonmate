import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.explanation,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;
  final String title;
  final String subTitle;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.vertical(
        BaseUtility.paddingNormalValue,
      ),
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(BaseUtility.radiusCircularNormalValue),
            ),
            image: DecorationImage(
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/caffely-90d9a.appspot.com/o/SalonMakeApp%2Fbanners%2Fbanner.png?alt=media&token=b7a3bcdf-5f46-45ad-887c-45bf93da4ed0',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: BaseUtility.all(
              BaseUtility.paddingNormalValue,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(BaseUtility.radiusCircularNormalValue),
              ),
            ),
            child: Column(
              children: <Widget>[
                // title
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.vertical(
                      BaseUtility.paddingSmallValue,
                    ),
                    child: TitleMediumWhiteBoldText(
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
                    child: TitleLargeWhiteBoldText(
                      text: subTitle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // explanation
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.bottom(
                      BaseUtility.paddingNormalValue,
                    ),
                    child: BodyMediumWhiteText(
                      text: explanation,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // book now
                Row(
                  children: <Widget>[
                    // button
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: BaseUtility.all(
                          BaseUtility.paddingMediumValue,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              BaseUtility.radiusCircularLowValue,
                            ),
                          ),
                        ),
                        child: BodyMediumBlackText(
                          text:
                              AppLocalizations.of(context)!.home_banner_button,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
