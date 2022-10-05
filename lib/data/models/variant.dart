import 'package:equatable/equatable.dart';

class Variant extends Equatable{
  final String skuID;
  final double price;
  final String size;

  const Variant({
    required this.skuID,
    required this.price,
    required this.size,
  });
  
  @override
  List<Object?> get props => [skuID,price,size];
}
