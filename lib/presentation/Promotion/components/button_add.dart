import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cart/cart_bloc.dart';
import '../../../config/app_color.dart';
import '../../../config/text_style.dart';
import '../../../data/models/promotion.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Promotion item;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: const Color(0xFFFF7643),
      ),
      onPressed: () {
        context.read<CartBloc>().add(AddPromotion(promotion: item));
        Navigator.of(context).pop();
      },
      child: Text(
        'Add',
        style: TxtStyle.mediumText.apply(color: ColorTheme.white),
      ),
    );
  }
}
