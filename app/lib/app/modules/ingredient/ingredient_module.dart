import 'package:global_dependencies/global_dependencies.dart';

import '../../core/shared/services/http/i_http_service.dart';
import 'data/repositories/ingredient_repository.dart';
import 'domain/repositories/i_ingredient_repository.dart';
import 'domain/stores/ingredient_store.dart';
import 'ui/pages/ingredients/ingredients_page.dart';

class IngredientModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IHttpService>(HttpService.new);
    i.addLazySingleton<IIngredientRepository>(IngredientRepository.new);
    i.addLazySingleton(IngredientStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => IngredientsPage(
        ingredientStore: Modular.get(),
      ),
    );
  }
}
