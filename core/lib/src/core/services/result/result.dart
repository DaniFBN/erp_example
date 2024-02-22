import '../../../../core.dart';

typedef AsyncResult<S> = Future<Result<S>>;

sealed class Result<S> {
  const Result();

  bool get isSuccess;
  bool get isFailure;

  void fold<T>(
    T Function(S value) onSuccess,
    T Function(AppException value) onFailure,
  );
}

class Failure<S> extends Result<S> {
  final AppException _value;

  const Failure(this._value);

  @override
  bool get isFailure => true;

  @override
  bool get isSuccess => false;

  @override
  void fold<T>(
    T Function(S value) onSuccess,
    T Function(AppException value) onFailure,
  ) {
    onFailure(_value);
  }
}

class Success<S extends Object> extends Result<S> {
  final S _value;

  const Success(this._value);

  @override
  bool get isFailure => false;

  @override
  bool get isSuccess => true;

  @override
  void fold<T>(
    T Function(S value) onSuccess,
    T Function(AppException value) onFailure,
  ) {
    onSuccess(_value);
  }
}
