import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/text_style.dart';

class CustomButtonForm extends StatelessWidget {
  const CustomButtonForm({
    Key? key, this.nameButton, this.onPressed,
  }) : super(key: key);

  final String? nameButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColor,
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
      ),
      child: Center(
        child: Text(
          nameButton!,
          style: TxtStyle.mediumBoldText.apply(
            color: ColorTheme.white,
          ),
        ),
      ),
    );
  }
}