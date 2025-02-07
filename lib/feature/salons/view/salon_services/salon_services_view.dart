import 'package:flutter/material.dart';
import 'package:salonmate/feature/salons/view/salon_services/salon_services_viewmodel.dart';

class SalonServicesView extends StatefulWidget {
  const SalonServicesView({
    super.key,
    required this.salonId,
  });

  final int salonId;

  @override
  State<SalonServicesView> createState() => _SalonServicesViewState();
}

class _SalonServicesViewState extends SalonServicesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salon Services View"),
      ),
    );
  }
}
