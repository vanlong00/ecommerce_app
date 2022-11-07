import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Promotion extends Equatable {
  final String code;
  final String name;
  final double value;

  const Promotion({
    required this.code,
    required this.name,
    required this.value
  });

  factory Promotion.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Promotion(
      code: data['code'],
      name: data['name'],
      value: data['value'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [code, name, value];
}