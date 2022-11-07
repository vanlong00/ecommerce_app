import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/models/category.dart';
import 'package:ecommerce_app/data/models/promotion.dart';
import 'package:ecommerce_app/data/models/variant.dart';

import '../models/product.dart';

abstract class ProductRepository {
  //Load data all Products
  Future<List<Product>> getAllProducts();
  //Load data all Categories
  Future<List<Category>> getAllCategories();
  //Load data Variant by Product
  Future<List<Variant>> getVariantsByProduct(String uidProduct);
  //Load data Product in Variant
  Future<Product> getProduct(DocumentReference<Map<String, dynamic>> productRef);
  Future<List<Promotion>> getAllPromotions();
}
