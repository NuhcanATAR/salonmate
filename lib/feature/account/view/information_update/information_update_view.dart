import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/information_update/information_update_viewmodel.dart';

class InformationUpdateView extends StatefulWidget {
  const InformationUpdateView({super.key});

  @override
  State<InformationUpdateView> createState() => _InformationUpdateViewState();
}

class _InformationUpdateViewState extends InformationUpdateViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilgilerimi Güncelle"),
      ),
    );
  }
}
