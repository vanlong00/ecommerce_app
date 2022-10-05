import 'package:ecommerce_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconWithText(
      textHeading: 'Let\'s Get Started',
      textNormal: 'Create a new account',
    );
  }
}
