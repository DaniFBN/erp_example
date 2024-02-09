import 'package:global_dependencies/global_dependencies.dart';

import '../repositories/i_user_repository.dart';
import 'user_state.dart';

class UserStore extends Store<UserState> {
  final IUserRepository _repository;

  UserStore(this._repository) : super(UserState.initState());

  bool get isAuthenticated => state is AuthenticatedUserState;

  Future<void> loadUser() async {
    setLoading(true);

    final response = await _repository.loadUser();

    response.fold(
      (user) => update(AuthenticatedUserState(user)),
      setError,
    );
  }

  Future<void> changeUser(String id) async {
    setLoading(true);

    final response = await _repository.getUser(id);

    response.fold(
      (user) => update(AuthenticatedUserState(user)),
      setError,
    );
  }

  Future<void> logout() async {
    setLoading(true);

    await _repository.logout();

    update(UserState.initState());
  }
}
