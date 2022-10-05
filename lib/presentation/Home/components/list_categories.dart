import 'package:flutter/material.dart';

import '../../../data/models/category.dart';
import '../../../widgets/card_categories.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
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
}
