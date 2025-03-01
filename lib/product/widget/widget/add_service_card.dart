import 'package:flutter/material.dart';
import 'package:salonmate/product/core/base/helper/price_convert.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class AddServiceCardWidget extends StatelessWidget {
  const AddServiceCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.isSelected,
    required this.model,
    required this.onTap,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final bool isSelected;
  final StylistAddServiceModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseUtility.right(
        BaseUtility.marginNormalValue,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: dynamicViewExtensions.dynamicWidth(context, 0.36),
          child: Container(
            padding: BaseUtility.all(
              BaseUtility.paddingNormalValue,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  BaseUtility.radiusCircularMediumValue,
                ),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                // body
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // title
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingNormalValue,
                          ),
                          child: TitleMediumBlackBoldText(
                            text: model.name,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // price
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: BodyMediumBlackText(
                          text:
                              '${CodeNoahPriceConvert.formatPrice(model.price.toInt())}₺',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                // check
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          BaseUtility.radiusCircularHighValue,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: BaseUtility.iconMediumSize,
                    ),
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
