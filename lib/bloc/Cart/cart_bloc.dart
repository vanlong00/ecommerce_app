import 'dart:async';

import 'package:ecommerce_app/data/models/variant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cart.dart';
import '../../data/models/variant.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Cart cart = Cart(items: []);

  CartBloc() : super(CartLoading(cartShopping: Cart(items: []))) {
    on<AddVariant>(_onAddVariant);
    on<RemoveVariant>(_onRemoveVariant);
    on<LoadingCart>(_onLoadingCart);
    on<DescreaseQuantityVariant>(_onDescreaseQuantity);
  }

  FutureOr<void> _onAddVariant(AddVariant event, Emitter<CartState> emit) {
    if (!cart.items.contains(event.item)) {
      cart.items.add(event.item);
      emit(CartAdded(cartItem: cart));
      emit(CartLoading(cartShopping: cart));
    } else {
      int index = cart.items.indexOf(event.item);
      Variant item = cart.items.elementAt(index);
      item.setQuantity = item.quantity + 1;
      emit(CartAdded(cartItem: cart));
      emit(CartLoading(cartShopping: cart));
    }
  }

  FutureOr<void> _onRemoveVariant(
      RemoveVariant event, Emitter<CartState> emit) {
    cart.items.remove(event.item);
    emit(CartRemoved(cartItem: cart));
    emit(CartLoading(cartShopping: cart));
  }

  FutureOr<void> _onLoadingCart(LoadingCart event, Emitter<CartState> emit) {
    emit(CartLoaded(cartItem: cart));
  }

  FutureOr<void> _onDescreaseQuantity(
      DescreaseQuantityVariant event, Emitter<CartState> emit) {
    
    int index = cart.items.indexOf(event.item);
    Variant item = cart.items.elementAt(index);
    item.setQuantity = item.quantity - 1;
    emit(CartAdded(cartItem: cart));
    emit(CartLoading(cartShopping: cart));
  }
}
