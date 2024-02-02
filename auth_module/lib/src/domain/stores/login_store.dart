import 'package:flutter_bloc/flutter_bloc.dart';

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

    try {
      final response = await _repository.login(event.email, event.password);

      emit(SuccessLoginState(response.userID));
    } catch (e) {
      emit(ErrorLoginState(e.toString()));
    }
  }
}
