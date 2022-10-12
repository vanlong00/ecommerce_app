import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/text_style.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColor,
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          )),
      child: Center(
        child: Text(
          'Add to cart',
          style: TxtStyle.mediumBoldText.apply(
            color: ColorTheme.white,
          ),
        ),
      ),
    );
  }
}