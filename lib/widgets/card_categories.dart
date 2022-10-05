import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/text_style.dart';
import '../data/models/category.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: 70.0,
            height: 70.0,
            child: CircleAvatar(
              minRadius: 66.0,
              backgroundColor: ColorTheme.textFieldColor,
              backgroundImage: category.imageUrl == null
                  ? null
                  : NetworkImage(category.imageUrl!),
            ),
          ),
          Text(
            category.name,
            style: TxtStyle.mediumText.apply(color: ColorTheme.textFieldColor),
          ),
        ],
      ),
    );
  }
}
