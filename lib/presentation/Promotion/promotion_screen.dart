import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Promotion/promotion_bloc.dart';
import '../../config/text_style.dart';
import 'components/card_promotion.dart';


class PromotionScreen extends StatelessWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Promotions',
          style: TxtStyle.heading3,
        ),
      ),
      body: BlocBuilder<PromotionBloc, PromotionState>(
        builder: (context, state) {
          if (state is PromotionLoading) {
            context.read<PromotionBloc>().add(FetchPromotion());
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PromotionLoaded) {
            final listPromotion = state.promotions.toList();
            return Column(
              children: listPromotion
                  .map((e) => Builder(
                        builder: (context) {
                          return CardPromote(item: e);
                        },
                      ))
                  .toList(),
            );
          }
          return Container();
        },
      ),
    );
  }
}





