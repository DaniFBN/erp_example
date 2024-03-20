import 'package:core/core.dart';
import 'package:global_dependencies/global_dependencies.dart';

import 'crud/usecases/add_packaging_usecase.dart';
import 'crud/usecases/get_packaging_by_enterprise_usecase.dart';
import 'crud/mappers/packaging_mapper.dart';
import 'domain/entities/packaging_entity.dart';
import 'domain/helpers/params/add_packaging_param.dart';
import 'ui/pages/add_packaging/add_packaging_page.dart';
import 'ui/pages/packagings/packagings_page.dart';
import 'ui/stores/add_packaging_store.dart';
import 'ui/stores/packaging_store.dart';

class PackagingModule extends Module {
  @override
  final List<Module> imports = [
    ServiceModule(),
  ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<ICrudRepository<PackagingEntity, AddPackagingParam>>(
      () => CrudRepository<PackagingEntity, AddPackagingParam>(
        http: Modular.get(),
        config: const CrudConfig.sameUrl('/packaging'),
        mapper: PackagingMapper(),
      ),
    );
    i.addLazySingleton<IAddPackagingUsecase>(AddPackagingUsecase.new);
    i.addLazySingleton<IGetPackagingByEnterprise>(GetPackagingByEnterprise.new);
    i.addLazySingleton(PackagingStore.new);
    i.addLazySingleton(AddPackagingStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => PackagingsPage(
        packagingStore: Modular.get(),
        themeStore: Modular.get(),
      ),
    );
    r.child(
      '/add',
      child: (_) => AddPackagingPage(
        addPackagingStore: Modular.get(),
        snackBarService: Modular.get(),
        packagingStore: Modular.get(),
      ),
    );
  }
}
