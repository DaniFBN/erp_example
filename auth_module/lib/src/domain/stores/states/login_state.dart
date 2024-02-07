// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';

sealed class LoginState {
  const LoginState();

  factory LoginState.initState() {
    return const InitialLoginState();
  }
}

class InitialLoginState extends LoginState {
  const InitialLoginState();
}

class ErrorLoginState extends LoginState {
  final AppException exception;

  const ErrorLoginState(this.exception);
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class SuccessLoginState extends LoginState {
  final String userID;

  const SuccessLoginState(this.userID);
}
