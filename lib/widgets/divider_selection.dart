import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/text_style.dart';

class DividerSelection extends StatelessWidget {
  const DividerSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: ColorTheme.grey,
          width: 134.0,
          height: 1.0,
        ),
        Expanded(
            child: Center(
                child: Text(
                  'OR',
                  style: TxtStyle.mediumBoldText.apply(color: ColorTheme.grey),
                ))),
        Container(
          color: ColorTheme.grey,
          width: 134.0,
          height: 1.0,
        ),
      ],
    );
  }
}