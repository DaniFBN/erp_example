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
    if (param.name.isEmpty || param.name.contains(' ')) {
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

    return _repository.add(param);
  }
}
