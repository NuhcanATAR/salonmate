enum PaymentType {
  payOnline,
  payAtSalon,
}

extension PaymentTypeExtension on PaymentType {
  bool get paymanetTypeValue {
    switch (this) {
      case PaymentType.payOnline:
        return true;
      case PaymentType.payAtSalon:
        return false;
    }
  }
}
