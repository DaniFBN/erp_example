import 'package:core/core.dart';

class AddIngredientParam {
  final int enterpriseID;
  final String name;
  final String description;
  final double price;
  final double amount;
  final UnitMeasurement unitMeasurement;

  const AddIngredientParam({
    required this.enterpriseID,
    required this.name,
    required this.description,
    required this.price,
    required this.amount,
    required this.unitMeasurement,
  });
}
