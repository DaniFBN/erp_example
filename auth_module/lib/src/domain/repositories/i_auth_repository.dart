import '../responses/login_response.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(String email, String password);
}
