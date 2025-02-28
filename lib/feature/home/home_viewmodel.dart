import 'package:provider/provider.dart';
import 'package:salonmate/feature/home/bloc/cubit.dart';
import 'package:salonmate/feature/home/bloc/event.dart';
import 'package:salonmate/feature/home/home_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/provider/user_provider.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      context.read<HomeBloc>().add(HomeLoadEvent(token, context));
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      if (!mounted) return;
      loggerPrint
          .printErrorLog(AppLocalizations.of(context)!.home_token_not_avaible);
    }
  }
}
