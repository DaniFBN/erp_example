import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/login_form_component.dart';

class LoginMobileLayout extends StatelessWidget {
  const LoginMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(Responsive.size(20)),
              child: const LoginFormComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
