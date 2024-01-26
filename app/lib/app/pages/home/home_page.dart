import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'layouts/home_desktop_layout.dart';
import 'layouts/home_mobile_layout.dart';
import 'layouts/home_tablet_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DsLayoutResolver(
      mobile: HomeMobileLayout(),
      tablet: HomeTabletLayout(),
      desktop: HomeDesktopLayout(),
    );
  }
}
