import '../../../../../core.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../mappers/user_mapper.dart';

class UserRepository extends Repository implements IUserRepository {
  final IAuthService _authService;

  const UserRepository(this._authService);

  @override
  AsyncResult<UserEntity> getUser(String id) async {
    return await execute<UserEntity>(() async {
      final user = await _authService.getCurrentUser();

      return UserMapper.fromUserAuth(user);
    });
  }

  @override
  AsyncResult<UserEntity> loadUser() async {
    return await execute<UserEntity>(() async {
      final user = await _authService.getCurrentUser();

      return UserMapper.fromUserAuth(user);
    });
  }

  @override
  AsyncResult<bool> logout() async {
    return await execute<bool>(() async {
      await _authService.logout();

      return true;
    });
  }
}
