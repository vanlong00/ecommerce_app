part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final List<Product> cartItem;
  const CartState({required this.cartItem});

  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  const CartLoading({required super.cartItem});
}

class CartLoaded extends CartState {
  final List<Product> cartItem;

  const CartLoaded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];
}

class ProductAdded extends CartState {
  final List<Product> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded{ todos: $cartItem }';
}

class ProductRemoved extends CartState {
  final List<Product> cartItem;
  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}
