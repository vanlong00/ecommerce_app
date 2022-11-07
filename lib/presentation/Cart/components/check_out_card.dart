import 'package:ecommerce_app/config/routes.dart';
import 'package:flutter/material.dart';

import '../../../config/app_color.dart';
import '../../../config/text_style.dart';
import '../../../data/models/cart.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  final Cart cartItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: ColorTheme.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Row(
                children: [
                  Text(
                    cartItems.promotion?.code ?? "Add voucher code",
                    style: TxtStyle.mediumText.apply(color: ColorTheme.grey),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: ColorTheme.grey,
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.promotion);
              },
            ),
            const SizedBox(height: 20.0),
            Text(
                'Total Price Items: ${cartItems.totalPriceItems.toStringAsFixed(2)}\n'),
            Text(
                'Total Promotion: ${cartItems.totalPromotion.toStringAsFixed(2)}\n'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Total \n',
                    style: TxtStyle.largeText,
                    children: [
                      TextSpan(
                        text: '\$ ${cartItems.totalPrice.toStringAsFixed(2)}',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.white,
                        backgroundColor: const Color(0xFFFF7643),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.payment);
                      },
                      child: Text(
                        'Check out',
                        style:
                            TxtStyle.largeText.apply(color: ColorTheme.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
