import '../../domain/entities/packaging_entity.dart';
import '../../domain/helpers/params/add_packaging_param.dart';

class PackagingMapper {
  static PackagingEntity fromMap(Map<String, dynamic> map) {
    return PackagingEntity(
      id: map['id'],
      enterpriseID: map['enterpriseId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      amount: map['amount'],
    );
  }

  static Map<String, dynamic> addToMap(AddPackagingParam param) {
    return {
      'enterpriseId': param.enterpriseID,
      'name': param.name,
      'description': param.description,
      'price': param.price,
      'amount': param.amount,
    };
  }
}
