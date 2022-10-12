part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({required this.products});

  @override
  List<Object> get props => [];
}

class ProductLoadedOne extends ProductState {
  final Product product;

  ProductLoadedOne({required this.product});

  @override
  List<Object> get props => [];
}


class ProductError extends ProductState {
  final String error;

  ProductError({required this.error});
  
  @override
  List<Object> get props => [error];
}
