import 'package:core/core.dart';

import '../../domain/entities/ingredient_entity.dart';
import '../../domain/repositories/i_ingredient_repository.dart';

class IngredientRepository extends Repository implements IIngredientRepository {
  @override
  AsyncResult<List<IngredientEntity>> getIngredientsByEnterpriseID(
    int enterpriseID,
  ) async {
    return await execute(() async {
      // final response = await _authService.login(email, password);

      // return LoginResponse(response.id);
    });
  }
}
