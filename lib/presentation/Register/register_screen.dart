import 'package:flutter/material.dart';

import 'components/form_register.dart';
import 'components/footer_register.dart';
import 'components/header_register.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: const <Widget>[
              Flexible(flex: 2, child: HeaderRegister()),
              Flexible(flex: 3, child: FormRegister()),
              Flexible(flex: 1, child: FooterRegister()),
            ],
          ),
        ),
      ),
    );
  }
}