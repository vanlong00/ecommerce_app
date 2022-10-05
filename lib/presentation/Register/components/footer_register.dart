import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../widgets/text_to_direct.dart';

class FooterRegister extends StatefulWidget {
  const FooterRegister({
    Key? key,
  }) : super(key: key);

  @override
  State<FooterRegister> createState() => _FootRegisterState();
}

class _FootRegisterState extends State<FooterRegister> {
  final TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _recognizer.onTap = (){
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
    };
  }

  @override
  Widget build(BuildContext context) {
    return TextToDirect(
      textNormal: 'Have a account? ',
      textDirect: 'Sign In',
      recognizer: _recognizer,
    );
  }
}