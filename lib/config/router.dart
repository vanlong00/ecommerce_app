import 'package:ecommerce_app/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/presentation/Categories/categories_page.dart';
import 'package:ecommerce_app/presentation/Home/home_page.dart';
import 'package:ecommerce_app/presentation/SignIn/sign_in_page.dart';
import 'package:ecommerce_app/presentation/SignUp/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String homeRoute = '/home';
  static const String signInRoute = '/sign-in';
  static const String signUpRoute = '/sign-up';
  static const String cartRoute = '/cart';

  Route onGenerateRoute(RouteSettings routeSettings) {
    final ProductRepositoryImpl _productRepositoryImpl = ProductRepositoryImpl();
    final ProductBloc _productBloc = ProductBloc(productRepositoryImpl: _productRepositoryImpl);

    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider.value(
            value: _productRepositoryImpl,
            child: BlocProvider.value(
              value: _productBloc,
              child: const HomePage(),
            ),
          ),
        );
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case cartRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _productBloc,
            child: const CategoriesPage(),
          ),
        );

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
