import 'package:ecommerce_app/config/router.dart';
import 'package:flutter/material.dart';

class GoSignIn extends StatelessWidget {
  const GoSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const SignInPage()),
        // );
        Navigator.pushReplacementNamed(context, AppRouter.signInRoute);
      },
      child: const Text("Sign In"),
    );
  }
}