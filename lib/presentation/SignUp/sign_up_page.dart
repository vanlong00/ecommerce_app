import 'package:flutter/material.dart';

import '../SignIn/sign_in_page.dart';
import '../../config/theme.dart';
import 'widgets/button_sign_up.dart';
import 'widgets/form_sign_up.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sign Up', style: TxtStyle.heading1),
                const SizedBox(height: 18),
                FormSignUp(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController),
                const Text('Already have an account?'),
                const ButtonSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




