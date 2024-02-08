import 'dart:async';

import '../../../core.dart';

abstract class Repository {
  const Repository();

  AsyncResult<T> execute<T extends Object>(
    FutureOr<T> Function() callback,
  ) async {
    try {
      final response = await callback();

      return Success(response);
    } on AppException catch (e) {
      return Failure(e);
    }
  }
}
