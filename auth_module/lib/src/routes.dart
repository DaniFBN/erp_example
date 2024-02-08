import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../auth_module.dart';
import 'ui/pages/login/di_login_widget.dart';

class AuthRoutes {
  static final routes = {
    '/login': (BuildContext context) => DiLoginWidget(
          builder: (context) {
            return LoginPage(
              loginStore: context.read(),
              snackBarService: context.read(),
              userStore: context.read(),
            );
          },
        ),
  };
}
