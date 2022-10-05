import 'package:flutter/material.dart';

import '../config/text_style.dart';

class InputStringField extends StatelessWidget {
  const InputStringField({
    Key? key,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.autovalidateMode,
    this.validator,
  }) : super(key: key);

  final String? hintText;
  final IconData? iconData;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        hintText: hintText,
        hintStyle: TxtStyle.normalText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        prefixIcon: Icon(
          iconData,
          size: 24.0,
        ),
      ),
      keyboardType: keyboardType,
      controller: controller,
      autovalidateMode: autovalidateMode,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
