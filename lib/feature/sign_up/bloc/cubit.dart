import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/sign_up/bloc/event.dart';
import 'package:salonmate/feature/sign_up/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpSendCodeEvent>(signUpSendCode);
    on<SignUpVerificationCodeEvent>(signUpVerificationCode);
    on<SignUpFuncEvent>(signUp);
  }

  Future<void> signUpSendCode(
    SignUpSendCodeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpSendCodeLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.signUpSendCodeEndPoint),
      headers: ApiService.headers,
      body: json.encode({
        "phone": event.phoneNumber,
      }),
    );

    // final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";

    if (response.statusCode == 200) {
      emit(
        SignUpSendCodeSuccessState(
          phoneNumber: event.phoneNumber,
        ),
      );
    } else if (response.statusCode == 400) {
      emit(
        const SignUpSendCodeErrorState(
          errorMessage: 'Bu telefon numarası zaten kayıtlı.',
        ),
      );
    } else if (response.statusCode == 500) {
      emit(
        const SignUpSendCodeErrorState(
          errorMessage:
              'Telefon doğrulama isteği kabul edilmedi, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    } else {
      emit(
        const SignUpSendCodeErrorState(
          errorMessage: 'Bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }

  Future<void> signUpVerificationCode(
    SignUpVerificationCodeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpVerifyCodeLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.signUpVerificationCodeEndPoint),
      headers: ApiService.headers,
      body: json.encode({
        "phone": event.phoneNumber,
        "resetCode": event.verificationCode,
      }),
    );
    // final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";

    if (response.statusCode == 200) {
      emit(
        SignUpVerifyCodeSuccessState(
          phoneNumber: event.phoneNumber,
        ),
      );
    } else if (response.statusCode == 400) {
      emit(
        const SignUpVerifyCodeErrorState(
          errorMessage: 'Kod yanlış veya süresi dolmuş.',
        ),
      );
    } else if (response.statusCode == 500) {
      emit(
        const SignUpVerifyCodeErrorState(
          errorMessage:
              'Kod Doğrulama sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    } else {
      emit(
        const SignUpVerifyCodeErrorState(
          errorMessage:
              'Kod Doğrulama sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz',
        ),
      );
    }
  }

  Future<void> signUp(
    SignUpFuncEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.signUpEndPoint),
      headers: ApiService.headers,
      body: json.encode({
        "email": event.email,
        "password": event.password,
        "full_name": event.fullName,
        "phone": event.phoneNumber,
        "city": event.city,
        "district": event.district,
        "address": '',
        "username": event.userName,
      }),
    );
    // final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";

    if (response.statusCode == 201) {
      emit(
        const SignUpSuccessState(
          message: 'Hesabınız başarıyla oluşturuldu.',
        ),
      );
    } else if (response.statusCode == 400) {
      emit(
        const SignUpErrorState(
          errorMessage: 'Lütfen gerekli alanları doldurunuz!',
        ),
      );
    } else if (response.statusCode == 401) {
      emit(
        const SignUpErrorState(
          errorMessage: 'Bu e-posta adresi zaten kayıtlı.',
        ),
      );
    } else if (response.statusCode == 402) {
      emit(
        const SignUpErrorState(
          errorMessage: 'Bu kullanıcı adı kayıtlı.',
        ),
      );
    } else if (response.statusCode == 403) {
      emit(
        const SignUpErrorState(
          errorMessage: 'Bu Telefon Numarası zaten kayıtlı.',
        ),
      );
    } else if (response.statusCode == 500) {
      emit(
        const SignUpErrorState(
          errorMessage:
              'Kullanıcı Kaydedilemedi, lütfen daha sonra tekrar deneyiniz',
        ),
      );
    } else {
      emit(
        const SignUpErrorState(
          errorMessage:
              'Kullanıcı Kaydedilemedi, lütfen daha sonra tekrar deneyiniz',
        ),
      );
    }
  }
}
