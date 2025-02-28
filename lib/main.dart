import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/bloc/cubit.dart';
import 'package:salonmate/feature/appointments/bloc/cubit.dart';
import 'package:salonmate/feature/favorite/bloc/cubit.dart';
import 'package:salonmate/feature/home/bloc/cubit.dart';
import 'package:salonmate/feature/map/bloc/bloc.dart';
import 'package:salonmate/feature/password/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/services/bloc/cubit.dart';
import 'package:salonmate/feature/sign_in/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/splash/splash_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/initialize/initialize.dart';
import 'package:salonmate/product/provider/language_provider.dart';
import 'package:salonmate/product/provider/user_provider.dart';
import 'package:salonmate/product/theme/light_theme.dart';

void main() async {
  await AppStart.initStartApp();
  final languageProvider = LanguageProvider();
  await languageProvider.loadLanguage();
  runApp(
    ChangeNotifierProvider(
      create: (_) => languageProvider,
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
          BlocProvider<FavoriteBloc>(
            create: (BuildContext context) => FavoriteBloc(),
          ),
          BlocProvider<AppointmentsBloc>(
            create: (BuildContext context) => AppointmentsBloc(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
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
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      themeMode: ThemeMode.light,
      locale: Locale(languageProvider.selectedLanguage),
      supportedLocales: const [
        Locale('en', ''),
        Locale('tr', ''),
        Locale('de', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashView(),
    );
  }
}
