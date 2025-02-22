import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';

@immutable
class AppStart {
  const AppStart._();

  static Future<void> initStartApp() async {
    await initializeDateFormatting();
    WidgetsFlutterBinding.ensureInitialized();
    final prefService = PrefService();
    final loggerPrint = CustomLoggerPrint();
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("7ef2c710-2373-4886-ac6e-6c18fb1e6257");

    await OneSignal.Notifications.requestPermission(true);

    final pushSubscription = OneSignal.User.pushSubscription;
    if (pushSubscription != null && pushSubscription.id != null) {
      final String onesignalId = pushSubscription.id!;
      await prefService.saveString(SharedKeys.oneSignalId, onesignalId);
      loggerPrint.printInfoLog('One Signal ID: $onesignalId');
    }
  }
}
