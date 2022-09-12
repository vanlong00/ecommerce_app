part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

//Load data all Products event
class FetchProduct extends ProductEvent {}

//Load data Recommend Product
class FecthRecommendProduct extends ProductEvent {}

//Load data Product By Category event
// class FetchProductByCategory extends ProductEvent {
//   final String category;

//   const FetchProductByCategory(this.category);

//   @override
//   List<Object> get props => [category];
// }
