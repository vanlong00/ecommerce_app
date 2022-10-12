import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final bool isSelection;
  final double price;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.isSelection,
    required this.description,
    required this.price,  
  });

  factory Product.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Product(
      id: snapshot.id,
      title: data['title'],
      category: data['category'],
      imageUrl: data['imageUrl'],
      isSelection: data['isSelection'],
      description: data['description'],
      price: data['price'].toDouble(),
    );
  }

  @override
  List<Object?> get props =>
      [id,title, category, description, imageUrl, isSelection, price];
}
