import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonmate/feature/home/home_viewmodel.dart';
import 'package:salonmate/feature/map/map_view.dart';
import 'package:salonmate/feature/notification/notification_view.dart';
import 'package:salonmate/feature/salons/salons_view.dart';
import 'package:salonmate/feature/services/services_view.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_large.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/banner_card.dart';
import 'package:salonmate/product/widget/widget/category_card.dart';
import 'package:salonmate/product/widget/widget/salon_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        title: Row(
          children: <Widget>[
            AppIcons.locationFill.toSvgImg(
              Theme.of(context).colorScheme.primary,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
            Expanded(
              child: Padding(
                padding: BaseUtility.horizontal(
                  BaseUtility.paddingNormalValue,
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
                        child: const BodyMediumBlackText(
                          text: 'Welcome',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // city district
                    SizedBox(
                      width: dynamicViewExtensions.maxWidth(context),
                      child: Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: const TitleMediumBlackBoldText(
                          text: 'Çorum/Merkez',
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
        actions: [
          // notification
          Padding(
            padding: BaseUtility.right(
              BaseUtility.paddingNormalValue,
            ),
            child: IconButton(
              onPressed: () => CodeNoahNavigatorRouter.push(
                context,
                const NotificationView(),
              ),
              icon: AppIcons.notification.toSvgImg(
                null,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: ListView(
          children: <Widget>[
            // search
            buildSearchWidget,
            // banner card
            buildBannerCardWidget,
            // category
            buildServiceCategorys,
            // salons
            buildSalonsWidget,
          ],
        ),
      ),
    );
  }

  // search
  Widget get buildSearchWidget => Padding(
        padding: BaseUtility.bottom(
          BaseUtility.paddingNormalValue,
        ),
        child: CupertinoSearchTextField(
          controller: searchController,
          focusNode: searchFocusNode,
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          placeholder: 'Enter address or city name',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
          backgroundColor: Colors.grey.withOpacity(0.05),
          prefixIcon: AppIcons.search.toSvgImg(
            Colors.black54,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
          onChanged: (val) {
            searchFocusNode.unfocus();
            searchController.clear();
            CodeNoahNavigatorRouter.push(
              context,
              const SalonsView(),
            );
          },
        ),
      );

  // banner card
  Widget get buildBannerCardWidget => BannerCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        onTap: () => CodeNoahNavigatorRouter.push(
          context,
          const ServicesView(),
        ),
        title: 'Morning Special!',
        subTitle: 'Get 20% Off',
        explanation: 'on All Haircuts Between 9-10 AM.',
      );

  //  category
  Widget get buildServiceCategorys => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingMediumValue,
        ),
        child: Column(
          children: <Widget>[
            // list title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleLargeBlackBoldText(
                  text: 'Services',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // list
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              height: dynamicViewExtensions.dynamicHeight(
                context,
                0.06,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // category card
                  CategoryCard(
                    onTap: () => CodeNoahNavigatorRouter.push(
                      context,
                      const ServicesView(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // salons
  Widget get buildSalonsWidget => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingMediumValue,
        ),
        child: Column(
          children: <Widget>[
            // list title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: TitleLargeBlackBoldText(
                        text: 'Nearby Salons',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => CodeNoahNavigatorRouter.push(
                        context,
                        const MapView(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          AppIcons.mapOutline.toSvgImg(
                            Theme.of(context).colorScheme.primary,
                            BaseUtility.iconMediumSize,
                            BaseUtility.iconMediumSize,
                          ),
                          Padding(
                            padding: BaseUtility.left(
                              BaseUtility.paddingMediumValue,
                            ),
                            child: const BodyMediumMainColorBoldText(
                              text: 'View on Map',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // list
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                // salon card
                SalonCardWidget(
                  onTap: () {},
                  dynamicViewExtensions: dynamicViewExtensions,
                ),
              ],
            ),
          ],
        ),
      );
}
