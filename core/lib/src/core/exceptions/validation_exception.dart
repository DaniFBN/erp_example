import '../../../core.dart';

class ValidationException extends AppException {
  ValidationException(super.message, {required super.code});
}
