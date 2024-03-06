import 'package:core/core.dart';

import '../../domain/entities/ingredient_entity.dart';
import '../../domain/helpers/params/add_ingredient_param.dart';
import '../../domain/repositories/i_ingredient_repository.dart';
import '../mappers/ingredient_mapper.dart';

class IngredientRepository extends Repository implements IIngredientRepository {
  final IHttpService _http;

  const IngredientRepository(this._http);

  @override
  AsyncResult<List<IngredientEntity>> getIngredientsByEnterpriseID(
    int enterpriseID,
  ) async {
    return await execute<List<IngredientEntity>>(() async {
      final response = await _http.get('/ingredients?enterprise=$enterpriseID');
      final data = List<Map<String, dynamic>>.from(response.data);

      // tearoff -> Passar uma função por referencia

      // Function é um tipo
      // Toda Function tem uma "assinatura" -> IngredientEntity Function(Map<String, dynamic>)
      // Se um método, e ele espera uma Function, você pode passar uma Function com a mesma assinatura
      final ingredients = data.map(IngredientMapper.fromMap).toList();

      return ingredients;
    });
  }

  @override
  AsyncResult<IngredientEntity> add(AddIngredientParam param) async {
    return await execute<IngredientEntity>(() async {
      final response = await _http.post(
        '/ingredients',
        data: IngredientMapper.addToMap(param),
      );
      final data = Map<String, dynamic>.from(response.data);

      final ingredient = IngredientMapper.fromMap(data);

      return ingredient;
    });
  }
}
