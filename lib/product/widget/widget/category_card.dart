import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/model/category_model/category_model.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.onTap,
    required this.categoryModel,
  });
  final Function() onTap;
  final ServiceCategory categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: BaseUtility.right(
          BaseUtility.marginNormalValue,
        ),
        padding: BaseUtility.right(
          BaseUtility.paddingNormalValue,
        ),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: categoryModel.fileName ?? '',
              imageBuilder: (context, imageProvider) {
                return SizedBox(
                  width: 30,
                  height: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return const SizedBox();
              },
              errorWidget: (context, url, error) {
                return AppIcons.solidWarning.toSvgImg(
                  Theme.of(context).colorScheme.error,
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                );
              },
            ),
            Padding(
              padding: BaseUtility.left(
                BaseUtility.paddingMediumValue,
              ),
              child: BodyMediumBlackBoldText(
                text: categoryModel.name,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
