part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final Cart cartShopping;

  const CartState({required this.cartShopping});

  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  const CartLoading({required super.cartShopping});
}

class CartLoaded extends CartState {
  final Cart cartItem;

  const CartLoaded({required this.cartItem}) : super(cartShopping: cartItem);

  @override
  List<Object> get props => [cartItem];
}

class CartAdded extends CartState {
  final Cart cartItem;

  const CartAdded({required this.cartItem}) : super(cartShopping: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'Cart Added';
}

class CartRemoved extends CartState {
  final Cart cartItem;

  const CartRemoved({required this.cartItem}) : super(cartShopping: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'Cart Removed';
}


class CartUpdate extends CartState {
  final Cart cartItem;

  const CartUpdate({required this.cartItem}) : super(cartShopping: cartItem);

  @override
  List<Object> get props => [cartItem];
}