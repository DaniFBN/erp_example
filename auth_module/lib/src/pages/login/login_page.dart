import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'layouts/login_desktop_layout.dart';
import 'layouts/login_mobile_layout.dart';
import 'layouts/login_tablet_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DsLayoutResolver(
      mobile: LoginMobileLayout(),
      tablet: LoginTabletLayout(),
      desktop: LoginDesktopLayout(),
    );
  }
}
