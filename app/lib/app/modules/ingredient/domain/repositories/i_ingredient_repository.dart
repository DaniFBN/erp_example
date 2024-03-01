import 'package:core/core.dart';

import '../entities/ingredient_entity.dart';
import '../helpers/params/add_ingredient_param.dart';

abstract class IIngredientRepository {
  AsyncResult<List<IngredientEntity>> getIngredientsByEnterpriseID(
    int enterpriseID,
  );

  AsyncResult<IngredientEntity> add(AddIngredientParam param);
}
