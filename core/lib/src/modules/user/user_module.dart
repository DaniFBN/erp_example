import 'package:global_dependencies/global_dependencies.dart';

import '../../../core.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/i_user_repository.dart';

class UserModule extends Module {
  @override
  List<Module> get imports => [ServiceModule()];

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IUserRepository>(UserRepository.new);
    i.addLazySingleton(UserStore.new);
  }
}
