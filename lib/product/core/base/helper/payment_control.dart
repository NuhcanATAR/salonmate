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
  String get paymentTypeLabel {
    switch (this) {
      case PaymentTypeControl.payOnline:
        return 'Online Payment';
      case PaymentTypeControl.payAtSalon:
        return 'Salon Payment';
    }
  }
}
