part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

//Load data all Products event
class FetchProduct extends ProductEvent {}

//Load data one Product event
class GetDataProduct extends ProductEvent {
  final DocumentReference<Map<String, dynamic>> docRef;

  const GetDataProduct({required this.docRef});

  @override
  List<Object> get props => [docRef];
}
