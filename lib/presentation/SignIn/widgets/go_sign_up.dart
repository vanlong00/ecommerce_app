import 'package:flutter/material.dart';

import '../../SignUp/sign_up_page.dart';

class GoSignUp extends StatelessWidget {
  const GoSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SignUpPage()),
        );
      },
      child: const Text("Sign Up"),
    );
  }
}