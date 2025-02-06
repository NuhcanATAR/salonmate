import 'package:flutter/material.dart';
import 'package:salonmate/feature/services/services_viewmodel.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends ServicesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services View"),
      ),
    );
  }
}
