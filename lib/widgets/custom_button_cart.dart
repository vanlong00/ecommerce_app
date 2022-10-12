import 'package:flutter/material.dart';

import '../config/app_color.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 32.0,
      decoration: BoxDecoration(
        border: Border.all(color: ColorTheme.netural),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(iconData),
        iconSize: 8.0,
      ),
    );
  }
}