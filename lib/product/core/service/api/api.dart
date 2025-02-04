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

  // standard headers
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  // token headers
  static Map<String, String> headersToken(String token) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
