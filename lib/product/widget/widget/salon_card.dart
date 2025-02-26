import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/salon_card_viewmodel.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/model/salon_model/salon_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class SalonCardWidget extends StatefulWidget {
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
  State<SalonCardWidget> createState() => _SalonCardWidgetState();
}

class _SalonCardWidgetState extends SalonCardWidgetModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: widget.dynamicViewExtensions.maxWidth(context),
        height: widget.dynamicViewExtensions.dynamicHeight(
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
                        widget.salonModel.fileName,
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
                                text: widget.salonModel.name,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            widget.isFavorite == true
                                ? Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: widget.favoriteOnPressed,
                                      child: widget.favoriteIcon ??
                                          const SizedBox(),
                                    ),
                                  )
                                : Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: BodyMediumBlackText(
                                      text: distance != null
                                          ? '${distance!.toStringAsFixed(1)} Km'
                                          : '...',
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
                                      '${widget.salonModel.city}/${widget.salonModel.district}',
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
                                child: BodyMediumBlackBoldText(
                                  text:
                                      '${widget.salonModel.avarageScore.toString()} (${widget.salonModel.totalAppointments.toInt()})',
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
