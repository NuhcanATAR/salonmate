import 'package:salonmate/feature/sign/sign_view.dart';
import 'package:salonmate/feature/splash/splash_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/navigator_router.dart';

abstract class SplashViewModel extends BaseState<SplashView> {
  @override
  void initState() {
    super.initState();
    initRoute();
  }

  void initRoute() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      if (!mounted) return;
      CodeNoahNavigatorRouter.pushAndRemoveUntil(
        context,
        const SignView(),
      );
    });
  }
}
