import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/stores/login_store.dart';
import '../components/login_form_component.dart';

class LoginTabletLayout extends StatelessWidget {
  final LoginStore loginStore;

  const LoginTabletLayout({
    super.key,
    required this.loginStore,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Responsive.size(900),
              padding: EdgeInsets.all(Responsive.size(32)),
              child: LoginFormComponent(loginStore: loginStore),
            ),
          ),
        ],
      ),
    );
  }
}
