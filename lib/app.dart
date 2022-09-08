import 'package:ecommerce_app/config/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/SignIn/sign_in_page.dart';

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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacementNamed('/home');
                });
              } 
              return const SignInPage();
            },
          ),
        ),
      ),
    );
  }
}
