import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
    required this.menuText,
    this.menuIcon,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;
  final String menuText;
  final AppIcons? menuIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: Row(
            children: <Widget>[
              menuIcon == null
                  ? const SizedBox()
                  : Padding(
                      padding: BaseUtility.right(
                        BaseUtility.paddingNormalValue,
                      ),
                      child: menuIcon!.toSvgImg(
                        Theme.of(context).colorScheme.primary,
                        BaseUtility.iconNormalSize,
                        BaseUtility.iconNormalSize,
                      ),
                    ),
              Expanded(
                child: BodyMediumBlackText(
                  text: menuText,
                  textAlign: TextAlign.left,
                ),
              ),
              AppIcons.arrowRight.toSvgImg(
                Colors.black54,
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
