import 'dart:async';

import 'package:ecommerce_app/data/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<Product> _cartItems = <Product>[];

  CartBloc() : super(const CartLoading(cartItem: <Product>[])) {
  
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<LoadCart>(_onLoadCart);
  }

  FutureOr<void> _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    _cartItems.add(event.product);
    emit(ProductAdded(cartItem: _cartItems));
  }

  FutureOr<void> _onRemoveProduct(
      RemoveProduct event, Emitter<CartState> emit) {
    _cartItems.remove(event.product);
    emit(ProductRemoved(cartItem: _cartItems));
  }

  FutureOr<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoaded(cartItem: _cartItems));
  }
}
