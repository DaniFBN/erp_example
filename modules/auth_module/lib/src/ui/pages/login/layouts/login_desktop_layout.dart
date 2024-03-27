// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/stores/login_store.dart';
import '../components/login_form_component.dart';

class LoginDesktopLayout extends StatelessWidget {
  final LoginStore loginStore;

  const LoginDesktopLayout({
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
              width: Responsive.size(1200),
              padding: EdgeInsets.all(Responsive.size(40)),
              child: LoginFormComponent(loginStore: loginStore),
            ),
          ),
        ],
      ),
    );
  }
}
