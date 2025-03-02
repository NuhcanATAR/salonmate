import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class StylistCardWidget extends StatelessWidget {
  const StylistCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
    required this.model,
    this.borderColor,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;
  final StylistModel model;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.dynamicHeight(context, 0.15),
        child: Container(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          margin: BaseUtility.bottom(
            BaseUtility.paddingNormalValue,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: borderColor == null
                ? null
                : Border.all(
                    color: borderColor!,
                    width: 0.5,
                  ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                BaseUtility.radiusCircularMediumValue,
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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          model.envoirmentFileName,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // information
              Expanded(
                flex: 7,
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
                          child: TitleMediumBlackBoldText(
                            text: model.name,
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
                          child: BodyMediumBlackText(
                            text: AppLocalizations.of(context)!
                                .stylist_card_expert_category,
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
