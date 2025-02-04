import 'package:flutter/material.dart';
import 'package:salonmate/feature/home/home_viewmodel.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

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
        backgroundColor: const Color.fromARGB(260, 247, 247, 247),
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
              onPressed: () {},
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
      ),
    );
  }
}
