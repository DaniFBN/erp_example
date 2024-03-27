import 'package:core/core.dart';

import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/responses/login_response.dart';

class AuthRepository extends Repository implements IAuthRepository {
  final IAuthService _authService;

  const AuthRepository(this._authService);

  @override
  AsyncResult<LoginResponse> login(String email, String password) async {
    return await execute(() async {
      final response = await _authService.login(email, password);

      return LoginResponse(response.id);
    });
  }
}
