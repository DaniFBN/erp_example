import 'package:core/core.dart';

import '../entities/ingredient_entity.dart';

abstract class IIngredientRepository {
  AsyncResult<List<IngredientEntity>> getIngredientsByEnterpriseID(
    int enterpriseID,
  );
}
