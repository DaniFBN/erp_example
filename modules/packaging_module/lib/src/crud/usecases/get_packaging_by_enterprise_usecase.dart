import 'package:core/core.dart';

import '../../domain/entities/packaging_entity.dart';
import '../../domain/helpers/params/add_packaging_param.dart';

abstract class IGetPackagingByEnterprise
    extends ReadUsecase<PackagingEntity, AddPackagingParam> {
  const IGetPackagingByEnterprise(super._repository);

  @override
  AsyncResult<List<PackagingEntity>> call(GetParam param);
}

class GetPackagingByEnterprise extends IGetPackagingByEnterprise {
  const GetPackagingByEnterprise(super._repository);
}
