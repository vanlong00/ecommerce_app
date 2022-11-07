import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/models/category.dart';
import 'package:ecommerce_app/data/models/promotion.dart';
import 'package:ecommerce_app/data/models/variant.dart';

import '../models/product.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepositoryImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  //Load data all Products
  @override
  Future<List<Product>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection('products').get();
    return snapshot.docs
        .map((docSnapshot) => Product.fromFireStore(docSnapshot))
        .toList();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    final snapshot = await _firebaseFirestore.collection('categories').get();
    return snapshot.docs
        .map((docSnapshot) => Category.fromFireStore(docSnapshot))
        .toList();
  }

  @override
  Future<List<Variant>> getVariantsByProduct(String uidProduct) async {
    DocumentReference docRef =
        _firebaseFirestore.collection('products').doc(uidProduct);
    final snapshot = await _firebaseFirestore
        .collection('variants')
        .where('productRef', isEqualTo: docRef)
        .get();
    return snapshot.docs
        .map((docSnapshot) => Variant.fromFireStore(docSnapshot))
        .toList();
  }

  @override
  Future<Product> getProduct(
      DocumentReference<Map<String, dynamic>> productRef) async {
    final snapshot = await _firebaseFirestore.doc(productRef.path).get();
    return Product.fromFireStore(snapshot);
  }

  @override
  Future<List<Promotion>> getAllPromotions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection('promotions').get();
    return snapshot.docs
        .map((docSnapshot) => Promotion.fromFireStore(docSnapshot))
        .toList();
  }
}
