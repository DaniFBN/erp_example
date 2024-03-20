import 'package:core/core.dart';

import '../../domain/entities/ingredient_entity.dart';
import '../../domain/helpers/params/add_ingredient_param.dart';

class IngredientMapper {
  static IngredientEntity fromMap(Map<String, dynamic> map) {
    return IngredientEntity(
      id: map['id'],
      enterpriseID: map['enterpriseId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      amount: map['amount'],
      unitMeasurement: UnitMeasurement.values.byName(map['unitMeasurement']),
    );
  }

  static Map<String, dynamic> addToMap(AddIngredientParam param) {
    return {
      'enterpriseId': param.enterpriseID,
      'name': param.name,
      'description': param.description,
      'price': param.price.toString(),
      'amount': param.amount,
      'unitMeasurement': param.unitMeasurement.name,
    };
  }
}
