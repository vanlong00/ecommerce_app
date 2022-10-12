import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String title;
  final String imgUrl;

  const Category({
    required this.id,
    required this.title,
    required this.imgUrl,
  });

  factory Category.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Category(
      id: snapshot.id,
      title: data['title'],
      imgUrl: data['imgUrl'],
    );
  }

  @override
  List<Object?> get props => [id,title, imgUrl];
}

// List<Category> listCategories = const [
//   Category(title: 'Man shirt', imgUrl: 'assets/icons/Tshirt.png'),
//   Category(title: 'Woman shirt', imgUrl: 'assets/icons/woman tshirt.png'),
// ];
