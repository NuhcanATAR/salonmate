import 'package:flutter/material.dart';
import 'package:salonmate/feature/bookings/bookings_viewmodel.dart';

class BookingsView extends StatefulWidget {
  const BookingsView({super.key});

  @override
  State<BookingsView> createState() => _BookingsViewState();
}

class _BookingsViewState extends BookingsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookings View"),
      ),
    );
  }
}
