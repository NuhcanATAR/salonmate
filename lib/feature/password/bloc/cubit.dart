import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/password/bloc/event.dart';
import 'package:salonmate/feature/password/bloc/state.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitialState()) {
    on<PasswordSendCodeEvent>(sendCode);
    on<PasswordVerificationCodeEvent>(verificationCode);
    on<PasswordChangePasswordEvent>(changePassword);
  }

  Future<void> sendCode(
    PasswordSendCodeEvent event,
    Emitter<PasswordState> emit,
  ) async {
    emit(PasswordSendCodeLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.phoneNumberSendCodeEndPoint),
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
        PasswordSendCodeSuccessState(
          phoneNumber: event.phoneNumber,
        ),
      );
    } else if (response.statusCode == 404) {
      emit(
        const PasswordSendCodeErrorState(
          errorMessage: 'Telefon Numarası Bulunamadı.',
        ),
      );
    } else if (response.statusCode == 500) {
      emit(
        const PasswordSendCodeErrorState(
          errorMessage:
              'Şifre Sıfırlama talebi esnasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    } else {
      emit(
        const PasswordSendCodeErrorState(
          errorMessage:
              'Şifre Sıfırlama talebi esnasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }

  Future<void> verificationCode(
    PasswordVerificationCodeEvent event,
    Emitter<PasswordState> emit,
  ) async {
    emit(PasswordVerificationCodeLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.verifyCodeEndPoint),
      headers: ApiService.headers,
      body: json.encode({
        'phone': event.phoneNumber,
        'resetCode': event.verificationCode,
      }),
    );
    final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";
    final int userId = responseData['userId'] ?? 0;

    if (response.statusCode == 200) {
      emit(
        PasswordVerificationCodeSuccessState(userId: userId),
      );
    } else if (response.statusCode == 400) {
      emit(
        const PasswordVerificationCodeErrorState(
          errorMessage: 'Kod Yanlış veya süresi dolmuş.',
        ),
      );
    } else if (response.statusCode == 404) {
      emit(
        const PasswordVerificationCodeErrorState(
          errorMessage: 'Telefon Numarası Bulunamadı.',
        ),
      );
    } else if (response.statusCode == 500) {
      emit(
        const PasswordVerificationCodeErrorState(
          errorMessage:
              'Kod Doğrulama sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    } else {
      emit(
        const PasswordVerificationCodeErrorState(
          errorMessage:
              'Kod Doğrulama sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }

  Future<void> changePassword(
    PasswordChangePasswordEvent event,
    Emitter<PasswordState> emit,
  ) async {
    emit(PasswordNewPasswordStateLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.resetPasswordEndPoint),
      headers: ApiService.headers,
      body: json.encode({
        'userId': event.userId,
        'newPassword': event.newPassword,
      }),
    );
    // final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";

    if (response.statusCode == 200) {
      emit(
        PasswordNewPasswordSuccessState(),
      );
    } else if (response.statusCode == 400) {
      emit(
        const PasswordNewPasswordErrorState(
          errorMessage: 'Lütfen gerekli alanları doldurunuz.',
        ),
      );
    } else if (response.statusCode == 404) {
      emit(
        const PasswordNewPasswordErrorState(
          errorMessage:
              'Kullanıcı Bulunamadı veya Şifre yanlış, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    } else if (response.statusCode == 500) {
      emit(
        const PasswordNewPasswordErrorState(
          errorMessage:
              'Şifre Güncelleme sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    } else {
      emit(
        const PasswordNewPasswordErrorState(
          errorMessage:
              'Şifre Güncelleme sırasında bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
        ),
      );
    }
  }
}
