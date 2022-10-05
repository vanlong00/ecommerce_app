import 'package:ecommerce_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconWithText(
      textHeading: 'Welcome to Lafyuu',
      textNormal: 'Sign in to continue',
    );
  }
}
