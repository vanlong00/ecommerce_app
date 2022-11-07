
import 'package:ecommerce_app/config/routes.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:ecommerce_app/widgets/custom_button_form.dart';

import 'package:flutter/material.dart';

enum PaymentMethod { credit, paypal, bank }

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? _method;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TxtStyle.heading4,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                RadioListTile(
                  secondary: const Icon(Icons.money),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Credit Card or Debit'),
                  value: PaymentMethod.credit,
                  groupValue: _method,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _method = value;
                    });
                  },
                ),
                RadioListTile(
                  secondary: const Icon(Icons.money),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Paypal'),
                  value: PaymentMethod.paypal,
                  groupValue: _method,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _method = value;
                    });
                  },
                ),
                RadioListTile(
                  secondary: const Icon(Icons.money),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Bank Transfer'),
                  value: PaymentMethod.bank,
                  groupValue: _method,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _method = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(child: Container()),
            CustomButtonForm(
              nameButton: 'Buy',
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.success);
              },
            )
          ],
        ),
      ),
    );
  }
}
