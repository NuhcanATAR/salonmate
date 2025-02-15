import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/localization_select/localization_select_viewmodel.dart';

class LocalizationSelectView extends StatefulWidget {
  const LocalizationSelectView({super.key});

  @override
  State<LocalizationSelectView> createState() => _LocalizationSelectViewState();
}

class _LocalizationSelectViewState extends LocalizationSelectViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dil Seçimi"),
      ),
    );
  }
}
