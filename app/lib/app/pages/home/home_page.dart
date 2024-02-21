import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'layouts/home_desktop_layout.dart';
import 'layouts/home_mobile_layout.dart';
import 'layouts/home_tablet_layout.dart';

class HomePage extends StatelessWidget {
  final UserStore userStore;
  final IntlStore intlStore;
  final ThemeStore themeStore;

  const HomePage({
    super.key,
    required this.userStore,
    required this.intlStore,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: HomeMobileLayout(
        themeStore: themeStore,
      ),
      tablet: HomeTabletLayout(
        userStore: userStore,
        themeStore: themeStore,
      ),
      desktop: HomeDesktopLayout(
        intlStore: intlStore,
        userStore: userStore,
        themeStore: themeStore,
      ),
    );
  }
}
