import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../config/app_color.dart';
import '../../../config/text_style.dart';

class TextToDirect extends StatelessWidget {
  const TextToDirect({
    Key? key,
    this.recognizer,
    this.textNormal,
    this.textDirect,
  }) : super(key: key);

  final GestureRecognizer? recognizer;
  final String? textNormal;
  final String? textDirect;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: textNormal,
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: textDirect,
              style:
                  TxtStyle.mediumBoldText.apply(color: ColorTheme.primaryColor),
              recognizer: recognizer,
            ),
          ],
        ),
      ),
    );
  }
}
