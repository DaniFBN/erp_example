import 'package:core/core.dart';

import '../responses/login_response.dart';

abstract class IAuthRepository {
  AsyncResult<LoginResponse> login(String email, String password);
}
