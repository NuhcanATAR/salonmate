import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/help_support/help_support_viewmodel.dart';

class HelpSupportView extends StatefulWidget {
  const HelpSupportView({super.key});

  @override
  State<HelpSupportView> createState() => _HelpSupportViewState();
}

class _HelpSupportViewState extends HelpSupportViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yardım ve Destek"),
      ),
    );
  }
}
