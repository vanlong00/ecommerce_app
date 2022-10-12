import 'package:ecommerce_app/bloc/Cart/cart_bloc.dart';
import 'package:ecommerce_app/config/app_color.dart';
import 'package:ecommerce_app/config/routes.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:ecommerce_app/data/models/variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Variant/variant_bloc.dart';
import '../../data/models/product.dart';
import '../../widgets/add_to_cart_button.dart';
import 'components/selected_variant.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartAdded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.toString()),
              duration: const Duration(seconds: 1),
            ));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              _buildName(),
              _buildPrice(),
              _buildDescription(),
              BlocBuilder<VariantBloc, VariantState>(
                builder: (context, state) {
                  if (state is VariantLoading) {
                    context
                        .read<VariantBloc>()
                        .add(FetchVariant(idProduct: product.id));
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is VariantLoaded) {
                    final listVariants = state.variants.toList();
                    if (listVariants.first.size != null) {
                      return SelectedVariant(listVariants: listVariants);
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AddToCartButton(
                        onPressed: () {
                          Variant item = listVariants.first;
                          context.read<CartBloc>().add(AddVariant(item: item));
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        product.title,
        style: TxtStyle.heading4,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 24.0,
        ),
        onPressed: () {
          context.read<VariantBloc>().add(ExitVariant());
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false);
        },
      ),
    );
  }

  Padding _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        product.description,
        textAlign: TextAlign.justify,
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
        product.title,
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
}
