import 'package:ecommerce_app/bloc/Cart/cart_bloc.dart';
import 'package:ecommerce_app/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/presentation/Cart/cart_page.dart';
import 'package:ecommerce_app/presentation/Home/home_page.dart';
import 'package:ecommerce_app/presentation/ProductDetail/product_detail_page.dart';
import 'package:ecommerce_app/presentation/SignIn/sign_in_page.dart';
import 'package:ecommerce_app/presentation/SignUp/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product.dart';

class AppRouter {
  static const String homeRoute = '/home';
  static const String signInRoute = '/sign-in';
  static const String signUpRoute = '/sign-up';
  static const String cartRoute = '/cart';
  static const String productDetailRoute = '/product-detail';

  final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();
  late final ProductBloc productBloc =
      ProductBloc(productRepositoryImpl: productRepositoryImpl);
  final CartBloc cartBloc = CartBloc();


  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider.value(
            value: productRepositoryImpl,
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: productBloc,
                ),
                BlocProvider.value(
                  value: cartBloc,
                ),
              ],
              child: const HomePage(),
            ),
          ),
        );
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case productDetailRoute:
      return MaterialPageRoute(builder: (_) => ProductDetailPage());
      case cartRoute:
        return MaterialPageRoute(
          // builder: (_) => RepositoryProvider.value(
          //   value: productRepositoryImpl,
          //   child:
          builder: (context) => MultiBlocProvider(
            providers: [
              // BlocProvider.value(
              //   value: productBloc,
              // ),
              BlocProvider.value(
                value: cartBloc,
              ),
            ],
            child: const CartPage(),
          ),
        );
      // );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
