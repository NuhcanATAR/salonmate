import 'package:salonmate/product/core/service/api/api.dart';

class EndPoints {
  const EndPoints._();

  // sign in endpoint
  static const String signInEndPoint = "${ApiService.endPoint}/login";

  // sign up phone number send code endpoint
  static const String signUpSendCodeEndPoint =
      "${ApiService.endPoint}/register-phone-send-code";

  // sign up verification code endpoint
  static const String signUpVerificationCodeEndPoint =
      "${ApiService.endPoint}/register-verify-code";

  // sign up endpoint
  static const String signUpEndPoint = "${ApiService.endPoint}/register";

  // phone number sen code endpoint
  static const String phoneNumberSendCodeEndPoint =
      "${ApiService.endPoint}/request-reset-password";

  // verify code endpoint
  static const String verifyCodeEndPoint =
      "${ApiService.endPoint}/verify-reset-code";

  // reset password endpoint
  static const String resetPasswordEndPoint =
      "${ApiService.endPoint}/reset-password";

  // service categorys endpoint
  static const String serviceCategoriesEndPoint =
      "${ApiService.endPoint}/categorys";

  // salons endpoint
  static const String salonsEndPoint = "${ApiService.endPoint}/salons";

  // endpoint uri parse function
  static Uri uriParse(String endPoint) {
    return Uri.parse(endPoint);
  }
}
