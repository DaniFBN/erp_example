import 'package:auth_module/src/domain/repositories/i_auth_repository.dart';
import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

class AppExceptionMock extends Mock implements AppException {}
