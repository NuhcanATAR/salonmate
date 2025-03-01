import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/sign_up/bloc/event.dart';
import 'package:salonmate/feature/sign_up/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpSendCodeEvent>(signUpSendCode);
    on<SignUpVerificationCodeEvent>(signUpVerificationCode);
    on<SignUpFuncEvent>(signUp);
  }

  // phone number send code
  Future<void> signUpSendCode(
    SignUpSendCodeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpSendCodeLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.signUpSendCodeEndPoint),
      headers: ApiService.headers,
      body: json.encode(
        ApiService.toSignUpSendCodeBody(
          event.phoneNumber,
        ),
      ),
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
      if (!event.context.mounted) return;
      emit(
        SignUpSendCodeErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.sign_up_phone_number_error,
        ),
      );
    } else if (response.statusCode == 500) {
      if (!event.context.mounted) return;
      emit(
        SignUpSendCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!
              .sign_up_verification_code_error,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        SignUpSendCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!.sign_up_error,
        ),
      );
    }
  }

  // verification code
  Future<void> signUpVerificationCode(
    SignUpVerificationCodeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpVerifyCodeLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.signUpVerificationCodeEndPoint),
      headers: ApiService.headers,
      body: json.encode(
        ApiService.toSignUpVerificationCodeBody(
          event.phoneNumber,
          event.verificationCode,
        ),
      ),
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
      if (!event.context.mounted) return;
      emit(
        SignUpVerifyCodeErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.sign_up_code_false_error,
        ),
      );
    } else if (response.statusCode == 500) {
      if (!event.context.mounted) return;
      emit(
        SignUpVerifyCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!.sign_up_code_error,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        SignUpVerifyCodeErrorState(
          errorMessage: AppLocalizations.of(event.context)!.sign_up_code_error,
        ),
      );
    }
  }

  // sign up
  Future<void> signUp(
    SignUpFuncEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoadingState());

    final response = await http.post(
      Uri.parse(EndPoints.signUpEndPoint),
      headers: ApiService.headers,
      body: json.encode(
        ApiService.toSignUpBody(
          event.email,
          event.password,
          event.fullName,
          event.phoneNumber,
          event.city,
          event.district,
          event.userName,
        ),
      ),
    );
    // final responseData = json.decode(response.body);
    // final String error =
    //     responseData['error']?.toString() ?? "Bilinmeyen bir hata oluştu";

    if (response.statusCode == 201) {
      if (!event.context.mounted) return;
      emit(
        SignUpSuccessState(
          message: AppLocalizations.of(event.context)!.sign_up_success,
        ),
      );
    } else if (response.statusCode == 400) {
      if (!event.context.mounted) return;
      emit(
        SignUpErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.sign_up_required_fields_error,
        ),
      );
    } else if (response.statusCode == 401) {
      if (!event.context.mounted) return;
      emit(
        SignUpErrorState(
          errorMessage: AppLocalizations.of(event.context)!.sign_up_email_error,
        ),
      );
    } else if (response.statusCode == 402) {
      if (!event.context.mounted) return;
      emit(
        SignUpErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.sign_up_username_error,
        ),
      );
    } else if (response.statusCode == 403) {
      if (!event.context.mounted) return;
      emit(
        SignUpErrorState(
          errorMessage:
              AppLocalizations.of(event.context)!.sign_up_phone_number_error,
        ),
      );
    } else if (response.statusCode == 500) {
      if (!event.context.mounted) return;
      emit(
        SignUpErrorState(
          errorMessage: AppLocalizations.of(event.context)!.sign_up_error,
        ),
      );
    } else {
      if (!event.context.mounted) return;
      emit(
        SignUpErrorState(
          errorMessage: AppLocalizations.of(event.context)!.sign_up_error,
        ),
      );
    }
  }
}
