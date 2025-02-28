import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/help_support/help_support_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class HelpSupportView extends StatefulWidget {
  const HelpSupportView({super.key});

  @override
  State<HelpSupportView> createState() => _HelpSupportViewState();
}

class _HelpSupportViewState extends HelpSupportViewModel {
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
        title: BodyMediumBlackText(
          text: AppLocalizations.of(context)!.account_help_support_appbar,
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
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final model = questions[index];

            return ExpansionTile(
              title: BodyMediumBlackBoldText(
                text: model.title,
                textAlign: TextAlign.left,
              ),
              subtitle: BodyMediumBlackText(
                text: model.category,
                textAlign: TextAlign.left,
              ),
              children: <Widget>[
                ListTile(
                  title: BodyMediumBlackText(
                    text: model.explanation,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            );
          },
        ),
      );
}
