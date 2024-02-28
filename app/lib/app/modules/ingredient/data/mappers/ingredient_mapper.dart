import '../../../../core/shared/enums/unit_measurement_enum.dart';
import '../../domain/entities/ingredient_entity.dart';

class IngredientMapper {
  static IngredientEntity fromMap(Map<String, dynamic> map) {
    return IngredientEntity(
      id: map['id'],
      enterpriseID: map['enterpriseId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      amount: map['amount'],
      unitMeasurement: UnitMeasurement.fromCode(map['unitMeasurement']),
    );
  }
}
