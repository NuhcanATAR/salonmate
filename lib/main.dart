import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_in/bloc/cubit.dart';
import 'package:salonmate/feature/splash/splash_view.dart';
import 'package:salonmate/product/initialize/initialize.dart';
import 'package:salonmate/product/theme/light_theme.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (BuildContext context) => SignInBloc(),
        ),
      ],
      child: const MyApp(),
    ),
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
