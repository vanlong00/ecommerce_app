import 'package:flutter/material.dart';

class StartComponent extends StatelessWidget {
  const StartComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: Colors.orange,
      size: 14,
    );
  }
}