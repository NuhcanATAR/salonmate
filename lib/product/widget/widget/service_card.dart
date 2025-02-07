import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/view/salon_services/salon_services_view.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
    required this.dynamicViewExtensions,
  });

  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CodeNoahNavigatorRouter.push(
        context,
        const SalonServicesView(
          salonId: 1,
        ),
      ),
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Container(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                BaseUtility.radiusNormalValue,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              // information
              Expanded(
                child: Column(
                  children: <Widget>[
                    // service name
                    SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: const BodyMediumBlackBoldText(
                          text: 'Normal Saç Kesimi',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // category
                    SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const BodyMediumBlackText(
                          text: 'Saç Kesimi',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // price and duration
                    SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: Row(
                          children: <Widget>[
                            // price
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Padding(
                                padding: BaseUtility.right(
                                  BaseUtility.paddingSmallValue,
                                ),
                                child: const BodyMediumBlackText(
                                  text: '150.0₺',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            // duration
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  AppIcons.clockOutline.toSvgImg(
                                    Colors.black54,
                                    BaseUtility.iconMediumSize,
                                    BaseUtility.iconMediumSize,
                                  ),
                                  Padding(
                                    padding: BaseUtility.left(
                                      BaseUtility.paddingSmallValue,
                                    ),
                                    child: const BodyMediumBlackText(
                                      text: '30 Mins',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // service add
              GestureDetector(
                onTap: () {},
                child: AppIcons.addCircleOutline.toSvgImg(
                  Colors.black,
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
