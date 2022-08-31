import 'package:ecommerce_app/config/router.dart';
import 'package:flutter/material.dart';

class GoSignUp extends StatelessWidget {
  const GoSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => const SignUpPage()),
        // );
        Navigator.pushReplacementNamed(context, AppRouter.signUpRoute);
      },
      child: const Text("Sign Up"),
    );
  }
}