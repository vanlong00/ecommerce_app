import 'package:ecommerce_app/config/routes.dart';
import 'package:ecommerce_app/presentation/Cart/cart_screen.dart';
import 'package:ecommerce_app/presentation/Home/home_screen.dart';
import 'package:ecommerce_app/presentation/Login/login_screen.dart';
import 'package:ecommerce_app/presentation/ProductDetail/product_detail_screen.dart';
import 'package:ecommerce_app/presentation/Register/register_screen.dart';
import 'package:ecommerce_app/presentation/Splash/splash_screen.dart';
import 'package:ecommerce_app/presentation/dashboard.dart';
import 'package:flutter/material.dart';

import '../data/models/product.dart';

class AppRouter {
  // final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();
  // late final ProductBloc productBloc =
  //     ProductBloc(productRepositoryImpl: productRepositoryImpl);
  // final CartBloc cartBloc = CartBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.productDetail:
        final args = routeSettings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: args));
      // case Routes.home:
      // return MaterialPageRoute(
      //   builder: (_) => RepositoryProvider.value(
      //     value: productRepositoryImpl,
      //     child: MultiBlocProvider(
      //       providers: [
      //         BlocProvider.value(
      //           value: productBloc,
      //         ),
      //         BlocProvider.value(
      //           value: cartBloc,
      //         ),
      //       ],
      //       child: const HomePage(),
      //     ),
      //   ),
      // );
      // case Routes.productDetail:
      //   return MaterialPageRoute(builder: (_) => ProductDetailPage());
      // case Routes.cart:
      //   return MaterialPageRoute(
      //     builder: (context) => MultiBlocProvider(
      //       providers: [
      //         BlocProvider.value(
      //           value: cartBloc,
      //         ),
      //       ],
      //       child: const CartPage(),
      //     ),
      //   );

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
