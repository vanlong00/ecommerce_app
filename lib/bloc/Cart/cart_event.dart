part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadingCart extends CartEvent {}

class AddVariant extends CartEvent {
  final Variant item;

  const AddVariant({required this.item});

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'Add Variant';
}

class RemoveVariant extends CartEvent {
  final Variant item;

  const RemoveVariant({required this.item});

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'Remove Variant';
}

class DescreaseQuantityVariant extends CartEvent {
  final Variant item;

  const DescreaseQuantityVariant({required this.item});

  @override
  List<Object> get props => [item];

  @override
  String toString() => 'Descrease Variant';
}
