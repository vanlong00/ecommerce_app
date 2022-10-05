import 'package:flutter/material.dart';

import '../../config/app_color.dart';
import '../../config/text_style.dart';
import 'components/list_categories.dart';
import 'components/list_recommend.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 232;
    const double itemWidth = 175;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lafyuu', style: TxtStyle.heading2),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('Categories'),
              const ListCategories(),
              buildTitle('Recommend'),
              const ListRecommend(itemWidth: itemWidth, itemHeight: itemHeight),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTitle(String textHeading) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textHeading,
            style: TxtStyle.largeBoldText,
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            'See More',
            style: TxtStyle.largeBoldText.apply(color: ColorTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}


