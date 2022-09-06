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

  static List<Product> products = const [
    Product(
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl: 'assets/images/flutter-mark-square-64.png',
      price: 2.99,
      isRecommend: true,
    ),
    Product(
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl: 'assets/images/flutter-mark-square-64.png',
      price: 2.99,
      isRecommend: true,
    ),
    Product(
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl: 'assets/images/flutter-mark-square-64.png',
      price: 2.99,
      isRecommend: false,
    ),
    Product(
      name: 'Food #1',
      category: 'Food',
      imageUrl: 'assets/images/flutter-mark-square-64.png',
      price: 2.99,
      isRecommend: true,
    ),
    Product(
      name: 'Food #2',
      category: 'Food',
      imageUrl: 'assets/images/flutter-mark-square-64.png',
      price: 2.99,
      isRecommend: false,
    ),
    Product(
      name: 'Food #3',
      category: 'Food',
      imageUrl: 'assets/images/flutter-mark-square-64.png',
      price: 2.99,
      isRecommend: true,
    ),
  ];

  @override
  List<Object?> get props => [];
}
