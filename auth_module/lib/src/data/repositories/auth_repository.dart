import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/responses/login_response.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<LoginResponse> login(String email, String password) async {
    if (email != 'daniel.noronha@fteam.dev') {
      throw 'Usuario inválido';
    }
    if (password != '12345678A') {
      throw 'Senha inválida';
    }

    await Future.delayed(const Duration(seconds: 1));

    return const LoginResponse('whatever');
  }
}
