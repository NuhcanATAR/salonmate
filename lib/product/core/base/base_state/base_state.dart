import 'package:flutter/material.dart';
import 'package:salonmake/product/core/base/helper/logger_package.dart';
import 'package:salonmake/product/core/base/helper/shared_service.dart';
import 'package:salonmake/product/extension/dynamic_extension.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // dynamic extensions
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  // logger
  final loggerPrint = CustomLoggerPrint();

  // shaed preference service
  final prefService = PrefService();
}
