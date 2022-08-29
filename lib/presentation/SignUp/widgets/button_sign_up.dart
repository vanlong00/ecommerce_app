import 'package:flutter/material.dart';

import '../../SignIn/sign_in_page.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );
      },
      child: const Text("Sign In"),
    );
  }
}