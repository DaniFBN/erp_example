import 'package:core/core.dart';

import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/responses/login_response.dart';

class AuthRepository implements IAuthRepository {
  final AuthService _authService;

  const AuthRepository(this._authService);

  @override
  AsyncResult<LoginResponse> login(String email, String password) async {
    try {
      final response = await _authService.login(email, password);

      return Success(LoginResponse(response.id));
    } on AppException catch (e) {
      return Failure(e);
    }
  }
}

