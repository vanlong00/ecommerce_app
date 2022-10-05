import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/Auth/auth_bloc.dart';
import 'config/app_color.dart';
import 'config/text_style.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
          title: 'E-Commerce App',
          theme: buildThemeData(),
          onGenerateRoute: _appRouter.onGenerateRoute,
          initialRoute: 'home',
        ),
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: 'Spartan',
      primaryColor: ColorTheme.primaryColor,
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: ColorTheme.white,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        titleTextStyle: TxtStyle.heading2.apply(color: ColorTheme.black),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: ColorTheme.black),
      ),
      
    );
  }
}
