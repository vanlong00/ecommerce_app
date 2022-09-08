import '../models/product.dart';

abstract class ProductRepository {
  Stream<List<Product>> getAllProducts();
  //Load data all Products (testing)
  Future<List<Product>> getProductsByCategories();
}