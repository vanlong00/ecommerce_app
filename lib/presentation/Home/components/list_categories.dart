import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Category/category_bloc.dart';
import '../../../widgets/card_categories.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (_, state) {
        if (state is CategoryLoading) {
          //Load data all Products
          context.read<CategoryBloc>().add(FetchCategory());
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryLoaded) {
          final listCategories = state.categories.toList();
          return SizedBox(
            height: 120.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CardCategory(category: listCategories[index]);
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
