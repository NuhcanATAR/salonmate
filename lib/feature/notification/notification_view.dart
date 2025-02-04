import 'package:flutter/material.dart';
import 'package:salonmate/feature/notification/notification_viewmodel.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends NotificationViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification View"),
      ),
    );
  }
}
