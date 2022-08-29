import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/Home/home_page.dart';
import 'presentation/SignIn/sign_in_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
              actionsIconTheme: IconThemeData(
                color: Colors.black,
              )
            )
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
