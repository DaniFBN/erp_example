import '../../../../services/firebase/auth/_auth_service.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserMapper {
  static UserEntity fromUserAuth(UserAuthModel user) {
    return UserEntity(id: user.id, email: user.email!);
  }
}
