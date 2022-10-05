import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/models/variant.dart';
import 'package:equatable/equatable.dart';

class Product with EquatableMixin {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommend;
  final String description;
  final List<Variant>? variants;
  late int? isSelected;

  set selectedVariant(int value) {
    isSelected = value;
  }

  Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommend,
    required this.description,
    this.variants,
    this.isSelected,
  });

  //Load data all Products (testing)
  Product.fromDocumentSnapShot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        category = doc.data()!["category"],
        imageUrl = doc.data()!["imageUrl"],
        price = doc.data()!["price"],
        isRecommend = doc.data()!["isRecommend"],
        description = doc.data()!["description"],
        variants = doc.data()!["variants"];

  @override
  List<Object?> get props => [name, category, variants, isSelected];
}

List<Product> listProducts = [
  Product(
    name: 'Chaz Kangaroo Hoodie',
    category: 'Hoodies',
    imageUrl:
        'http://eimages.valtim.com/acme-images/product/m/h/mh01-gray_main.jpg',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed lacus purus. Suspendisse hendrerit at ipsum quis iaculis. Duis efficitur metus nibh, et accumsan enim feugiat sed. Quisque aliquet dolor ac efficitur rhoncus. Fusce tincidunt vitae mi in ultricies. Suspendisse vestibulum, tortor vitae elementum rhoncus, enim lorem aliquet turpis, sit amet vestibulum eros orci vel lacus. Aliquam erat volutpat. Proin viverra elit a tortor dignissim, vel pulvinar lacus sollicitudin. Nunc eget quam libero. Sed bibendum vel tellus sit amet lobortis. Etiam commodo purus elit. Proin nec suscipit nunc, sit amet rhoncus tellus. Nam accumsan nec massa vel hendrerit. Nulla elementum vel turpis at malesuada. Ut eleifend ornare ipsum, ac sagittis quam auctor ut.",
    isRecommend: true,
    price: 52.00,
    variants: const [
      Variant(skuID: 'MH01-M', price: 52.00, size: 'M'),
      Variant(skuID: 'MH01-L', price: 54.00, size: 'L'),
      Variant(skuID: 'MH01-S', price: 50.00, size: 'S'),
      Variant(skuID: 'MH01-XL', price: 56.00, size: 'XL'),
    ],
  ),
  Product(
    name: 'Chaz Kangaroo Hoodie',
    category: 'Hoodies',
    imageUrl:
        'http://eimages.valtim.com/acme-images/product/m/h/mh01-gray_main.jpg',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed lacus purus. Suspendisse hendrerit at ipsum quis iaculis. Duis efficitur metus nibh, et accumsan enim feugiat sed. Quisque aliquet dolor ac efficitur rhoncus. Fusce tincidunt vitae mi in ultricies. Suspendisse vestibulum, tortor vitae elementum rhoncus, enim lorem aliquet turpis, sit amet vestibulum eros orci vel lacus. Aliquam erat volutpat. Proin viverra elit a tortor dignissim, vel pulvinar lacus sollicitudin. Nunc eget quam libero. Sed bibendum vel tellus sit amet lobortis. Etiam commodo purus elit. Proin nec suscipit nunc, sit amet rhoncus tellus. Nam accumsan nec massa vel hendrerit. Nulla elementum vel turpis at malesuada. Ut eleifend ornare ipsum, ac sagittis quam auctor ut.",
    isRecommend: true,
    price: 52.00,
  ),
  Product(
    name: 'Chaz Kangaroo Hoodie',
    category: 'Hoodies',
    imageUrl:
        'http://eimages.valtim.com/acme-images/product/m/h/mh01-gray_main.jpg',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed lacus purus. Suspendisse hendrerit at ipsum quis iaculis. Duis efficitur metus nibh, et accumsan enim feugiat sed. Quisque aliquet dolor ac efficitur rhoncus. Fusce tincidunt vitae mi in ultricies. Suspendisse vestibulum, tortor vitae elementum rhoncus, enim lorem aliquet turpis, sit amet vestibulum eros orci vel lacus. Aliquam erat volutpat. Proin viverra elit a tortor dignissim, vel pulvinar lacus sollicitudin. Nunc eget quam libero. Sed bibendum vel tellus sit amet lobortis. Etiam commodo purus elit. Proin nec suscipit nunc, sit amet rhoncus tellus. Nam accumsan nec massa vel hendrerit. Nulla elementum vel turpis at malesuada. Ut eleifend ornare ipsum, ac sagittis quam auctor ut.",
    isRecommend: true,
    price: 52.00,
  ),
  Product(
    name: 'Chaz Kangaroo Hoodie',
    category: 'Hoodies',
    imageUrl:
        'http://eimages.valtim.com/acme-images/product/m/h/mh01-gray_main.jpg',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed lacus purus. Suspendisse hendrerit at ipsum quis iaculis. Duis efficitur metus nibh, et accumsan enim feugiat sed. Quisque aliquet dolor ac efficitur rhoncus. Fusce tincidunt vitae mi in ultricies. Suspendisse vestibulum, tortor vitae elementum rhoncus, enim lorem aliquet turpis, sit amet vestibulum eros orci vel lacus. Aliquam erat volutpat. Proin viverra elit a tortor dignissim, vel pulvinar lacus sollicitudin. Nunc eget quam libero. Sed bibendum vel tellus sit amet lobortis. Etiam commodo purus elit. Proin nec suscipit nunc, sit amet rhoncus tellus. Nam accumsan nec massa vel hendrerit. Nulla elementum vel turpis at malesuada. Ut eleifend ornare ipsum, ac sagittis quam auctor ut.",
    isRecommend: true,
    price: 52.00,
  ),
  Product(
    name: 'Chaz Kangaroo Hoodie',
    category: 'Hoodies',
    imageUrl:
        'http://eimages.valtim.com/acme-images/product/m/h/mh01-gray_main.jpg',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed lacus purus. Suspendisse hendrerit at ipsum quis iaculis. Duis efficitur metus nibh, et accumsan enim feugiat sed. Quisque aliquet dolor ac efficitur rhoncus. Fusce tincidunt vitae mi in ultricies. Suspendisse vestibulum, tortor vitae elementum rhoncus, enim lorem aliquet turpis, sit amet vestibulum eros orci vel lacus. Aliquam erat volutpat. Proin viverra elit a tortor dignissim, vel pulvinar lacus sollicitudin. Nunc eget quam libero. Sed bibendum vel tellus sit amet lobortis. Etiam commodo purus elit. Proin nec suscipit nunc, sit amet rhoncus tellus. Nam accumsan nec massa vel hendrerit. Nulla elementum vel turpis at malesuada. Ut eleifend ornare ipsum, ac sagittis quam auctor ut.",
    isRecommend: true,
    price: 52.00,
  ),
  Product(
    name: 'Chaz Kangaroo Hoodie',
    category: 'Hoodies',
    imageUrl:
        'http://eimages.valtim.com/acme-images/product/m/h/mh01-gray_main.jpg',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed lacus purus. Suspendisse hendrerit at ipsum quis iaculis. Duis efficitur metus nibh, et accumsan enim feugiat sed. Quisque aliquet dolor ac efficitur rhoncus. Fusce tincidunt vitae mi in ultricies. Suspendisse vestibulum, tortor vitae elementum rhoncus, enim lorem aliquet turpis, sit amet vestibulum eros orci vel lacus. Aliquam erat volutpat. Proin viverra elit a tortor dignissim, vel pulvinar lacus sollicitudin. Nunc eget quam libero. Sed bibendum vel tellus sit amet lobortis. Etiam commodo purus elit. Proin nec suscipit nunc, sit amet rhoncus tellus. Nam accumsan nec massa vel hendrerit. Nulla elementum vel turpis at malesuada. Ut eleifend ornare ipsum, ac sagittis quam auctor ut.",
    isRecommend: true,
    price: 52.00,
  ),
];
