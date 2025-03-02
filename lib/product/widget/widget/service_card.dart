import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/price_convert.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.serviceModel,
    required this.serviceAddOnTap,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Service serviceModel;
  final Function() serviceAddOnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: serviceAddOnTap,
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
                        child: BodyMediumBlackBoldText(
                          text: serviceModel.name,
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
                                child: BodyMediumBlackText(
                                  text:
                                      '${CodeNoahPriceConvert.formatPrice(serviceModel.price)}₺',
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
                                    child: BodyMediumBlackText(
                                      text:
                                          '${serviceModel.duration} ${AppLocalizations.of(context)!.appointment_summary_stylist_date_mins}',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // service add
              AppIcons.addCircleOutline.toSvgImg(
                Colors.black,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
