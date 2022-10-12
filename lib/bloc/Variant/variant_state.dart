part of 'variant_bloc.dart';

abstract class VariantState extends Equatable {}

class VariantLoading extends VariantState {
  @override
  List<Object?> get props => [];
}

class VariantInit extends VariantState {
  @override
  List<Object?> get props => [];
}

class VariantExit extends VariantState {
  @override
  List<Object?> get props => [];
}

class VariantLoaded extends VariantState {
  final List<Variant> variants;

  VariantLoaded({required this.variants});

  @override
  List<Object> get props => [];
}


class VariantError extends VariantState {
  final String error;

  VariantError({required this.error});
  
  @override
  List<Object> get props => [error];
}