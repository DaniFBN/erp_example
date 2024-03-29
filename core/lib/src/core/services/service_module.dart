import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../../../core.dart';
import 'firebase/auth/_auth_service.dart';
import 'http/dio_http_service.dart';
import 'snack_bar/scaffold_messenger_snack_bar_service.dart';

class ServiceModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<Dio>(
      () => Dio(
        BaseOptions(baseUrl: 'http://localhost:3000'),
      ),
    );
    i.addLazySingleton<IHttpService>(DioHttpService.new);
    i.addLazySingleton<ISnackBarService>(ScaffoldMessengerSnackBarService.new);
    i.addInstance(FirebaseAuth.instance);
    i.addLazySingleton(EmailProvider.new);
    i.addLazySingleton<IAuthService>(FirebaseAuthService.new);
  }
}
