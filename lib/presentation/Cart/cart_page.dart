import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cart/cart_bloc.dart';
import '../../data/models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          List<Product> cart = state.cartItem;
          double total = cart.fold(0.0, (total, current) => total + current.price);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Card List
                // ItemCart(
                //   product: cart[0],
                // ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return ItemCart(product: cart[index],cart: cart,);
                  },
                ),
                Column(
                  children: [
                    const Divider(thickness: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text(
                                'TOTAL',
                                style: TxtStyle.heading4,
                              ),
                              Text(
                                total.toString(),
                                style: TxtStyle.heading4,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Text(
                          'GO TO CHECKOUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  const ItemCart({
    Key? key,
    required this.product, required this.cart,
  }) : super(key: key);

  final Product product;
  final List<Product> cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TxtStyle.heading4,
                ),
                Text(
                  product.price.toString() + r'$',
                  style: TxtStyle.heading5Light,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: IconButton(
              onPressed: () {
                !cart.contains(product)
                    ? context.read<CartBloc>().add(AddProduct(product))
                    : context.read<CartBloc>().add(RemoveProduct(product));
              },
              icon: cart.contains(product)
                  ? const Icon(Icons.shopping_cart)
                  : const Icon(
                      Icons.shopping_cart_outlined,
                    ),
              alignment: Alignment.bottomRight,
            ),
          ),
        ],
      ),
    );
  }
}
