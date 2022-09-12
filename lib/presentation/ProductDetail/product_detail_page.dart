import 'package:flutter/material.dart';

import '../../data/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key, this.product}) : super(key: key);

  Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name),
      ),
      body: Container(),
    );
  }
}