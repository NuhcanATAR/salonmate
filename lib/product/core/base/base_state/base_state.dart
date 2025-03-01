import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:salonmate/lang/app_localizations.dart';

import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // dynamic extensions
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  // logger
  final loggerPrint = CustomLoggerPrint();

  // shaed preference service
  final prefService = PrefService();

  @override
  void initState() {
    super.initState();
    internetConnectionChecker();
  }

  // auth token
  Future<String> getAuthToken() async {
    return await prefService.getString(SharedKeys.token) ?? '';
  }

  String getDayName(DateTime date) {
    final Map<int, String> days = {
      1: AppLocalizations.of(context)!.monday,
      2: AppLocalizations.of(context)!.tuesday,
      3: AppLocalizations.of(context)!.wednesday,
      4: AppLocalizations.of(context)!.thursday,
      5: AppLocalizations.of(context)!.friday,
      6: AppLocalizations.of(context)!.saturday,
      7: AppLocalizations.of(context)!.sunday,
    };

    return days[date.weekday] ?? 'N/A';
  }

  String getMonthName(DateTime date) {
    final Map<int, String> months = {
      1: AppLocalizations.of(context)!.january,
      2: AppLocalizations.of(context)!.february,
      3: AppLocalizations.of(context)!.march,
      4: AppLocalizations.of(context)!.april,
      5: AppLocalizations.of(context)!.may,
      6: AppLocalizations.of(context)!.june,
      7: AppLocalizations.of(context)!.july,
      8: AppLocalizations.of(context)!.august,
      9: AppLocalizations.of(context)!.september,
      10: AppLocalizations.of(context)!.october,
      11: AppLocalizations.of(context)!.november,
      12: AppLocalizations.of(context)!.december,
    };

    return months[date.month] ?? 'N/A';
  }

  void internetConnectionChecker() {
    InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          if (!mounted) return;
          CodeNoahDialogs(context).showFlush(
            type: SnackType.success,
            message: AppLocalizations.of(context)!.connection_error,
          );
          break;
        case InternetStatus.disconnected:
          if (!mounted) return;
          CodeNoahDialogs(context).showFlush(
            type: SnackType.error,
            message: AppLocalizations.of(context)!.connection_success,
          );
          break;
      }
    });
  }
}
