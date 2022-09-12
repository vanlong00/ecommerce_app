import 'package:cloud_firestore/cloud_firestore.dart';

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
        .map((docSnapshot) => Product.fromDocumentSnapShot(docSnapshot))
        .toList();
  }
}
