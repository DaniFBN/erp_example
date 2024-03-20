import 'package:flutter/material.dart';

import '../../../../core.dart';

abstract class ICreateUsecase<R, P> {
  AsyncResult<R> call(P param);
}

class CreateUsecase<R, P> implements ICreateUsecase<R, P> {
  final ICrudRepository<R, P> _repository;

  const CreateUsecase(this._repository);

  @override
  @mustCallSuper
  AsyncResult<R> call(P param) {
    return _repository.create(param);
  }
}
