import 'package:flutter/material.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/util/util.dart';

import '../text_widget/body_medium.dart';

class AppointmnetReceiptPricesListCardWidget extends StatelessWidget {
  const AppointmnetReceiptPricesListCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.totalAddService,
    required this.serviceModel,
    required this.selectedServiceDetails,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function(List<StylistAddServiceModel> selectedServiceDetails)
      totalAddService;
  final Service serviceModel;
  final List<StylistAddServiceModel> selectedServiceDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BaseUtility.all(
        BaseUtility.paddingNormalValue,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            BaseUtility.radiusCircularMediumValue,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          // service name
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  Expanded(
                    child: BodyMediumBlackBoldText(
                      text: serviceModel.name,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text: '${serviceModel.price}₺',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // add service
          ...selectedServiceDetails.map(
            (model) => SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingMediumValue,
                ),
                child: Row(
                  children: <Widget>[
                    // title
                    Expanded(
                      child: BodyMediumBlackBoldText(
                        text: model.name,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    // text
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: BodyMediumBlackText(
                        text: '${model.price}₺',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // total
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingMediumValue,
              ),
              child: Row(
                children: <Widget>[
                  // title
                  const Expanded(
                    child: BodyMediumBlackBoldText(
                      text: 'TOTAL',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // text
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: BodyMediumBlackText(
                      text:
                          '${serviceModel.price + totalAddService(selectedServiceDetails)}₺',
                      textAlign: TextAlign.right,
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
