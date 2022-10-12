import 'package:ecommerce_app/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Auth/auth_bloc.dart';
import 'components/form_login.dart';
import 'components/footer_login.dart';
import 'components/header_login.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.of(context).pushReplacementNamed(Routes.home);
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // Showing the loading indicator while the user is signing in
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UnAuthenticated) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    // Expanded(flex: 1,child: Container()),
                    Flexible(flex: 2, child: HeaderLogin()),
                    Flexible(flex: 3, child: FormLogin()),
                    Flexible(flex: 1, child: FooterLogin()),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}