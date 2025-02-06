import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/salons_viewmodel.dart';

class SalonsView extends StatefulWidget {
  const SalonsView({super.key});

  @override
  State<SalonsView> createState() => _SalonsViewState();
}

class _SalonsViewState extends SalonsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salons View"),
      ),
    );
  }
}
