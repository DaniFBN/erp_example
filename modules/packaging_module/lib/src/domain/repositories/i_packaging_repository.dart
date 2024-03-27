import 'package:core/core.dart';

import '../entities/packaging_entity.dart';
import '../helpers/params/add_packaging_param.dart';

abstract class IPackagingRepository {
  AsyncResult<List<PackagingEntity>> getPackagingByEnterpriseID(
    int enterpriseID,
  );
  AsyncResult<PackagingEntity> add(AddPackagingParam param);
}
