import '../_auth_service.dart';

abstract class AuthProvider {
  Future<void> logout();
  Future<UserAuthModel> login(String email, String password);
  Future<UserAuthModel> getCurrentUser();
}
