import 'package:ecommerce_app/data/models/variant.dart';

class Cart{
  List<Variant> items;

  Cart({required this.items});

  double get totalPrice {
    return items.fold(0, (total, current) => total + current.price * current.quantity);
  }

  int get quantity {
    return items.fold(0, (total, current) => total + current.quantity);
  }
}

