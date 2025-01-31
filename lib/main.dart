import 'package:flutter/material.dart';
import 'package:salonmate/feature/splash/splash_view.dart';
import 'package:salonmate/product/initialize/initialize.dart';
import 'package:salonmate/product/theme/light_theme.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      themeMode: ThemeMode.light,
      home: const SplashView(),
    );
  }
}
