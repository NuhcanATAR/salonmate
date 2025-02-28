import 'package:salonmate/feature/bottom_navigator/bottom_navigator_view.dart';
import 'package:salonmate/feature/sign/sign_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';

abstract class SignViewModel extends BaseState<SignView> {
  @override
  void initState() {
    super.initState();
    signInControl();
  }

  Future<void> signInControl() async {
    final bool signInValue =
        await prefService.getBool(SharedKeys.rememberMe) ?? false;

    if (signInValue == true) {
      if (!mounted) return;
      CodeNoahNavigatorRouter.pushAndRemoveUntil(
        context,
        const BottomNavigatorView(),
      );
    }
  }

  void comingSoon() {
    CodeNoahDialogs(context).showFlush(
      type: SnackType.success,
      message: AppLocalizations.of(context)!.sign_coming_very_soon,
    );
  }
}
