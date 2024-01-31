import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/login_form_component.dart';

class LoginDesktopLayout extends StatelessWidget {
  const LoginDesktopLayout({super.key});

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
              child: const LoginFormComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
