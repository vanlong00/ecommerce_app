import '../models/product.dart';

abstract class ProductRepository {
  Stream<List<Product>> getAllProducts();
}