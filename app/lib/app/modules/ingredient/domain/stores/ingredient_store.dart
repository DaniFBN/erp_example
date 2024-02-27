import 'package:global_dependencies/global_dependencies.dart';

import '../entities/ingredient_entity.dart';
import '../repositories/i_ingredient_repository.dart';

class IngredientStore extends Store<List<IngredientEntity>> {
  final IIngredientRepository _repository;

  IngredientStore(this._repository) : super(const []);

  Future<void> getIngredientsByEnterprise(int enterpriseID) async {
    setLoading(true);

    final response = await _repository.getIngredientsByEnterpriseID(
      enterpriseID,
    );

    response.fold(update, setError);
  }
}
