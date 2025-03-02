import 'package:salonmate/product/core/base/helper/appointments_control.dart';
import 'package:salonmate/product/core/base/helper/payment_type_control.dart';

class ApiService {
  const ApiService._();

  // https
  static const String http = "http";

  // ipv4 addresses
  static const String ipv4 = "192.168.1.106";

  // port number
  static const int port = 3000;

  // api url
  static const String apiHeader = "api";

  // end point
  static const String endPoint = "$http://$ipv4:$port/$apiHeader";

  // header

  // standard headers
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  // token headers
  static Map<String, String> headersToken(String token) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

  static Map<String, String> headersLangToken(String token, String langCode) =>
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'languageCode': langCode,
      };

  static Map<String, String> headerSalonToken(String token, String salonId) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'salon-id': salonId,
      };

  static Map<String, String> headerCategoryToken(
    String token,
    String category,
  ) =>
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'categoryid': category,
      };

  static Map<String, String> headerStylistToken(
    String token,
    int salonId,
    int serviceId,
  ) =>
      {
        'Authorization': 'Bearer $token',
        'salonId': salonId.toString(),
        'servicesId': serviceId.toString(),
      };

  static Map<String, String> headerStylistAddServiceToken(
    String token,
    int stylistId,
  ) =>
      {
        'Authorization': 'Bearer $token',
        'stylistId': stylistId.toString(),
      };

  static Map<String, String> headerAppointmentDateToken(
    String token,
    int stylistId,
  ) =>
      {
        'Authorization': 'Bearer $token',
        'stylistId': stylistId.toString(),
      };

  // body

  // account update body
  static Map<String, dynamic> toAccountUpdateBody(
    String fullName,
    int phone,
    String address,
  ) {
    return {
      'full_name': fullName,
      'phone': phone,
      'address': address,
    };
  }

  // account city district update body
  static Map<String, dynamic> toAccountCityDistrictUpdateBody(
    String city,
    String district,
  ) {
    return {
      'city': city,
      'district': district,
    };
  }

  // appointment create body
  static Map<String, dynamic> toAppointmentCreateBody(
    int salonId,
    int serviceId,
    int stylistId,
    String appointmentDate,
    double servicePrice,
    double totalPrice,
    PaymentType paymentType,
    List<Map<String, Object>> addServices,
  ) {
    return {
      "salonsId": salonId,
      "servicesId": serviceId,
      "stylistId": stylistId,
      "appointmentDate": appointmentDate,
      "servicePrice": servicePrice,
      "totalPrice": totalPrice,
      "paymentType": paymentType == PaymentType.payOnline ? true : false,
      "addServices": addServices,
    };
  }

  // appointment update body
  static Map<String, dynamic> toAppointmentUpdateBody(
    int appointmentId,
    AppointmentsStatus status,
  ) {
    return {
      'appointmentId': appointmentId,
      'status': status == AppointmentsStatus.cancelledAppointment
          ? 4
          : status == AppointmentsStatus.pendginAppointmentConfirmed
              ? 1
              : 5,
    };
  }

  // evaluation create body
  static Map<String, dynamic> toEvaluationCreateBody(
    int appointmentId,
    int salonId,
    double point,
    String description,
  ) {
    return {
      'appointmentId': appointmentId,
      'salonId': salonId,
      'points': point,
      'description': description,
    };
  }

  // favorite toggle body
  static Map<String, dynamic> toFavoriteToggleBody(
    int salonId,
  ) {
    return {
      'salonId': salonId,
    };
  }

  // password send code body
  static Map<String, dynamic> toPasswordSendCodeBody(int phoneNumber) {
    return {
      "phone": phoneNumber,
    };
  }

  // password verification code body
  static Map<String, dynamic> toPasswordVerificationCodeBody(
    int phoneNumber,
    int verificationCode,
  ) {
    return {
      'phone': phoneNumber,
      'resetCode': verificationCode,
    };
  }

  // change password body
  static Map<String, dynamic> toChangePasswordBody(
    int userId,
    String newPassword,
  ) {
    return {
      'userId': userId,
      'newPassword': newPassword,
    };
  }

  // sign in body
  static Map<String, dynamic> toSignInBody(
    String userName,
    String password,
  ) {
    return {
      'username': userName,
      'password': password,
    };
  }

  // sign in player id body
  static Map<String, dynamic> toSignInPlayerIdBody(String oneSignalIdValue) {
    return {
      'playerId': oneSignalIdValue,
    };
  }

  // sign up send code body
  static Map<String, dynamic> toSignUpSendCodeBody(int phoneNumber) {
    return {
      'phone': phoneNumber,
    };
  }

  // sign up verification code body
  static Map<String, dynamic> toSignUpVerificationCodeBody(
    int phoneNumber,
    int verificationCode,
  ) {
    return {
      "phone": phoneNumber,
      "resetCode": verificationCode,
    };
  }

  // sign up body
  static Map<String, dynamic> toSignUpBody(
    String email,
    String password,
    String fullName,
    int phoneNumber,
    String city,
    String district,
    String userName,
  ) {
    return {
      "email": email,
      "password": password,
      "full_name": fullName,
      "phone": phoneNumber,
      "city": city,
      "district": district,
      "address": '',
      "username": userName,
    };
  }
}
