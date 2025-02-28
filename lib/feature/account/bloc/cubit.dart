import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/bloc/event.dart';
import 'package:salonmate/feature/account/bloc/state.dart';
import 'package:salonmate/lang/app_localizations.dart';
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
    on<AccountCityDistrictUpdateEvent>(_accountCityDistrictUpdate);
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
            city: userProvider.user?.userDetail.city ?? '',
            district: userProvider.user?.userDetail.district ?? '',
          ),
        );
      } else {
        if (!event.context.mounted) return;
        emit(
          AccountError(
            message:
                AppLocalizations.of(event.context)!.account_token_not_avaible,
          ),
        );
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
        if (!event.context.mounted) return;
        emit(
          AccountUpdateSuccess(
            message: AppLocalizations.of(event.context)!.account_update_success,
          ),
        );
      } else {
        loggerPrint.printErrorLog(response.statusCode.toString());
        loggerPrint.printErrorLog(response.body);
        if (!event.context.mounted) return;
        emit(
          AccountUpdateError(
            message: AppLocalizations.of(event.context)!.account_update_error,
          ),
        );
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      emit(AccountUpdateError(message: e.toString()));
    }
  }

  Future<void> _accountCityDistrictUpdate(
    AccountCityDistrictUpdateEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountCityDistrictUpdateLoadingState());
    try {
      final response = await http.put(
        EndPoints.uriParse(EndPoints.accountCityDistrictUpdateEndpoint),
        headers: ApiService.headersToken(event.token),
        body: json.encode({
          "city": event.city,
          "district": event.district,
        }),
      );

      if (response.statusCode == 200) {
        loggerPrint.printInfoLog(response.statusCode.toString());
        loggerPrint.printInfoLog(response.body);
        if (!event.context.mounted) return;
        emit(
          AccountCityDistrictUpdateSuccessState(
            message: AppLocalizations.of(event.context)!.account_update_success,
          ),
        );
      } else {
        loggerPrint.printErrorLog(response.statusCode.toString());
        loggerPrint.printErrorLog(response.body);
        if (!event.context.mounted) return;
        emit(
          AccountCityDistrictUpdateErrorState(
            message: AppLocalizations.of(event.context)!.account_update_error,
          ),
        );
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      emit(AccountCityDistrictUpdateErrorState(message: e.toString()));
    }
  }
}
