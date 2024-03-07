import '../../../../../core.dart';

class AppHttpException extends AppException {
  final int statusCode;

  AppHttpException(
    super.message, {
    required this.statusCode,
    required super.code,
  });
}

class CorsException extends AppException {
  CorsException(
    super.message, {
    required super.code,
  });
}
