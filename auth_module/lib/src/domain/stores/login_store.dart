import 'dart:async';

import 'package:global_dependencies/global_dependencies.dart';

import '../repositories/i_auth_repository.dart';
import 'events/login_event.dart';
import 'states/login_state.dart';

class LoginStore extends Bloc<LoginEvent, LoginState> {
  final IAuthRepository _repository;

  LoginStore(this._repository) : super(LoginState.initState()) {
    on<SubmitLoginEvent>(_login);
  }

  Future<void> _login(SubmitLoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoadingLoginState());

    final response = await _repository.login(event.email, event.password);

    response.fold(
      (value) => emit(SuccessLoginState(value.userID)),
      (e) => emit(ErrorLoginState(e)),
    );
  }
}
