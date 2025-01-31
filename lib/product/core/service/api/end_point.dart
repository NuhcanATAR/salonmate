import 'package:salonmake/product/core/service/api/api.dart';

class EndPoints {
  const EndPoints._();

  // sign in endpoint
  static const String signInEndPoint = "${ApiService.endPoint}/login";

  // sign up endpoint
  static const String productsEndPoint = "${ApiService.endPoint}/register";

  // phone number sen code endpoint
  static const String phoneNumberSendCodeEndPoint =
      "${ApiService.endPoint}/request-reset-password";

  // verify code endpoint
  static const String verifyCodeEndPoint =
      "${ApiService.endPoint}/verify-reset-code";

  // reset password endpoint
  static const String resetPasswordEndPoint =
      "${ApiService.endPoint}/reset-password";

  // endpoint uri parse function
  static Uri uriParse(String endPoint) {
    return Uri.parse(endPoint);
  }
}
