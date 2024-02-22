import 'dart:async';

import 'package:global_dependencies/global_dependencies.dart';

import '../../../core.dart';

class NotCanBeAuthenticatedGuard extends RouteGuard {
  NotCanBeAuthenticatedGuard() : super(redirectTo: '/home/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final userStore = Modular.get<UserStore>();

    return !userStore.isAuthenticated;
  }
}
