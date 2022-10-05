class Category {
  final String name;
  final String? imageUrl;

  Category({
    required this.name,
    required this.imageUrl,
  });
}

List<Category> listCategories = [
  Category(name: 'Hoodies', imageUrl: ''),
  Category(name: 'T-shirt', imageUrl: null),
  Category(name: 'Hoodies', imageUrl: ''),
  Category(name: 'T-shirt', imageUrl: ''),
  Category(name: 'Hoodies', imageUrl: ''),
];
