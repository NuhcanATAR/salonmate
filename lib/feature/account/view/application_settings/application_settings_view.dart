import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/application_settings/application_settings_viewmodel.dart';

class ApplicationSettingsView extends StatefulWidget {
  const ApplicationSettingsView({super.key});

  @override
  State<ApplicationSettingsView> createState() =>
      _ApplicationSettingsViewState();
}

class _ApplicationSettingsViewState extends ApplicationSettingsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uygulama Ayarları"),
      ),
    );
  }
}
