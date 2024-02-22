import 'package:core/core.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../auth_module.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/repositories/i_auth_repository.dart';
import 'domain/stores/login_store.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [ServiceModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);
    i.addLazySingleton(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/login',
      child: (context) => LoginPage(
        loginStore: Modular.get(),
        snackBarService: Modular.get(),
        userStore: Modular.get(),
      ),
    );
  }
}
