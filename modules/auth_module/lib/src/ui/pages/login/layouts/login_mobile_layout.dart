import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/stores/login_store.dart';
import '../components/login_form_component.dart';

class LoginMobileLayout extends StatelessWidget {
  final LoginStore loginStore;

  const LoginMobileLayout({
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
            child: Padding(
              padding: EdgeInsets.all(Responsive.size(20)),
              child: LoginFormComponent(loginStore: loginStore),
            ),
          ),
        ],
      ),
    );
  }
}
