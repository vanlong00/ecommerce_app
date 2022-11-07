import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cart/cart_bloc.dart';
import '../../../config/app_color.dart';
import '../../../config/text_style.dart';
import '../../../data/models/promotion.dart';
import 'button_add.dart';
import 'button_added.dart';

class CardPromote extends StatelessWidget {
  const CardPromote({Key? key, required this.item}) : super(key: key);

  final Promotion item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: ColorTheme.netural),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    item.code,
                    style: TxtStyle.heading5,
                  ),
                  Text(
                    item.name,
                    style: TxtStyle.mediumText,
                  ),
                ],
              ),
              Expanded(child: Container()),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final cart = state.cartShopping;
                  return SizedBox(
                    child: cart.promotion == item
                        ? ButtonAdded(item: item)
                        : ButtonAdd(item: item),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}