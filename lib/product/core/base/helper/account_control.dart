enum AccountControl {
  admin,
  customer,
  employee,
  subscriber,
}

extension AccountControlExtension on AccountControl {
  String get accountType {
    switch (this) {
      case AccountControl.admin:
        return 'admin';
      case AccountControl.customer:
        return 'customer';
      case AccountControl.employee:
        return 'employee';
      case AccountControl.subscriber:
        return 'subscriber';
    }
  }
}
