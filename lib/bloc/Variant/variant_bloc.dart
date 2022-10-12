import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/variant.dart';
import '../../data/repositories/product_repository_impl.dart';

part 'variant_event.dart';
part 'variant_state.dart';

class VariantBloc extends Bloc<VariantEvent, VariantState> {
  final ProductRepositoryImpl _productRepositoryImpl;

  VariantBloc({required ProductRepositoryImpl productRepositoryImpl})
      : _productRepositoryImpl = productRepositoryImpl,
        super(VariantLoading()) {
    on<FetchVariant>(_fetchVariantData);
    on<ExitVariant>(_exitVariant);
  }

  FutureOr<void> _fetchVariantData(
      FetchVariant event, Emitter<VariantState> emit) async {
    final listVariant =
        await _productRepositoryImpl.getVariantsByProduct(event.idProduct);
    emit(VariantLoaded(variants: listVariant));
  }

  FutureOr<void> _exitVariant(ExitVariant event, Emitter<VariantState> emit) {
    emit(VariantExit());
  }
}
