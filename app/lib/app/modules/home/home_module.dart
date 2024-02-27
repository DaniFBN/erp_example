import 'package:global_dependencies/global_dependencies.dart';

import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => HomePage(
        userStore: Modular.get(),
        intlStore: Modular.get(),
        themeStore: Modular.get(),
      ),
    );
  }
}
