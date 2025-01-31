import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

@immutable
class AppStart {
  const AppStart._();

  static Future<void> initStartApp() async {
    await initializeDateFormatting();
    WidgetsFlutterBinding.ensureInitialized();
  }
}
