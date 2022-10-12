import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cart/cart_bloc.dart';
import '../../../config/app_color.dart';
import '../../../config/text_style.dart';
import '../../../data/models/variant.dart';
import '../../../widgets/add_to_cart_button.dart';

class SelectedVariant extends StatefulWidget {
  const SelectedVariant({
    Key? key,
    required this.listVariants,
  }) : super(key: key);

  final List<Variant> listVariants;

  @override
  State<SelectedVariant> createState() => _SelectedVariantState();
}

class _SelectedVariantState extends State<SelectedVariant> {
  int tag = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Text(
            'Select Size',
            style: TxtStyle.heading3.apply(
              color: ColorTheme.black,
            ),
          ),
        ),
        ChipsChoice<int>.single(
          value: tag,
          wrapped: true,
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          spacing: 8.0,
          onChanged: (value) => setState(() {
            tag = value;
          }),
          choiceItems: C2Choice.listFrom<int, Variant>(
            source: widget.listVariants,
            value: (i, v) => i,
            label: (i, v) => v.size!,
          ),
          choiceStyle: _buildChoiceStyle(),
          choiceActiveStyle: _buildChoiceActivveStyle(),
        ),
        AddToCartButton(
          onPressed: () {
            Variant item = widget.listVariants.elementAt(tag);
            context.read<CartBloc>().add(AddVariant(item: item));
          },
        ),
      ],
    );
  }

  C2ChoiceStyle _buildChoiceActivveStyle() {
    return const C2ChoiceStyle(
          appearance: C2ChipType.elevated
        );
  }

  C2ChoiceStyle _buildChoiceStyle() {
    return const C2ChoiceStyle(
          color: ColorTheme.primaryColor,
          borderColor: ColorTheme.primaryColor,
          borderWidth: 1.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          appearance: C2ChipType.outlined
        );
  }
}