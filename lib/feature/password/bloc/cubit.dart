import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/password/bloc/event.dart';
import 'package:salonmate/feature/password/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
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
      body: json.encode(
        ApiService.toPasswordSendCodeBody(
          event.phoneNumber,
        ),
      ),
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
      if (!event.context.mounted) return;
      emit(
        PasswordSendCodeErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.password_send_code_error,
        ),
      );
    } else if (response.statusCode == 500) {
      if (!event.context.mounted) return;
      emit(
        PasswordSendCodeErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.password_send_code_second,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        PasswordSendCodeErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.password_send_code_three,
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
      body: json.encode(
        ApiService.toPasswordVerificationCodeBody(
          event.phoneNumber,
          event.verificationCode,
        ),
      ),
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
      if (!event.context.mounted) return;
      emit(
        PasswordVerificationCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_verification_code_error,
        ),
      );
    } else if (response.statusCode == 404) {
      if (!event.context.mounted) return;
      emit(
        PasswordVerificationCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_verification_code_error_second,
        ),
      );
    } else if (response.statusCode == 500) {
      if (!event.context.mounted) return;
      emit(
        PasswordVerificationCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_verification_code_error_three,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        PasswordVerificationCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_verification_code_error_four,
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
      body: json.encode(
        ApiService.toChangePasswordBody(
          event.userId,
          event.newPassword,
        ),
      ),
    );
    // final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";

    if (response.statusCode == 200) {
      emit(
        PasswordNewPasswordSuccessState(),
      );
    } else if (response.statusCode == 400) {
      if (!event.context.mounted) return;
      emit(
        PasswordNewPasswordErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.password_new_password_error,
        ),
      );
    } else if (response.statusCode == 404) {
      if (!event.context.mounted) return;
      emit(
        PasswordNewPasswordErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_new_password_error_second,
        ),
      );
    } else if (response.statusCode == 500) {
      if (!event.context.mounted) return;
      emit(
        PasswordNewPasswordErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_new_password_error_three,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        PasswordNewPasswordErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .password_new_password_error_four,
        ),
      );
    }
  }
}
