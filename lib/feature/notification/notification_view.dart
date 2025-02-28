import 'package:flutter/material.dart';
import 'package:salonmate/feature/notification/notification_viewmodel.dart';
import 'package:salonmate/lang/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.notification_appbar),
      ),
    );
  }
}
