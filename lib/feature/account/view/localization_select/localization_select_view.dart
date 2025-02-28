import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/view/localization_select/localization_select_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
import 'package:salonmate/product/provider/language_provider.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/language_card.dart';

class LocalizationSelectView extends StatefulWidget {
  const LocalizationSelectView({super.key});

  @override
  State<LocalizationSelectView> createState() => _LocalizationSelectViewState();
}

class _LocalizationSelectViewState extends LocalizationSelectViewModel {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black54,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        title: BodyMediumBlackText(
          text:
              AppLocalizations.of(context)!.account_localization_select_appbar,
          textAlign: TextAlign.left,
        ),
      ),
      body: buildBodyWidget(languageProvider),
    );
  }

  // body
  Widget buildBodyWidget(LanguageProvider languageProvider) => Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: ListView(
          children: <Widget>[
            // turkish
            LanguageCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              languageText: AppLocalizations.of(context)!
                  .account_localization_select_turkish_menu,
              groupValue: languageProvider.selectedLanguage,
              value: 'tr',
              onChanged: (val) {
                setState(() {
                  languageProvider.setLanguage(val!);
                });
              },
              appImage: AppImages.turkey,
            ),
            // english
            LanguageCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              languageText: AppLocalizations.of(context)!
                  .account_localization_select_english_menu,
              groupValue: languageProvider.selectedLanguage,
              value: 'en',
              onChanged: (val) {
                setState(() {
                  languageProvider.setLanguage(val!);
                });
              },
              appImage: AppImages.english,
            ),
            // german
            LanguageCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              languageText: AppLocalizations.of(context)!
                  .account_localization_select_germany_menu,
              groupValue: languageProvider.selectedLanguage,
              value: 'de',
              onChanged: (val) {
                setState(() {
                  languageProvider.setLanguage(val!);
                });
              },
              appImage: AppImages.germany,
            ),
          ],
        ),
      );
}
