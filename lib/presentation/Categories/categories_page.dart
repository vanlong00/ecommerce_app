import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Card List
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/flutter-mark-square-64.png',
                    width: 100,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Item 1',
                          style: TxtStyle.heading4,
                        ),
                        Text(
                          r'$2.99',
                          style: TxtStyle.heading5Light,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle),
                      ),
                      const Text(
                        '1',
                        style: TxtStyle.heading4,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'TOTAL',
                            style: TxtStyle.heading4,
                          ),
                          Text(
                            '\$5.98',
                            style: TxtStyle.heading4,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text(
                      'BUY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
