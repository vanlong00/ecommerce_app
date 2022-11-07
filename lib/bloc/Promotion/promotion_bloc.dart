import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/promotion.dart';
import '../../data/repositories/product_repository_impl.dart';

part 'promotion_event.dart';
part 'promotion_state.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  final ProductRepositoryImpl _productRepositoryImpl;

  PromotionBloc({required ProductRepositoryImpl productRepositoryImpl})
      : _productRepositoryImpl = productRepositoryImpl,
        super(PromotionLoading()) {
    on<FetchPromotion>(_fetchPromotionData);
  }

  FutureOr<void> _fetchPromotionData(FetchPromotion event, Emitter<PromotionState> emit) async {
    List<Promotion> listPromotion = await _productRepositoryImpl.getAllPromotions();

    emit(PromotionLoaded(promotions: listPromotion));
  }
}
