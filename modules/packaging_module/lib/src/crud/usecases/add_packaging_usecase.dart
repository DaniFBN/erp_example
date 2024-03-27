import 'package:core/core.dart';

import '../../domain/entities/packaging_entity.dart';
import '../../domain/helpers/params/add_packaging_param.dart';

abstract class IAddPackagingUsecase
    extends CreateUsecase<PackagingEntity, AddPackagingParam> {
  const IAddPackagingUsecase(super.repository);

  @override
  AsyncResult<PackagingEntity> call(AddPackagingParam param);
}

class AddPackagingUsecase extends IAddPackagingUsecase {
  const AddPackagingUsecase(super._repository);

  @override
  AsyncResult<PackagingEntity> call(AddPackagingParam param) async {
    if (param.enterpriseID <= 0) {
      return Failure(
        ValidationException(
          'Invalid Enterprise ID',
          code: 'invalid-enterprise-code',
        ),
      );
    }

    if (param.name.trim().isEmpty || !param.name.trim().contains(' ')) {
      return Failure(
        ValidationException('Name required', code: 'invalid-name'),
      );
    }

    if (param.description.isEmpty) {
      return Failure(
        ValidationException(
          'Description required',
          code: 'invalid-description',
        ),
      );
    }

    if (param.price <= 0) {
      return Failure(
        ValidationException(
          'Price required',
          code: 'invalid-description',
        ),
      );
    }

    if (param.amount <= 0) {
      return Failure(
        ValidationException(
          'Amount required',
          code: 'invalid-description',
        ),
      );
    }

    return super.call(param);
  }
}
