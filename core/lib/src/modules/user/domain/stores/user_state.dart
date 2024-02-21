import '../entities/user_entity.dart';

sealed class UserState {
  final UserEntity? user;

  const UserState(this.user);

  factory UserState.initState() {
    return const UnauthenticatedUserState();
  }
}

class AuthenticatedUserState extends UserState {
  const AuthenticatedUserState(UserEntity super.user);
}

class UnauthenticatedUserState extends UserState {
  const UnauthenticatedUserState() : super(null);
}
