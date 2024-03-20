import 'dart:async';

import '../../../core.dart';

abstract class Repository {
  const Repository();

  AsyncResult<T> execute<T extends Object>(
    FutureOr<T> Function() callback, {
    String? notFoundMessage,
  }) async {
    try {
      final response = await callback();

      return Success(response);
    } on AppHttpException catch (e) {
      if (e.statusCode == 404) {
        return Failure(
          AppException(notFoundMessage ?? e.message, code: e.code),
        );
      }

      return Failure(e);
    } on AppException catch (e) {
      return Failure(e);
    }
  }
}
