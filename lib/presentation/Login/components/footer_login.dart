import 'package:ecommerce_app/widgets/text_to_direct.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../config/routes.dart';


class FooterLogin extends StatefulWidget {
  const FooterLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<FooterLogin> createState() => _FooterLoginState();
}

class _FooterLoginState extends State<FooterLogin> {
  final TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _recognizer.onTap = () {
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.register, (route) => false);
    };
  }

  @override
  Widget build(BuildContext context) {
    return TextToDirect(
      textNormal: 'Don\'t have a account? ',
      textDirect: 'Register',
      recognizer: _recognizer,
    );
  }
}
