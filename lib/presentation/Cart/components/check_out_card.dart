import 'package:flutter/material.dart';

import '../../../config/app_color.dart';
import '../../../config/text_style.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

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
            Row(
              children: [
                Text(
                  "Add voucher code",
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
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text.rich(
                  TextSpan(
                    text: 'Total \n',
                    children: [
                      TextSpan(
                        text: '\$337.15',
                        style: TxtStyle.mediumText,
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
                      onPressed: (){},
                      child: Text(
                        'Check out',
                        style: TxtStyle.largeText.apply(color: ColorTheme.white),
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
