// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String error;
  // TODO(danifbn): Armazenar o erro
  const ErrorLoginState(this.error);
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class SuccessLoginState extends LoginState {
  final String userID;

  const SuccessLoginState(this.userID);
}
