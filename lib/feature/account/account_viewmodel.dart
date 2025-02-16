import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/account_view.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/provider/user_provider.dart';

abstract class AccountViewModel extends BaseState<AccountView> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> signOutAccount() async {
    await prefService.setBool(
      SharedKeys.remember_me,
      false,
    );
    await prefService
        .saveString(
      SharedKeys.token,
      '',
    )
        .then((val) {
      if (!mounted) return;
      CodeNoahNavigatorRouter.pushAndRemoveUntil(
        context,
        const SignInView(),
      );
    });
  }

  Future<void> loadData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }
}
