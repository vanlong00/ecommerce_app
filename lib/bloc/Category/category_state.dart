part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {}

class CategoryLoading extends CategoryState {
  
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({required this.categories});

  @override
  List<Object> get props => [];
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});

  @override
  List<Object> get props => [error];
}