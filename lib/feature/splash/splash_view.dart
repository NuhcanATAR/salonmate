import 'package:flutter/material.dart';
import 'package:salonmate/feature/splash/splash_viewmodel.dart';
import 'package:salonmate/product/constants/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: AppLogoConstants.logoText.toImg(
          200,
          70,
        ),
      ),
    );
  }
}
