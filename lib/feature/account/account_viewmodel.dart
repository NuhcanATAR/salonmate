import 'package:salonmate/feature/account/account_view.dart';
import 'package:salonmate/feature/sign_in/sign_in_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';

abstract class AccountViewModel extends BaseState<AccountView> {
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
}
