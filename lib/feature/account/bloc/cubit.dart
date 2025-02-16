import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/bloc/event.dart';
import 'package:salonmate/feature/account/bloc/state.dart';
import 'package:salonmate/product/core/base/helper/logger_package.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/shared_service.dart';
import 'package:salonmate/product/provider/user_provider.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final prefService = PrefService();
  final loggerPrint = CustomLoggerPrint();

  Future<String> getAuthToken() async {
    return await prefService.getString(SharedKeys.token) ?? '';
  }

  AccountBloc() : super(AccountInitial()) {
    on<FetchAccountData>(_onFetchAccountData);
  }

  Future<void> _onFetchAccountData(
    FetchAccountData event,
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
}
