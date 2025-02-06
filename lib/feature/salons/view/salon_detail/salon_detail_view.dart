import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/view/salon_detail/salon_detail_viewmodel.dart';

class SalonDetailView extends StatefulWidget {
  const SalonDetailView({super.key});

  @override
  State<SalonDetailView> createState() => _SalonDetailViewState();
}

class _SalonDetailViewState extends SalonDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salon Detail View"),
      ),
    );
  }
}
