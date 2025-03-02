import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:salonmate/feature/sign_in/bloc/event.dart';
import 'package:salonmate/feature/sign_in/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final prefService = PrefService();
  final printLogger = CustomLoggerPrint();
  SignInBloc() : super(SignInInitialState()) {
    on<SignInFuncEvent>(signIn);
  }

  // sign in
  Future<void> signIn(
    SignInFuncEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      final response = await http.post(
        EndPoints.uriParse(EndPoints.signInEndPoint),
        headers: ApiService.headers,
        body: json.encode(
          ApiService.toSignInBody(
            event.username,
            event.password,
          ),
        ),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final String token = responseData['token'];
        await prefService.saveString(SharedKeys.token, token);
        await prefService.setBool(SharedKeys.rememberMe, true);

        final oneSignalIdValue =
            await prefService.getString(SharedKeys.oneSignalId) ?? '';
        final responseAccountUpdate = await http.put(
          EndPoints.uriParse(
            EndPoints.accountPlayerIdUpdateEndPoint,
          ),
          headers: ApiService.headersToken(token),
          body: json.encode(
            ApiService.toSignInPlayerIdBody(
              oneSignalIdValue,
            ),
          ),
        );

        if (responseAccountUpdate.statusCode == 200) {
          emit(SignInSuccessState());
          printLogger.printInfoLog(response.body);
        } else {
          if (!event.context.mounted) return;
          emit(
            SignInErrorState(
              error: AppLocalizations.of(event.context)!
                  .sign_in_notification_error,
            ),
          );
        }
      } else if (response.statusCode == 401) {
        if (!event.context.mounted) return;
        emit(
          SignInErrorState(
            error: AppLocalizations.of(event.context)!
                .sign_in_email_and_password_error,
          ),
        );
      } else if (response.statusCode == 500) {
        if (!event.context.mounted) return;
        emit(
          SignInErrorState(
            error: AppLocalizations.of(event.context)!.sign_in_error,
          ),
        );
      } else {
        if (!event.context.mounted) return;
        emit(
          SignInErrorState(
            error: AppLocalizations.of(event.context)!.sign_in_error,
          ),
        );
        printLogger.printErrorLog(response.body);
      }
    } catch (e) {
      printLogger.printErrorLog(e.toString());
    }
  }
}
