import 'package:core/core.dart';

import '../../domain/entities/packaging_entity.dart';
import '../../domain/helpers/params/add_packaging_param.dart';
import '../../domain/repositories/i_packaging_repository.dart';
import '../mappers/packaging_mapper.dart';

class PackagingRepository extends Repository implements IPackagingRepository {
  final IHttpService _http;

  const PackagingRepository(this._http);

  @override
  AsyncResult<List<PackagingEntity>> getPackagingByEnterpriseID(
    int enterpriseID,
  ) async {
    return await execute<List<PackagingEntity>>(() async {
      final response = await _http.get('/packaging?enterprise=$enterpriseID');
      final data = List<Map<String, dynamic>>.from(response.data);

      final packaging = data.map(PackagingMapper.fromMap).toList();

      return packaging;
    });
  }

  @override
  AsyncResult<PackagingEntity> add(AddPackagingParam param) async {
    return await execute<PackagingEntity>(() async {
      final response = await _http.post(
        '/packaging',
        data: PackagingMapper.addToMap(param),
      );
      final data = Map<String, dynamic>.from(response.data);

      final packaging = PackagingMapper.fromMap(data);

      return packaging;
    });
  }
}
