import 'dart:async';

import 'package:ecommerce_app/data/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/product_repository_impl.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductRepositoryImpl _productRepositoryImpl;

  CategoryBloc({required ProductRepositoryImpl productRepositoryImpl})
      : _productRepositoryImpl = productRepositoryImpl,
        super(CategoryLoading()) {
    on<FetchCategory>(_fetchCategoryData);
  }

  FutureOr<void> _fetchCategoryData(
      FetchCategory event, Emitter<CategoryState> emit) async {
    final listCategory = await _productRepositoryImpl.getAllCategories();
    emit(CategoryLoaded(categories: listCategory));
  }
}
