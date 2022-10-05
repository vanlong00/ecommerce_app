import 'package:ecommerce_app/widgets/custom_button_form.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Auth/auth_bloc.dart';
import '../../../widgets/input_string_field.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputStringField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return value != null && !EmailValidator.validate(value)
                  ? 'Enter a valid email'
                  : null;
            },
            hintText: 'E-mail',
            iconData: Icons.email_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: InputStringField(
              keyboardType: TextInputType.text,
              controller: _passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return value != null && value.length < 6
                    ? "Enter min. 6 characters"
                    : null;
              },
              hintText: 'Password',
              iconData: Icons.lock_open_outlined,
              obscureText: true,
            ),
          ),
          CustomButtonForm(
            onPressed: () {
              _authenticateWithEmailAndPassword(context);
            },
            nameButton: 'Sign In',
          ),
        ],
      ),
    );
  }
}
