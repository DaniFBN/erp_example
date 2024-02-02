import 'package:core/core.dart';

import '../auth_module.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/stores/login_store.dart';

class AuthRoutes {
  static final routes = {
    '/login': (context) => LoginPage(
          loginStore: LoginStore(AuthRepository()),
          snackBarService: snackBarService,
        ),
  };
}
