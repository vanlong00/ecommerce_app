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
}
