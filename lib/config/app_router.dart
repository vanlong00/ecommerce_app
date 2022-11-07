import 'package:ecommerce_app/config/routes.dart';
import 'package:ecommerce_app/presentation/Payment/payment_screen.dart';
import 'package:ecommerce_app/presentation/Promotion/promotion_screen.dart';
import 'package:ecommerce_app/presentation/Success/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cart/cart_bloc.dart';
import '../bloc/Category/category_bloc.dart';
import '../bloc/Product/product_bloc.dart';
import '../bloc/Promotion/promotion_bloc.dart';
import '../bloc/Variant/variant_bloc.dart';
import '../data/models/product.dart';
import '../data/repositories/product_repository_impl.dart';
import '../presentation/Cart/cart_screen.dart';
import '../presentation/Home/home_screen.dart';
import '../presentation/Login/login_screen.dart';
import '../presentation/ProductDetail/product_detail_screen.dart';
import '../presentation/Register/register_screen.dart';
import '../presentation/Splash/splash_screen.dart';
import '../presentation/dashboard.dart';

class AppRouter {
  final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();
  late final categoryBloc =
      CategoryBloc(productRepositoryImpl: productRepositoryImpl);
  late final productBloc =
      ProductBloc(productRepositoryImpl: productRepositoryImpl);
  late final variantBloc =
      VariantBloc(productRepositoryImpl: productRepositoryImpl);
  final CartBloc cartBloc = CartBloc();
  late final PromotionBloc promotionBloc =
      PromotionBloc(productRepositoryImpl: productRepositoryImpl);

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
      case Routes.cart:
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider.value(
                  value: productRepositoryImpl,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: cartBloc,
                      ),
                      BlocProvider(
                        create: (context) => ProductBloc(
                            productRepositoryImpl: productRepositoryImpl),
                      ),
                    ],
                    child: const CartScreen(),
                  ),
                ));
      case Routes.productDetail:
        final args = routeSettings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider.value(
                  value: productRepositoryImpl,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => VariantBloc(
                            productRepositoryImpl: productRepositoryImpl),
                      ),
                      BlocProvider.value(
                        value: cartBloc,
                      ),
                    ],
                    child: ProductDetailScreen(product: args),
                  ),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider.value(
                  value: productRepositoryImpl,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: categoryBloc,
                      ),
                      BlocProvider.value(
                        value: productBloc,
                      ),
                    ],
                    child: const HomeScreen(),
                  ),
                ));
      case Routes.promotion:
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider.value(
                  value: productRepositoryImpl,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: promotionBloc,
                      ),
                      BlocProvider.value(
                        value: cartBloc,
                      ),
                    ],
                    child: const PromotionScreen(),
                  ),
                ));
      case Routes.payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case Routes.success:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: cartBloc,
                  child: const SuccessScreen(),
                ));
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
