import 'dart:io';

import 'package:flutter/foundation.dart';

class AppException implements Exception {
  AppException(
    this.message, {
    required this.code,
    this.innerException,
    this.innerStacktrace,
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.current {
    if (!kIsWeb) {
      final isTest = Platform.environment.containsKey('FLUTTER_TEST');

      if (isTest) return;
    }

    debugPrintStack(stackTrace: innerStacktrace ?? stackTrace);
  }

  final String message;
  final String code;
  final StackTrace stackTrace;
  final Object? innerException;
  final StackTrace? innerStacktrace;

  @override
  String toString() {
    return message;
  }
}
