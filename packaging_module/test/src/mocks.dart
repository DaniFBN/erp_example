import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:packaging_module/src/domain/entities/packaging_entity.dart';
import 'package:packaging_module/src/domain/repositories/i_packaging_repository.dart';


class PackagingRepositoryMock extends Mock implements IPackagingRepository {}

class PackagingEntityMock extends Mock implements PackagingEntity {}

class AppExceptionMock extends Mock implements AppException {}
