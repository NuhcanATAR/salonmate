import 'package:flutter/material.dart';
import 'package:salonmake/product/util/util.dart';
import 'package:salonmake/product/widget/text_widget/body_medium.dart';
import 'package:salonmake/product/widget/text_widget/label_medium.dart';

mixin BottomMenuMixin {
  // exit dialog
  Future<bool> exitWarningDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const BodyMediumBlackBoldText(
              text: 'Çıkış Yapmak İstiyormusunuz?',
              textAlign: TextAlign.center,
            ),
            content: const LabelMediumBlackText(
              text:
                  'Merak etmeyin hesabınıza tekrar otomatik giriş yapabilirsiniz?',
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
                      child: const Text('Evet'),
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
                      child: const Text('Hayır'),
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
