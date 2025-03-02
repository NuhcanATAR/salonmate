enum AppointmentsStatus {
  pendginAppointmentConfirmed,
  confirmedAppointment,
  updatedAppointment,
  cancelledAppointment,
  rejectedAppointment,
  completedAppointment,
  evaluationCompleted,
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
      case AppointmentsStatus.evaluationCompleted:
        return 7;
    }
  }
}
