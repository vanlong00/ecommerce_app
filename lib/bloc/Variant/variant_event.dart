part of 'variant_bloc.dart';

abstract class VariantEvent extends Equatable {}

//Load data all Variant event
class FetchVariant extends VariantEvent {
  final String idProduct;

  FetchVariant({required this.idProduct});

  @override
  List<Object> get props => [idProduct];
}

class ExitVariant extends VariantEvent {
  @override
  List<Object?> get props => [];
}