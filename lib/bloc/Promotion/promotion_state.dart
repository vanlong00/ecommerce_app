part of 'promotion_bloc.dart';

abstract class PromotionState extends Equatable {}

class PromotionLoading extends PromotionState {

  @override
  List<Object?> get props => [];
}

class PromotionLoaded extends PromotionState {
  final List<Promotion> promotions;

  PromotionLoaded({required this.promotions});

  @override
  List<Object?> get props => [];
}

class PromotionError extends PromotionState {
  final String error;

  PromotionError({required this.error});

  @override
  List<Object> get props => [error];
}