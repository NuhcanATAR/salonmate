import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/label_medium.dart';

mixin BottomMenuMixin {
  // exit dialog
  Future<bool> exitWarningDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: BodyMediumBlackBoldText(
              text: AppLocalizations.of(context)!
                  .bottom_navigator_exit_dialog_title,
              textAlign: TextAlign.center,
            ),
            content: LabelMediumBlackText(
              text: AppLocalizations.of(context)!
                  .bottom_navigator_exit_dialog_sub_title,
              textAlign: TextAlign.center,
            ),
            actionsPadding: BaseUtility.all(
              BaseUtility.paddingNormalValue,
            ),
            actions: [
              Row(
                children: <Widget>[
                  // yes
                  Flexible(
                    fit: FlexFit.tight,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green,
                        side: const BorderSide(color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .bottom_navigator_exit_dialog_yes,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // no
                  Flexible(
                    fit: FlexFit.tight,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .bottom_navigator_exit_dialog_no,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false;
  }
}
