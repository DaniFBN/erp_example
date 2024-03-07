import 'package:global_dependencies/global_dependencies.dart';
import 'package:packaging_module/src/domain/usecases/get_packaging_by_enterprise_usecase.dart';

import '../../domain/entities/packaging_entity.dart';

class PackagingStore extends Store<List<PackagingEntity>> {
  final IGetPackagingByEnterprise _getPackagingByEnterprise;

  PackagingStore(this._getPackagingByEnterprise) : super(const []);

  Future<void> getPackagingByEnterprise(int enterpriseID) async {
    setLoading(true);

    final response = await _getPackagingByEnterprise(
      enterpriseID,
    );

    response.fold(update, setError);
  }
}
