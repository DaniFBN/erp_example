import 'package:global_dependencies/global_dependencies.dart';

import '../../../core.dart';

class ThemeModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(ThemeStore.new);
  }
}
