import 'package:flutter/material.dart';

import '../../../data/models/cart.dart';
import 'card_item.dart';

class ItemsCart extends StatelessWidget {
  const ItemsCart({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  final Cart cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItems.items
          .map(
            (e) => Builder(
              builder: (context) {
                return CardItem(item: e);
              },
            ),
          )
          .toList(),
    );
  }
}
