import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/model/account_model/account_model.dart';

class UserProvider with ChangeNotifier {
  AccountModel? _user;

  AccountModel? get user => _user;

  Future<void> fetchUserData(String token) async {
    try {
      final response = await http.get(
        EndPoints.uriParse(EndPoints.accountsEndPoint),
        headers: ApiService.headersToken(token),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        _user = AccountModel.fromJson(data);
        notifyListeners();
      } else {
        throw Exception("!");
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
    }
  }
}
