import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/account_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';
import 'package:salonmate/product/widget/widget/menu_widget.dart';
import 'package:salonmate/product/widget/widget/profile_card_widget.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends AccountViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const BodyMediumBlackText(
          text: 'Profil',
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: ListView(
          children: <Widget>[
            // profile card
            buildProfileCardWidget,
            // account menu group
            buildAccountMenuGroupWidget,
            // application settings
            buildApplicationSettingsMenuGroupWidget,
            // account settings
            buildAccountSettingsMenuGroupWidget,
          ],
        ),
      ),
    );
  }

  // profile card
  Widget get buildProfileCardWidget => ProfileCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // account menu group
  Widget get buildAccountMenuGroupWidget => Container(
        padding: BaseUtility.all(
          BaseUtility.paddingMediumValue,
        ),
        margin: BaseUtility.vertical(
          BaseUtility.marginMediumValue,
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
            // group title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleMediumBlackBoldText(
                  text: 'Hesap Yönetimi',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // edit information
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Bilgileri Güncelle',
            ),
            // location update
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Şehir ve İlçe Bilgisi Güncelle',
            ),
          ],
        ),
      );

  // application settings
  Widget get buildApplicationSettingsMenuGroupWidget => Container(
        padding: BaseUtility.all(
          BaseUtility.paddingMediumValue,
        ),
        margin: BaseUtility.vertical(
          BaseUtility.marginMediumValue,
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
            // group title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleMediumBlackBoldText(
                  text: 'Uygulama Ayarları',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // localization
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Dil Seçimi ( Turkish - TR )',
              menuIcon: AppIcons.worldOutline,
            ),
            // application settings
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Uygulama Ayarları',
              menuIcon: AppIcons.settingOutline,
            ),
            // help
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Yardım ve Destek',
              menuIcon: AppIcons.helpOutline,
            ),
          ],
        ),
      );

  // account settings
  Widget get buildAccountSettingsMenuGroupWidget => Container(
        padding: BaseUtility.all(
          BaseUtility.paddingMediumValue,
        ),
        margin: BaseUtility.vertical(
          BaseUtility.marginMediumValue,
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
            // group title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.vertical(
                  BaseUtility.paddingNormalValue,
                ),
                child: const TitleMediumBlackBoldText(
                  text: 'Hesap Ayarları',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // localization
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Hesap Oluştur',
              menuIcon: AppIcons.addCircleOutline,
            ),
            // application settings
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () {},
              menuText: 'Çıkış Yap',
              menuIcon: AppIcons.signOutOutline,
            ),
          ],
        ),
      );
}
