import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/text_style.dart';
import 'icon_app.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    Key? key, required this.textHeading, required this.textNormal,
  }) : super(key: key);

  final String textHeading, textNormal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Logo App
        const IconApp(
          colorBackground: ColorTheme.primaryColor,
          colorIcon: ColorTheme.white,
        ),
        // Name App
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 9),
          child: Text(
            textHeading,
            style: TxtStyle.heading4,
          ),
        ),
        Text(
          textNormal,
          style: TxtStyle.normalText,
        ),
      ],
    );
  }
}