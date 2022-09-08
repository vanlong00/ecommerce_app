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

  // static List<Product> products = const [
  //   Product(
  //     name: 'Apple Watch',
  //     category: 'Accessories',
  //     imageUrl: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80',
  //     price: 2.99,
  //     isRecommend: true,
  //   ),
  //   Product(
  //     name: 'HyperX',
  //     category: 'Accessories',
  //     imageUrl: 'https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  //     price: 2.99,
  //     isRecommend: true,
  //   ),
  //   Product(
  //     name: 'Cannon V2',
  //     category: 'Accessories',
  //     imageUrl: 'https://images.unsplash.com/photo-1564466809058-bf4114d55352?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  //     price: 2.99,
  //     isRecommend: false,
  //   ),
  //   Product(
  //     name: 'XBOX Console',
  //     category: 'Accessories',
  //     imageUrl: 'https://images.unsplash.com/photo-1600080972464-8e5f35f63d08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  //     price: 2.99,
  //     isRecommend: true,
  //   ),
  //   Product(
  //     name: 'Headphone A',
  //     category: 'Accessories',
  //     imageUrl: 'https://images.unsplash.com/photo-1545127398-14699f92334b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  //     price: 2.99,
  //     isRecommend: false,
  //   ),
  //   Product(
  //     name: 'Airpod',
  //     category: 'Accessories',
  //     imageUrl: 'https://images.unsplash.com/photo-1504274066651-8d31a536b11a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fHByb2R1Y3R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  //     price: 2.99,
  //     isRecommend: true,
  //   ),
  // ];

  @override
  List<Object?> get props => [];
}
