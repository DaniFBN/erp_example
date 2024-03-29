import '../../../../core.dart';

typedef AsyncResult<S> = Future<Result<S>>;

T id<T>(T value) => value;

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
  T fold<T>(
    T Function(S value) onSuccess,
    T Function(AppException value) onFailure,
  ) {
    return onFailure(_value);
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
  T fold<T>(
    T Function(S value) onSuccess,
    T Function(AppException value) onFailure,
  ) {
    return onSuccess(_value);
  }
}
