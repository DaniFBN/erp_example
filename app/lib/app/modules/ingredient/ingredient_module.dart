import 'package:global_dependencies/global_dependencies.dart';

import '../../core/shared/services/http/dio_http_service.dart';
import '../../core/shared/services/http/i_http_service.dart';
import 'data/repositories/ingredient_repository.dart';
import 'domain/repositories/i_ingredient_repository.dart';
import 'domain/stores/add_ingredient_store.dart';
import 'domain/stores/ingredient_store.dart';
import 'ui/pages/add_ingredient/add_ingredient_page.dart';
import 'ui/pages/ingredients/ingredients_page.dart';

class IngredientModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IHttpService>(HttpService.new);
    i.addLazySingleton<IIngredientRepository>(IngredientRepository.new);
    i.addLazySingleton(IngredientStore.new);
    i.addLazySingleton(AddIngredientStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => IngredientsPage(
        ingredientStore: Modular.get(),
        themeStore: Modular.get(),
      ),
    );
    r.child(
      '/add',
      child: (_) => AddIngredientPage(
        addIngredientStore: Modular.get(),
      ),
    );
  }
}
