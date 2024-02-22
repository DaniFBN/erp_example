import 'package:global_dependencies/global_dependencies.dart';

import '../../../core.dart';

class IntlModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(IntlStore.new);
  }
}
