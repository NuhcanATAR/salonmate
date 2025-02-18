import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/date_select/date_select_viewmodel.dart';

class DateSelectView extends StatefulWidget {
  const DateSelectView({super.key});

  @override
  State<DateSelectView> createState() => _DateSelectViewState();
}

class _DateSelectViewState extends DateSelectViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Select"),
      ),
    );
  }
}
