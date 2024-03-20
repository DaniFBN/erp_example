import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:packaging_module/src/domain/entities/packaging_entity.dart';
import 'package:packaging_module/src/domain/helpers/params/add_packaging_param.dart';

class PackagingRepositoryMock extends Mock
    implements ICrudRepository<PackagingEntity, AddPackagingParam> {}

class PackagingEntityMock extends Mock implements PackagingEntity {}

class AppExceptionMock extends Mock implements AppException {}

class AddPackagingParamMock extends Mock implements AddPackagingParam {}

class HttpDataFake extends Fake implements HttpData {}

class HttpServiceMock extends Mock implements IHttpService {}

class HttpExceptionMock extends Mock implements AppHttpException {
  @override
  String get code => '';
}
