import 'package:flutter/material.dart';

import '../../../../core.dart';

abstract class IReadUsecase<R, P> {
  AsyncResult<List<R>> call(GetParam param);
}

class ReadUsecase<R, P> implements IReadUsecase<R, P> {
  final ICrudRepository<R, P> _repository;

  const ReadUsecase(this._repository);

  @override
  @mustCallSuper
  AsyncResult<List<R>> call(GetParam param) {
    return _repository.read(param);
  }
}
