import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'layouts/home_desktop_layout.dart';
import 'layouts/home_mobile_layout.dart';
import 'layouts/home_tablet_layout.dart';

class HomePage extends StatelessWidget {
  final UserStore userStore;

  const HomePage({super.key, required this.userStore});

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: const HomeMobileLayout(),
      tablet: HomeTabletLayout(userStore: userStore),
      desktop: HomeDesktopLayout(userStore: userStore),
    );
  }
}
