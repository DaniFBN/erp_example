import 'package:auth_module/auth_module.dart';
import 'package:core/core.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:ingredient_module/ingredient_module.dart';

import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        IntlModule(),
        ThemeModule(),
        ServiceModule(),
        UserModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => SplashPage(userStore: Modular.get()));
    r.module(
      '/',
      module: AuthModule(),
      guards: [NotCanBeAuthenticatedGuard()],
    );
    r.module(
      '/home',
      module: HomeModule(),
      guards: [CanBeAuthenticatedGuard()],
    );
    r.module(
      '/ingredients',
      module: IngredientModule(),
      guards: [CanBeAuthenticatedGuard()],
    );
  }
}
