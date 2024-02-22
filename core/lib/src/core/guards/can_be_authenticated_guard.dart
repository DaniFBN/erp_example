import 'dart:async';

import 'package:global_dependencies/global_dependencies.dart';

import '../../../core.dart';

class CanBeAuthenticatedGuard extends RouteGuard {
  CanBeAuthenticatedGuard() : super(redirectTo: '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final userStore = Modular.get<UserStore>();

    await userStore.loadUser();

    return userStore.isAuthenticated;
  }
}
