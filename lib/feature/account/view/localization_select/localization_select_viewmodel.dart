import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/view/localization_select/localization_select_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/provider/language_provider.dart';

abstract class LocalizationSelectViewModel
    extends BaseState<LocalizationSelectView> {
  Future<void> saveLanguage(String languageCode) async {
    await Provider.of<LanguageProvider>(context, listen: false)
        .setLanguage(languageCode);

    if (!mounted) return;
    Navigator.of(context).pop();
  }
}
