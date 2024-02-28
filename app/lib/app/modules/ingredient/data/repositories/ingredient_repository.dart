import 'package:core/core.dart';

import '../../../../core/shared/services/http/i_http_service.dart';
import '../../domain/entities/ingredient_entity.dart';
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
}
