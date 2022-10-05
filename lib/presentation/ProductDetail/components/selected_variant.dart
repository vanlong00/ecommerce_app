import 'package:flutter/material.dart';

import '../../../config/app_color.dart';
import '../../../config/text_style.dart';
import '../../../data/models/product.dart';
import '../../../data/models/variant.dart';
import '../../../widgets/custom_button_form.dart';

class SelectedVariant extends StatefulWidget {
  const SelectedVariant({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<SelectedVariant> createState() => _SelectedVariantState();
}

class _SelectedVariantState extends State<SelectedVariant> {
  int? value = 0;

  @override
  Widget build(BuildContext context) {
    List<Variant>? variants = widget.product.variants;
    if (variants != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Select Size',
              style: TxtStyle.heading3.apply(color: ColorTheme.black),
            ),
          ),
          Wrap(
            children: variants
                .map(
                  (e) => Builder(
                    builder: (context) {
                      int index = variants.indexOf(e, 0);
                      return ChoiceChip(
                        label: Text(e.size),
                        selected: value == index,
                        onSelected: (bool selected) {
                          setState(() {
                            value = selected ? index : null;
                          });
                        },
                      );
                    },
                  ),
                )
                .toList(),
          ),
          CustomButtonForm(
            nameButton: 'Add to Cart',
            onPressed: () {
              widget.product.selectedVariant = value!;
              // print(widget.product.props);
            },
          ),
        ],
      );
    } else {
      return CustomButtonForm(
        nameButton: 'Add to Cart',
        onPressed: () {
          // print(widget.product);
        },
      );
    }
  }
}