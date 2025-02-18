import 'package:flutter/material.dart';
import 'package:salonmate/feature/appointments/appointments_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends AppointmentsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const BodyMediumBlackText(
          text: 'Randevular',
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
