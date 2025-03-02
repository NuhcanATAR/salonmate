import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/account_viewmodel.dart';
import 'package:salonmate/feature/account/view/city_district_update/city_district_update_view.dart';
import 'package:salonmate/feature/account/view/help_support/help_support_view.dart';
import 'package:salonmate/feature/account/view/information_update/information_update_view.dart';
import 'package:salonmate/feature/account/view/localization_select/localization_select_view.dart';
import 'package:salonmate/feature/sign_up/view/send_code/send_code_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/provider/language_provider.dart';
import 'package:salonmate/product/provider/user_provider.dart';
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
    final userProvider = Provider.of<UserProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.account_appbar,
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
            buildProfileCardWidget(userProvider),
            // account menu group
            buildAccountMenuGroupWidget,
            // application settings
            buildApplicationSettingsMenuGroupWidget(languageProvider),
            // account settings
            buildAccountSettingsMenuGroupWidget,
          ],
        ),
      ),
    );
  }

  // profile card
  Widget buildProfileCardWidget(UserProvider userProvider) => ProfileCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        fullName: userProvider.user?.userDetail.fullName ??
            AppLocalizations.of(context)!.account_unknown,
        email: userProvider.user?.email ??
            AppLocalizations.of(context)!.account_unknown,
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
                child: TitleMediumBlackBoldText(
                  text: AppLocalizations.of(context)!.account_menu_group_title,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // edit information
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                const InformationUpdateView(),
              ),
              menuText:
                  AppLocalizations.of(context)!.account_information_update_menu,
            ),
            // location update
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                const CityDistrictUpdateView(),
              ),
              menuText: AppLocalizations.of(context)!
                  .account_city_district_update_menu,
            ),
          ],
        ),
      );

  // application settings
  Widget buildApplicationSettingsMenuGroupWidget(
    LanguageProvider languageProvider,
  ) =>
      Container(
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
                child: TitleMediumBlackBoldText(
                  text: AppLocalizations.of(context)!
                      .account_menu_group_application_setting_title,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // localization
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                const LocalizationSelectView(),
              ),
              menuText:
                  '${AppLocalizations.of(context)!.account_language_menu} ( ${languageProvider.selectedLanguage == 'tr' ? 'Türkçe - TR' : languageProvider.selectedLanguage == 'en' ? 'English - EN' : languageProvider.selectedLanguage == 'de' ? 'German - DE' : AppLocalizations.of(context)!.account_unknown} )',
              menuIcon: AppIcons.worldOutline,
            ),
            // application settings
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () => openAppSettings(),
              menuText: AppLocalizations.of(context)!
                  .account_application_setting_menu,
              menuIcon: AppIcons.settingOutline,
            ),
            // help
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                const HelpSupportView(),
              ),
              menuText: AppLocalizations.of(context)!.account_help_support_menu,
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
                child: TitleMediumBlackBoldText(
                  text: AppLocalizations.of(context)!
                      .account_setting_menu_group_title,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // localization
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                const SignUpSendCodeView(),
              ),
              menuText: AppLocalizations.of(context)!.account_create_menu,
              menuIcon: AppIcons.addCircleOutline,
            ),
            // application settings
            MenuWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              onTap: signOutAccount,
              menuText: AppLocalizations.of(context)!.account_exit_menu,
              menuIcon: AppIcons.signOutOutline,
            ),
          ],
        ),
      );
}
