import '../models/product.dart';

abstract class ProductRepository {
  //Load data all Products
  Future<List<Product>> getAllProducts();
}