import 'package:core/core.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../entities/ingredient_entity.dart';
import '../repositories/i_ingredient_repository.dart';

class IngredientStore extends Store<List<IngredientEntity>> {
  final IIngredientRepository _repository;

  IngredientStore(this._repository) : super(const []);

  Future<void> getIngredientsByEnterprise(int enterpriseID) async {
    setLoading(true);

    final ingredients = List.generate(
      5,
      (index) => IngredientEntity(
        id: index,
        enterpriseID: enterpriseID,
        name: 'name',
        description: 'name',
        price: 20,
        amount: 1,
        unitMeasurement: UnitMeasurement.g,
      ),
    );
    return update(ingredients);

    final response = await _repository.getIngredientsByEnterpriseID(
      enterpriseID,
    );

    response.fold(update, setError);
  }
}
