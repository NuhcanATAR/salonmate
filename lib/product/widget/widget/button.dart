import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.text,
    required this.func,
    required this.btnStatus,
    this.appIcon,
    this.appImages,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final String text;
  final Function()? func;
  final ButtonTypes btnStatus;
  final AppIcons? appIcon;
  final AppImages? appImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.top(BaseUtility.paddingNormalValue),
      child: GestureDetector(
        onTap: func,
        child: SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          height: dynamicViewExtensions.dynamicHeight(context, 0.06),
          child: Container(
            padding: BaseUtility.horizontal(
              BaseUtility.paddingNormalValue,
            ),
            alignment: Alignment.center,
            decoration: btnStatus.buttonTypeValue ==
                    ButtonTypes.primaryColorButton.buttonTypeValue
                ? BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        BaseUtility.radiusCircularMediumValue,
                      ),
                    ),
                  )
                : btnStatus.buttonTypeValue ==
                        ButtonTypes.iconPrimaryColorButton.buttonTypeValue
                    ? BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            BaseUtility.radiusCircularMediumValue,
                          ),
                        ),
                      )
                    : btnStatus.buttonTypeValue ==
                            ButtonTypes.borderPrimaryColorButton.buttonTypeValue
                        ? BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 0.5,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                BaseUtility.radiusCircularMediumValue,
                              ),
                            ),
                          )
                        : btnStatus.buttonTypeValue ==
                                ButtonTypes.whiteColorIconButton.buttonTypeValue
                            ? const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    BaseUtility.radiusCircularMediumValue,
                                  ),
                                ),
                              )
                            : btnStatus.buttonTypeValue ==
                                    ButtonTypes
                                        .blackColorIconButton.buttonTypeValue
                                ? const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        BaseUtility.radiusCircularMediumValue,
                                      ),
                                    ),
                                  )
                                : BoxDecoration(
                                    border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      width: 0.5,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        BaseUtility.radiusCircularMediumValue,
                                      ),
                                    ),
                                  ),
            child: btnStatus.buttonTypeValue ==
                    ButtonTypes.primaryColorButton.buttonTypeValue
                ? BodyMediumWhiteText(
                    text: text,
                    textAlign: TextAlign.center,
                  )
                : btnStatus.buttonTypeValue ==
                        ButtonTypes.iconPrimaryColorButton.buttonTypeValue
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: BodyMediumWhiteText(
                              text: text,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          appIcon != null
                              ? appIcon!.toSvgImg(
                                  Colors.white,
                                  BaseUtility.iconNormalSize,
                                  BaseUtility.iconNormalSize,
                                )
                              : const SizedBox(),
                        ],
                      )
                    : btnStatus.buttonTypeValue ==
                            ButtonTypes.borderPrimaryColorButton.buttonTypeValue
                        ? BodyMediumMainColorText(
                            text: text,
                            textAlign: TextAlign.center,
                          )
                        : btnStatus.buttonTypeValue ==
                                ButtonTypes.whiteColorIconButton.buttonTypeValue
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  appImages != null
                                      ? appImages!.toPngImg(
                                          BaseUtility.iconNormalSize,
                                          BaseUtility.iconNormalSize,
                                        )
                                      : const SizedBox(),
                                  Expanded(
                                    child: BodyMediumBlackText(
                                      text: text,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            : btnStatus.buttonTypeValue ==
                                    ButtonTypes
                                        .blackColorIconButton.buttonTypeValue
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      appImages != null
                                          ? appImages!.toPngImg(
                                              BaseUtility.iconNormalSize,
                                              BaseUtility.iconNormalSize,
                                            )
                                          : const SizedBox(),
                                      Expanded(
                                        child: BodyMediumWhiteText(
                                          text: text,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )
                                : BodyMediumRedText(
                                    text: text,
                                    textAlign: TextAlign.center,
                                  ),
          ),
        ),
      ),
    );
  }
}
