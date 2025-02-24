import 'package:flutter/material.dart';
import 'package:salonmate/product/model/salon_services_model/salon_services_model.dart';
import 'package:salonmate/product/model/stylist_add_service_model/stylist_add_service_model.dart';
import 'package:salonmate/product/model/stylist_model/stylist_model.dart';

class AppointmentsReceiptView extends StatefulWidget {
  const AppointmentsReceiptView({
    super.key,
    required this.salonId,
    required this.serviceModel,
    required this.selectStylistModel,
    required this.selectDate,
    required this.selectTime,
    required this.selectedServiceDetails,
  });

  final int salonId;
  final Service serviceModel;
  final StylistModel selectStylistModel;
  final DateTime selectDate;
  final DateTime selectTime;
  final List<StylistAddServiceModel> selectedServiceDetails;

  @override
  State<AppointmentsReceiptView> createState() =>
      _AppointmentsReceiptViewState();
}

class _AppointmentsReceiptViewState extends State<AppointmentsReceiptView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Randevu Sonu Fişi"),
      ),
    );
  }
}
