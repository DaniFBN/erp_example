import 'package:core/core.dart';

import '../entities/packaging_entity.dart';
import '../repositories/i_packaging_repository.dart';

abstract class IGetPackagingByEnterprise {
  AsyncResult<List<PackagingEntity>> call(int enterpriseID);
}

class GetPackagingByEnterprise implements IGetPackagingByEnterprise {
  final IPackagingRepository _repository;

  const GetPackagingByEnterprise(this._repository);

  @override
  AsyncResult<List<PackagingEntity>> call(int enterpriseID) async {
    return _repository.getPackagingByEnterpriseID(enterpriseID);
  }
}
