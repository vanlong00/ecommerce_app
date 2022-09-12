part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent{
  final Product product;
  
  const LoadCart(this.product);

  @override
  List<Object> get props => [product];
}

class AddProduct extends CartEvent{
  final Product product;
  const AddProduct(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'AddProduct { Product: ${product.name} }';
}

class RemoveProduct extends CartEvent{
  final Product product;
  const RemoveProduct(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'RemoveProduct { Product: ${product.name}  }';
}