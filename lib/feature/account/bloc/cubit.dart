import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/bloc/event.dart';
import 'package:salonmate/feature/account/bloc/state.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/core/service/api/api.dart';
import 'package:salonmate/product/core/service/api/end_point.dart';
import 'package:salonmate/product/provider/user_provider.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final prefService = PrefService();
  final loggerPrint = CustomLoggerPrint();

  Future<String> getAuthToken() async {
    return await prefService.getString(SharedKeys.token) ?? '';
  }

  AccountBloc() : super(AccountInitial()) {
    on<FetchAccountDataEvent>(_onFetchAccountData);
    on<AccountInformationEvent>(_accountInformationUpdate);
  }

  Future<void> _onFetchAccountData(
    FetchAccountDataEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());
    try {
      final token = await getAuthToken();
      if (token.isNotEmpty) {
        if (!event.context.mounted) return;

        await Provider.of<UserProvider>(event.context, listen: false)
            .fetchUserData(token);

        if (!event.context.mounted) return;

        final userProvider =
            Provider.of<UserProvider>(event.context, listen: false);
        emit(
          AccountLoaded(
            fullName: userProvider.user?.userDetail.fullName ?? '',
            phoneNumber: userProvider.user?.userDetail.phone ?? 0,
            address: userProvider.user?.userDetail.address ?? '',
          ),
        );
      } else {
        emit(AccountError(message: 'Token not available'));
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      emit(AccountError(message: e.toString()));
    }
  }

  Future<void> _accountInformationUpdate(
    AccountInformationEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountUpdateLoading());
    try {
      final response = await http.put(
        EndPoints.uriParse(EndPoints.accountInformationUpdateEndPoint),
        headers: ApiService.headersToken(event.token),
        body: json.encode({
          "full_name": event.fullName,
          "phone": event.phoneNumber,
          "address": event.address,
        }),
      );

      if (response.statusCode == 200) {
        loggerPrint.printInfoLog(response.statusCode.toString());
        loggerPrint.printInfoLog(response.body);
        emit(
          AccountUpdateSuccess(
            message: 'Kullanıcı Bilgileri Başarıyla Güncellendi.',
          ),
        );
      } else {
        loggerPrint.printErrorLog(response.statusCode.toString());
        loggerPrint.printErrorLog(response.body);
        emit(
          AccountUpdateError(
            message: 'Hata oluştu lütfen daha sonra tekrar deneyiniz.',
          ),
        );
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      emit(AccountUpdateError(message: e.toString()));
    }
  }
}
