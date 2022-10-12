import 'package:ecommerce_app/config/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Auth/auth_bloc.dart';
import '../../config/app_color.dart';
import '../../config/text_style.dart';
import 'components/list_categories.dart';
import 'components/list_recommend.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 232;
    const double itemWidth = 175;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('Categories'),
              const ListCategories(),
              buildTitle('AII'),
              const ListRecommend(itemWidth: itemWidth, itemHeight: itemHeight),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTitle(String textHeading) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textHeading,
            style: TxtStyle.largeBoldText,
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            'See More',
            style: TxtStyle.largeBoldText.apply(color: ColorTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  // Getting the user from the FirebaseAuth Instance
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          // Navigate to the sign in screen when the user Signs Out
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.login, (route) => false);
        }
      },
      child: AppBar(
        title: const Text('Lafyuu', style: TxtStyle.heading2),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.cart);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.logout,size: 24.0,),
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Sign out'),
                ),
                onTap: () {
                  // Signing out the user
                  context.read<AuthBloc>().add(SignOutRequested());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
