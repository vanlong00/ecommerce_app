import 'package:ecommerce_app/config/app_color.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:flutter/material.dart';

import '../../data/models/product.dart';
import 'components/selected_variant.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            _buildName(),
            _buildPrice(),
            _buildDescription(),
            SelectedVariant(product: product)
          ],
        ),
      ),
    );
  }

  Padding _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 64.0),
      child: Text(
        product.description,
        style: TxtStyle.normalText.apply(color: ColorTheme.black),
      ),
    );
  }

  Padding _buildPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        '${product.price}\$',
        style: TxtStyle.heading3.apply(color: ColorTheme.primaryColor),
      ),
    );
  }

  Padding _buildName() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 64.0),
      child: Text(
        product.name,
        style: TxtStyle.heading3,
      ),
    );
  }

  Container _buildImage() {
    return Container(
      height: 367,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(product.imageUrl),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        product.name,
        style: TxtStyle.heading4,
      ),
      centerTitle: false,
    );
  }
}
