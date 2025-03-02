import 'package:flutter/material.dart';
import 'package:salonmate/feature/bottom_navigator/bottom_navigator_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';

class BottomNavigatorView extends StatefulWidget {
  const BottomNavigatorView({super.key});

  @override
  State<BottomNavigatorView> createState() => _BottomNavigatorViewState();
}

class _BottomNavigatorViewState extends BottomNavigatorViewModel {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitWarningDialog(context),
      child: Scaffold(
        backgroundColor: ColorConstant.appBarColor,
        body: viewList[selectView],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: selectView,
          height: 70,
          onDestinationSelected: menuClickChange,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: AppIcons.home.toSvgImg(
                Theme.of(context).colorScheme.primary,
                BaseUtility.iconMediumSecondSize,
                BaseUtility.iconMediumSecondSize,
              ),
              icon: AppIcons.homeOutline.toSvgImg(
                Theme.of(context).colorScheme.outline,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: AppIcons.mark.toSvgImg(
                Theme.of(context).colorScheme.primary,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
              icon: AppIcons.markOutline.toSvgImg(
                Theme.of(context).colorScheme.outline,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: AppIcons.favorite.toSvgImg(
                Theme.of(context).colorScheme.primary,
                BaseUtility.iconMediumSecondSize,
                BaseUtility.iconMediumSecondSize,
              ),
              icon: AppIcons.favoriteOutline.toSvgImg(
                Theme.of(context).colorScheme.outline,
                BaseUtility.iconMediumSecondSize,
                BaseUtility.iconMediumSecondSize,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: AppIcons.account.toSvgImg(
                Theme.of(context).colorScheme.primary,
                BaseUtility.iconMediumSecondSize,
                BaseUtility.iconMediumSecondSize,
              ),
              icon: AppIcons.accountOutline.toSvgImg(
                Theme.of(context).colorScheme.outline,
                BaseUtility.iconMediumSecondSize,
                BaseUtility.iconMediumSecondSize,
              ),
              label: '',
            ),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          overlayColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
        ),
      ),
    );
  }
}
