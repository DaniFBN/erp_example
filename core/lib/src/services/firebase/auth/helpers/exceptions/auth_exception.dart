import '../../../../../exceptions/app_exception.dart';

class AuthException extends AppException {
  AuthException(
    super.message, {
    required super.code,
    super.stackTrace,
    super.innerException,
    super.innerStacktrace,
  });
}
