import 'package:flutter/material.dart';

class IconApp extends StatelessWidget {
  const IconApp({
    Key? key,
    required this.colorIcon,
    required this.colorBackground,
  }) : super(key: key);

  final Color colorIcon;
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Image.asset(
          'assets/images/logo_app.png',
          color: colorIcon,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}