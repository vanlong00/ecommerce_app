import 'package:ecommerce_app/presentation/Categories/categories_page.dart';
import 'package:ecommerce_app/presentation/Home/home_page.dart';
import 'package:ecommerce_app/presentation/SignIn/sign_in_page.dart';
import 'package:ecommerce_app/presentation/SignUp/sign_up_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String signInRoute = '/sign-in';
  static const String signUpRoute = '/sign-up';
  static const String cartRoute = '/cart';

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());   

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
