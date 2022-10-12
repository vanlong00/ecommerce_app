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
          GestureDetector(
            onTap: () {
              print(category);
            },
            child: SizedBox(
              width: 70.0,
              height: 70.0,
              child: CircleAvatar(
                minRadius: 66.0,
                backgroundColor: ColorTheme.netural,
                child: CircleAvatar(
                  maxRadius: 34.0,
                  backgroundColor: ColorTheme.white,
                  child: Image.asset(
                    category.imgUrl,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
              ),
            ),
          ),
          Text(
            category.title,
            style: TxtStyle.mediumText.apply(color: ColorTheme.grey),
          ),
        ],
      ),
    );
  }
}
