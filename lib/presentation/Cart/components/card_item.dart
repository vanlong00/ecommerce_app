import 'package:ecommerce_app/data/models/variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cart/cart_bloc.dart';
import '../../../config/app_color.dart';
import '../../../config/text_style.dart';
import '../../../widgets/custom_button_cart.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Variant item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 104,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: ColorTheme.netural),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 72.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                    image: NetworkImage(item.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            item.size == null
                                ? _buildTitleItem(item.title)
                                : _buildTitleItem(
                                    '${item.title} - ${item.size}'),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<CartBloc>()
                                    .add(RemoveVariant(item: item));
                              },
                              child: const Icon(
                                Icons.remove_shopping_cart_outlined,
                                color: ColorTheme.grey,
                                size: 24.0,
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildPriceItem(item.price),
                            Wrap(
                              children: [
                                CustomButtonCart(
                                  iconData: Icons.remove,
                                  onPressed: () {
                                    item.quantity > 1
                                        ? context.read<CartBloc>().add(
                                            DescreaseQuantityVariant(
                                                item: item))
                                        : null;
                                  },
                                ),
                                Container(
                                  height: 24.0,
                                  width: 40.0,
                                  decoration: const BoxDecoration(
                                    color: ColorTheme.netural,
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.quantity.toString(),
                                      style: TxtStyle.normalText
                                          .apply(color: ColorTheme.grey),
                                    ),
                                  ),
                                ),
                                CustomButtonCart(
                                  iconData: Icons.add,
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(AddVariant(item: item));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildTitleItem(String title) {
    return SizedBox(
      width: 158.0,
      child: Text(
        title,
        style: TxtStyle.heading5,
      ),
    );
  }

  Text _buildPriceItem(double price) {
    return Text(
      '\$ ${price.toString()}',
      style: TxtStyle.heading5.apply(color: ColorTheme.primaryColor),
    );
  }
}
