import 'package:ecommerce_app/config/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/Home/home_page.dart';
import 'presentation/SignIn/sign_in_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
          ),
          onGenerateRoute: _appRouter.onGenerateRoute,
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              }
              return const SignInPage();
            },
          ),
        ),
      ),
    );
  }
}
