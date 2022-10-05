import 'package:ecommerce_app/config/routes.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/text_style.dart';

class CardRecommend extends StatelessWidget {
  const CardRecommend({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.productDetail, arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            product.name,
            style: TxtStyle.mediumText,
          ),
          Text(
            '${product.price}\$',
            style: TxtStyle.mediumText.apply(color: ColorTheme.textFieldColor),
          ),
        ],
      ),
    );
  }
}
