import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepositoryImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromSnapShot(doc)).toList());
  }
  //Load data all Products (testing)
  @override
  Future<List<Product>> getProductsByCategories() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection('products').get();
    return snapshot.docs
        .map((docSnapshot) => Product.fromDocumentSnapShot(docSnapshot))
        .toList();
  }
}
