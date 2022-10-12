import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Product/product_bloc.dart';
import '../../../widgets/card_recommend.dart';

class ListRecommend extends StatelessWidget {
  const ListRecommend({
    Key? key,
    required this.itemWidth,
    required this.itemHeight,
  }) : super(key: key);

  final double itemWidth;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          context.read<ProductBloc>().add(FetchProduct());
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductLoaded) {
          final listProducts = state.products.toList();
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemCount: listProducts.length,
              itemBuilder: (context, index) {
                return CardRecommend(product: listProducts[index]);
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
