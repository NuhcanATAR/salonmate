import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/appointment_detail/appointment_detail_viewmodel.dart';
import 'package:salonmate/product/model/appointment_model/appointment_model.dart';

class AppointmentDetailView extends StatefulWidget {
  const AppointmentDetailView({
    super.key,
    required this.appointmentModel,
  });

  final Appointment appointmentModel;

  @override
  State<AppointmentDetailView> createState() => _AppointmentDetailViewState();
}

class _AppointmentDetailViewState extends AppointmentDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointment Detail View"),
      ),
    );
  }
}
