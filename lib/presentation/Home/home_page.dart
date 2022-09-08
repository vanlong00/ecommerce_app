import 'package:ecommerce_app/config/router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/product/product_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<Product> listProductRecommend = Product.products.where((product) => product.isRecommend == true).toList();

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
          Navigator.pushNamedAndRemoveUntil(
              context, AppRouter.signInRoute, (route) => false);
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
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.cartRoute);
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
                Positioned(
                  left: 30,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: const Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(nameHeader: 'RECOMMEND'),
            SizedBox(
              height: 165,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    context.read<ProductBloc>().add(LoadProducts());
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductLoaded) {
                    final List<Product> productList = state.products;
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: ProductCard(
                            product: productList[index],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                  // if (state is ProductLoaded) {
                  //   return ListView.builder(
                  //     shrinkWrap: true,
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 20.0, vertical: 5.0),
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: state.length,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 15.0),
                  //         child: ProductCard(
                  //           product: state[index],
                  //         ),
                  //       );
                  //     },
                  //   );
                  // }
                },
              ),
            ),
            const HeaderSection(nameHeader: 'PRODUCT'),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.nameHeader,
  }) : super(key: key);

  final String nameHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(
        nameHeader,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
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
                    image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover),
                    // color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              // Row(
              //   children: const [
              //     StartComponent(),
              //     StartComponent(),
              //     StartComponent(),
              //     StartComponent(),
              //     StartComponent(),
              //   ],
              // ),
              Text(product.name, style: TxtStyle.heading3),
              SizedBox(
                width: 150,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.category, style: TxtStyle.heading5Light),
                        Text(product.price.toString() + r"$",
                            style: TxtStyle.heading4Light),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
