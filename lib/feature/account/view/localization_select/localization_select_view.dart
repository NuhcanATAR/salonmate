import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/localization_select/localization_select_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/constants/image.dart';
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
        title: const BodyMediumBlackText(
          text: 'Dil Seçimi',
          textAlign: TextAlign.left,
        ),
      ),
      body: buildBodyWidget,
    );
  }

  // body
  Widget get buildBodyWidget => Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: ListView(
          children: <Widget>[
            // turkish
            LanguageCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              languageText: 'Turkey',
              groupValue: '',
              value: '',
              onChanged: (val) {},
              appImage: AppImages.turkey,
            ),
            // english
            LanguageCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              languageText: 'English',
              groupValue: '',
              value: '',
              onChanged: (val) {},
              appImage: AppImages.english,
            ),
            // german
            LanguageCardWidget(
              dynamicViewExtensions: dynamicViewExtensions,
              languageText: 'Germany',
              groupValue: '',
              value: '',
              onChanged: (val) {},
              appImage: AppImages.germany,
            ),
          ],
        ),
      );
}
