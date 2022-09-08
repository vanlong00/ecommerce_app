import 'dart:async';

import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryImpl _productRepositoryImpl;
  StreamSubscription? _productRepositoryImplSubscription;

  ProductBloc({required ProductRepositoryImpl productRepositoryImpl})
      : _productRepositoryImpl = productRepositoryImpl,
        super(ProductLoading()) {
    on<LoadProducts>((event, emit) {
      _productRepositoryImplSubscription?.cancel();
      _productRepositoryImplSubscription =
          _productRepositoryImpl.getAllProducts().listen(
                (products) => add(
                  UpdateProducts(products),
                ),
              );
    });

    on<UpdateProducts>(((event, emit) {
      emit(ProductLoaded(products: event.products));
    }));
  }
}
