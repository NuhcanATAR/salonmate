import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';

enum PaymentTypeControl {
  payOnline,
  payAtSalon,
}

extension PaymentTypeControlExtension on PaymentTypeControl {
  bool get paymentTypeValue {
    switch (this) {
      case PaymentTypeControl.payOnline:
        return true;
      case PaymentTypeControl.payAtSalon:
        return false;
    }
  }
}

extension PaymentTypeStringControlExtension on PaymentTypeControl {
  String paymentTypeLabel(BuildContext context) {
    switch (this) {
      case PaymentTypeControl.payOnline:
        return AppLocalizations.of(context)!.payment_online;
      case PaymentTypeControl.payAtSalon:
        return AppLocalizations.of(context)!.payment_at_salon;
    }
  }
}
