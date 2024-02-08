import '../../../../../core.dart';
import '../entities/user_entity.dart';

abstract class IUserRepository {
  AsyncResult<UserEntity> loadUser();
  AsyncResult<UserEntity> getUser(String id);
  AsyncResult<bool> logout();
}
