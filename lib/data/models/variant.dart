import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Variant with EquatableMixin {
  final String title;
  final String imgUrl;
  final double price;
  final String? size;
  final DocumentReference<Map<String, dynamic>> productRef;
  int quantity = 1;

  Variant({
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.size,
    required this.productRef,
  });

  set setQuantity(int number) {
    quantity = number;
  }

  factory Variant.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Variant(
      size: data?['size'],
      imgUrl: data!['imgUrl'],
      price: data['price'].toDouble(),
      productRef: data['productRef'],
      title: data['title']
    );
  }

  @override
  List<Object?> get props => [imgUrl, price, size, productRef,title];
}