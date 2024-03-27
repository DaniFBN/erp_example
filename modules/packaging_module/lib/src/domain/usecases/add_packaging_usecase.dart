import 'package:core/core.dart';

import '../entities/packaging_entity.dart';
import '../helpers/params/add_packaging_param.dart';
import '../repositories/i_packaging_repository.dart';

abstract class IAddPackagingUsecase {
  AsyncResult<PackagingEntity> call(AddPackagingParam param);
}

class AddPackagingUsecase implements IAddPackagingUsecase {
  final IPackagingRepository _repository;

  const AddPackagingUsecase(this._repository);

  @override
  AsyncResult<PackagingEntity> call(AddPackagingParam param) async {
    if (param.enterpriseID <= 0) {
      return Failure(
        ValidationException('Invalid Enterprise ID',
            code: 'invalid-enterprise-code'),
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

    return _repository.add(param);
  }
}
