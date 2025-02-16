import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/bloc/cubit.dart';
import 'package:salonmate/feature/home/bloc/cubit.dart';
import 'package:salonmate/feature/map/bloc/bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/services/bloc/cubit.dart';
import 'package:salonmate/feature/sign_in/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/splash/splash_view.dart';
import 'package:salonmate/product/initialize/initialize.dart';
import 'package:salonmate/product/provider/user_provider.dart';
import 'package:salonmate/product/theme/light_theme.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(
            create: (BuildContext context) => SignInBloc(),
          ),
          BlocProvider<SignUpBloc>(
            create: (BuildContext context) => SignUpBloc(),
          ),
          BlocProvider<PasswordBloc>(
            create: (BuildContext context) => PasswordBloc(),
          ),
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(),
          ),
          BlocProvider<SalonsBloc>(
            create: (BuildContext context) => SalonsBloc(),
          ),
          BlocProvider<ServicesBloc>(
            create: (BuildContext context) => ServicesBloc(),
          ),
          BlocProvider<MapLocationBloc>(
            create: (BuildContext context) => MapLocationBloc(),
          ),
          BlocProvider<AccountBloc>(
            create: (BuildContext context) => AccountBloc(),
          ),
        ],
        child: const MyApp(),
      ),
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
