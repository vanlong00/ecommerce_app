import 'package:ecommerce_app/config/router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import 'widgets/start_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final user = FirebaseAuth.instance.currentUser!;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          // Navigate to the sign in screen when the user Signs Out
          // Navigator.of(context).pushAndRemoveUntil(
          //   MaterialPageRoute(builder: (context) => const SignInPage()),
          //   (route) => false,
          // );
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.signInRoute, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            // user.email!,
            'Home Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(SignOutRequested());
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CategoriesPage(),
                //   ),
                // );
                Navigator.pushNamed(context, AppRouter.cartRoute);
              },
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Bar
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: const Material(
                  elevation: 10.0,
                  shadowColor: Colors.black,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(color: Colors.white, width: 0.0)),
                  child: TextField(
                    textAlign: TextAlign.center,
                    // controller: search,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0)),
                        hintStyle: TextStyle(color: Colors.black38),
                        hintText: 'Search product'),
                  ),
                ),
              ),
            ),
            //Card
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(1, 6), // changes position of shadow
                  ),
                ],
              ),
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: ExactAssetImage('assets/images/flutter-mark-square-64.png'), fit: BoxFit.cover),
                            // color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          StartComponent(),
                          StartComponent(),
                          StartComponent(),
                          StartComponent(),
                          StartComponent(),
                        ],
                      ),
                      const Text('Evening dress', style: TxtStyle.heading3),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Dorothy Perkins',
                                  style: TxtStyle.heading5Light),
                              Text(r"15$", style: TxtStyle.heading4Light),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                // color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
