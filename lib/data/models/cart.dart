import 'package:ecommerce_app/data/models/promotion.dart';
import 'package:ecommerce_app/data/models/variant.dart';
import 'package:equatable/equatable.dart';

class Cart with EquatableMixin {
  List<Variant> items;
  Promotion? promotion;

  Cart({required this.items, this.promotion});

  double get totalPrice {
    return totalPriceItems - totalPromotion;
  }

  double get totalPromotion {
    if (promotion == null) {
      return totalPriceItems * 0;
    } else {
      return totalPriceItems * promotion!.value;
    }
  }

  double get totalPriceItems {
    return items.fold(
        0, (total, current) => total + current.price * current.quantity);
  }

  int get quantity {
    return items.fold(0, (total, current) => total + current.quantity);
  }

  set setPromotion(Promotion? promote) {
    promotion = promote;
  }

  @override
  List<Object?> get props => [items, promotion];
}
