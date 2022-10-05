import 'package:ecommerce_app/config/app_color.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:ecommerce_app/data/models/cart.dart';
import 'package:flutter/material.dart';

import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: const CheckOutCard(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Column(
        children: [
          const Text(
            'Your Cart',
            style: TxtStyle.heading3,
          ),
          Text(
            '${demoCart.products.length} items',
            style: TxtStyle.mediumText.apply(color: ColorTheme.grey),
          )
        ],
      ),
    );
  }
}