import 'package:ecommerce_app/config/app_color.dart';
import 'package:ecommerce_app/config/routes.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:ecommerce_app/widgets/custom_button_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cart/cart_bloc.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: const BoxDecoration(
                  color: ColorTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 50,
                  color: ColorTheme.white,
                ),
              ),
              const Text(
                'Succcess',
                style: TxtStyle.heading2,
              ),
              const Text(
                'thank you for shopping using lafyuu',
                style: TxtStyle.normalText,
              ),
              const SizedBox(height: 16.0),
              CustomButtonForm(
                nameButton: 'Back to Home',
                onPressed: () {
                  context.read<CartBloc>().add(const ClearCart());
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home, (Route<dynamic> route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
