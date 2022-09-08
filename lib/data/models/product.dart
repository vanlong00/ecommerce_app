import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommend;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommend,
  });

  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommend: snap['isRecommend'],
    );
    return product;
  }
  //Load data all Products (testing)
  Product.fromDocumentSnapShot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        category = doc.data()!["category"],
        imageUrl = doc.data()!["imageUrl"],
        price = doc.data()!["price"],
        isRecommend = doc.data()!["isRecommend"];

  @override
  List<Object?> get props => [];
}
