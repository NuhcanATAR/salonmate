import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/sign_in/bloc/event.dart';
import 'package:salonmate/feature/sign_in/bloc/state.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/service/api/api.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final prefService = PrefService();
  final printLogger = CustomLoggerPrint();
  SignInBloc() : super(SignInInitialState()) {
    on<SignInFuncEvent>(signIn);
  }

  Future<void> signIn(
    SignInFuncEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.106:3000/api/login'),
        headers: ApiService.headers,
        body: json.encode({
          'username': event.username,
          'password': event.password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final String token = responseData['token'];
        await prefService.saveString(SharedKeys.token, token);
        await prefService.setBool(SharedKeys.remember_me, true);

        emit(SignInSuccessState());
        printLogger.printInfoLog(response.body);
      } else if (response.statusCode == 401) {
        emit(
          const SignInErrorState(
            error: 'Geçersiz e-posta veya şifre.',
          ),
        );
      } else if (response.statusCode == 500) {
        emit(
          const SignInErrorState(
            error:
                'Giriş sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
          ),
        );
      } else {
        emit(
          const SignInErrorState(
            error:
                'Giriş sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
          ),
        );
        printLogger.printErrorLog(response.body);
      }
    } catch (e) {
      printLogger.printErrorLog(e.toString());
    }
  }
}
