import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/login_form_component.dart';

class LoginTabletLayout extends StatelessWidget {
  const LoginTabletLayout({super.key});

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
              child: const LoginFormComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
