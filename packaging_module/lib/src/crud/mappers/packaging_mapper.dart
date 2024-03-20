import 'package:core/core.dart';

import '../../domain/entities/packaging_entity.dart';
import '../../domain/helpers/params/add_packaging_param.dart';

class PackagingMapper extends Mapper<PackagingEntity, AddPackagingParam> {
  @override
  PackagingEntity fromMap(Map<String, dynamic> data) {
    return PackagingEntity(
      id: data['id'],
      enterpriseID: data['enterpriseId'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      amount: data['amount'],
    );
  }

  @override
  Map<String, dynamic> addToMap(AddPackagingParam param) {
    return {
      'enterpriseId': param.enterpriseID,
      'name': param.name,
      'description': param.description,
      'price': param.price.toString(),
      'amount': param.amount,
    };
  }

  @override
  Map<String, dynamic> updateToMap(PackagingEntity param) {
    return {
      'enterpriseId': param.enterpriseID,
      'name': param.name,
      'description': param.description,
      'price': param.price,
      'amount': param.amount,
    };
  }
}
