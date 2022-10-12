import 'package:ecommerce_app/config/app_color.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cart/cart_bloc.dart';
import '../../data/models/cart.dart';
import 'components/check_out_card.dart';
import 'components/items_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        Cart cart = state.cartShopping;
        return Scaffold(
          appBar: _buildAppBar(cart.quantity),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: ItemsCart(cartItems: cart),
            ),
          ),
          bottomNavigationBar: CheckOutCard(cartItems: cart),
        );
      },
    );
  }

  AppBar _buildAppBar(int quantityCart) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            'Your Cart',
            style: TxtStyle.heading3,
          ),
          Text(
            '${quantityCart.toString()} items',
            style: TxtStyle.mediumText.apply(color: ColorTheme.grey),
          )
        ],
      ),
    );
  }
}
