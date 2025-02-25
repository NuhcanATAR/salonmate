enum AppointmentsStatus {
  pendginAppointmentConfirmed,
  confirmedAppointment,
  updatedAppointment,
  cancelledAppointment,
  rejectedAppointment,
  completedAppointment,
}

extension AppointmentsStatusExtension on AppointmentsStatus {
  int get appointmentStatus {
    switch (this) {
      case AppointmentsStatus.pendginAppointmentConfirmed:
        return 1;
      case AppointmentsStatus.confirmedAppointment:
        return 2;
      case AppointmentsStatus.updatedAppointment:
        return 3;
      case AppointmentsStatus.cancelledAppointment:
        return 4;
      case AppointmentsStatus.rejectedAppointment:
        return 5;
      case AppointmentsStatus.completedAppointment:
        return 6;
    }
  }
}

extension AppointmentsStatusStringExtension on AppointmentsStatus {
  String get appointmentStringStatus {
    switch (this) {
      case AppointmentsStatus.pendginAppointmentConfirmed:
        return 'Onayda Bekleyen Randevu';
      case AppointmentsStatus.confirmedAppointment:
        return 'Onaylanan Randevu';
      case AppointmentsStatus.updatedAppointment:
        return 'Güncellenen Randevu';
      case AppointmentsStatus.cancelledAppointment:
        return 'İptal Edilen Randevu';
      case AppointmentsStatus.rejectedAppointment:
        return 'Reddedilen Randevu';
      case AppointmentsStatus.completedAppointment:
        return 'Tamamlanan Randevu';
    }
  }
}
